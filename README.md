# ProgettoRetiLogiche_2024 - Fixed-Point Sine Calculator

![language](https://img.shields.io/badge/language-VHDL-4B0082?style=flat-square)
![Politecnico di Milano](https://img.shields.io/badge/Politecnico%20di%20Milano-Reti%20Logiche-lightgrey?style=flat-square)

VHDL module that computes the sine of an integer angle from 0 to 359 degrees and returns it as a
10-bit fixed-point value, using a first-quadrant lookup table, linear interpolation and
trigonometric symmetry.

- Course: Reti Logiche (Digital Logic Design)
- Academic year: 2023/2024
- Language: VHDL

## Authors

- Alessandro Marina (alessandro.marina@mail.polimi.it)
- Ashvinder Singh (ashvinder.singh@mail.polimi.it)

## Implementation status

Legend:

- 🟢: Implemented
- 🟡: Work in progress
- 🔴: Not implemented

| Feature                   | Status |
|---------------------------|--------|
| Fixed-point sine function | 🟢     |

| Component           | Role                                                  | Status |
|---------------------|-------------------------------------------------------|--------|
| `FA`                | Full adder, 1 bit                                     | 🟢     |
| `RCA`               | Ripple-carry adder built from `FA` instances          | 🟢     |
| `SUB`               | Subtractor (`RCA` with inverted operand, carry-in 1)  | 🟢     |
| `COMPARATOR`        | Unsigned `A > B`, sign bit of a `SUB`                 | 🟢     |
| `INTERPOLATOR`      | Linear interpolator between two table entries         | 🟢     |
| `ANGLE_SINE_MAPPER` | First-quadrant lookup table and interpolation         | 🟢     |
| `SINE_CALCULATOR`   | Top level: quadrant folding, sign and output register | 🟢     |

## Overview

The module takes an angle in degrees, encoded in natural binary, and returns its sine. The result
lies in `[-1, 1]`, so it is encoded as a signed fixed-point number.

The arithmetic is built bottom-up from a 1-bit full adder. The adder, subtractor, comparator and
interpolation multiplier are all made of `FA` instances, and no signal in `src/` goes through an
arithmetic or comparison operator. Selection logic is written as AND/OR gates. The only
behavioural code is the output register and the constant lookup table.

`SINE` is registered on the rising edge of `CLK`, one cycle after `ANGLE`. `RST` is a synchronous,
active-high reset that clears the output.

## Numeric format

The output is a 10-bit signed fixed-point value with 2 integer bits and 8 fractional bits
(Q2.8, two's complement):

- resolution: `2^-8 = 1/256 = 0.00390625`
- representable range: `-2.0` to `+1.99609375`
- the values `+1` and `-1`, reached at 90 and 270 degrees, are exactly representable

## Calculation method

1. Angles from 0 to 90 degrees: the sine is read from a lookup table holding the values for
   0, 8, 16, ..., 88 degrees (step of 8 degrees, 12 entries) plus 90 degrees, for a total of
   13 entries. 89 degrees gives the same value as 88 degrees.
2. Interpolation: `sin(8q + k) = T(q) + floor(k * (T(q+1) - T(q)) / 8)`, where `k * diff` is a
   3-bit shift-and-add multiplier (`k = 0` returns the table entry). 90 degrees is detected with
   gates and returns `T(90) = 1`.
3. Angles from 91 to 359 degrees: the angle is folded back into the first quadrant through the
   symmetry and periodicity identities of the sine, and the sign is set accordingly.

| Input range | Identity applied       |
|-------------|------------------------|
| 91-180      | `sin(a) = sin(180-a)`  |
| 181-270     | `sin(a) = -sin(a-180)` |
| 271-359     | `sin(a) = -sin(360-a)` |

## Repository layout

| Path            | Content                                  |
|-----------------|------------------------------------------|
| `src/`          | Synthesizable VHDL sources               |
| `sim/`          | Testbenches (`sim/waves/` holds saved waveform configs) |
| `constraints/`  | Vivado constraints (`.xdc`)              |
| `scripts/`      | Vivado Tcl scripts (project, flow, simulation) |
| `reports/`      | Timing, power and utilization reports    |
| `Makefile`      | Simulation with GHDL                     |

The sources in `src/` are plain VHDL (they also analyze as VHDL-93) with no vendor primitives.
The testbenches need VHDL-2008. The top level is `SINE_CALCULATOR` and the main testbench is
`TB_SINE`. Compile order, if you do it by hand:
`FA, RCA, SUB, COMPARATOR, INTERPOLATOR, ANGLE_SINE_MAPPER, SINE_CALCULATOR`.

| Testbench   | What it checks                                                      |
|-------------|---------------------------------------------------------------------|
| `TB_FA`     | `FA`, all 8 input combinations                                      |
| `TB_RCA`    | `RCA`, every `A`, `B`, `CIN` (generic `N`, default 8)               |
| `TB_SUB`    | `SUB`, every `X`, `Y` (generic `N`, default 8)                      |
| `TB_INTERP` | `INTERPOLATOR`, every table interval with `k = 0..7`                |
| `TB_LUT`    | `ANGLE_SINE_MAPPER`, angles 0..90 (there is no separate LUT entity) |
| `TB_SINE`   | `SINE_CALCULATOR`, reset and all 360 angles                         |

Each testbench ends with `std.env.finish`. A mismatch is reported with `severity failure`, so the
simulator exits with an error.

### Vivado

```
vivado -mode batch -source scripts/vivado_create_project.tcl
```

This creates `vivado_project/` (not tracked by git) targeting `xc7a200tsbg484-1`, with
`SINE_CALCULATOR` as the synthesis top and `TB_SINE` as the simulation top. The simulation run
time is set to `-all`, so behavioural simulation runs until the testbench finishes.

Two more scripts regenerate the results; both create the project if it is missing:

```
vivado -mode batch -source scripts/vivado_run_flow.tcl
vivado -mode batch -source scripts/vivado_simulate.tcl -tclargs TB_SINE
```

The first runs synthesis and implementation and writes utilization, timing, power and DRC
reports to `reports/`. The second simulates the given testbench and saves its waveform layout to
`sim/waves/<TB>.wcfg`; `TB_SINE.wcfg` is loaded automatically when the project is created.

The reports currently in `reports/` were generated on 2025-02-09 from the earlier version of the
design, before the structural rewrite. Rerun the flow script to refresh them.

`constraints/SINE_CONSTRAINT.xdc` defines a 14 ns clock on `CLK` and zero I/O delays, which
makes Vivado time the path from the input ports through the logic to the output register. It
has no pin assignments because the project is not tied to a board. Add `PACKAGE_PIN` and
`IOSTANDARD` for every port before running `write_bitstream`.

### GHDL (or any other simulator)

```
make                # runs all six testbenches
make sim-TB_SINE
make clean
```

Waveforms are written to `build/*.ghw`. For ModelSim/Questa, analyze the same files in the order
above with VHDL-2008 enabled, then simulate `TB_SINE`.
