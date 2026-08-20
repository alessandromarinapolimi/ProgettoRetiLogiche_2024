# ProgettoRetiLogiche_2024 - Fixed-Point Sine Calculator

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

| Component         | Role                                        | Status |
|-------------------|---------------------------------------------|--------|
| `FA`              | Full adder, 1 bit                           | 🟢     |
| `RCA`             | Ripple-carry adder built from `FA` instances | 🟢     |
| `SUB`             | Subtractor                                  | 🟢     |
| `INTERP`          | Linear interpolator between two LUT entries | 🟢     |
| `LUT`             | Sine lookup table for the first quadrant    | 🟢     |
| `SINE_CALCULATOR` | Top level, quadrant mapping and glue logic  | 🟢     |

## Overview

The module takes an angle in degrees, encoded in natural binary, and produces the corresponding sine
value. Since the result lies in the interval `[-1, 1]`, it is encoded in signed fixed point instead
of an integer.

The arithmetic is built bottom-up from a 1-bit full adder, so adder and subtractor are explicit
hardware rather than inferred operators.

## Numeric format

The output is a 10-bit signed fixed-point value with 2 integer bits and 8 fractional bits
(Q2.8, two's complement):

- resolution: `2^-8 = 1/256 = 0.00390625`
- representable range: `-2.0` to `+1.99609375`
- the values `+1` and `-1`, reached at 90 and 270 degrees, are exactly representable

## Calculation method

1. Angles from 0 to 90 degrees: the sine is read from a lookup table holding the values for
   0, 8, 16, ..., 88 degrees (step of 8 degrees, 12 entries) plus the two extra points 89 and 90
   degrees, for a total of 14 entries.
2. Interpolation: if the input angle does not match a table entry, the result is computed by linear
   interpolation between the two entries of the enclosing 8-degree interval.
3. Angles from 91 to 359 degrees: the angle is folded back into the first quadrant through the
   symmetry and periodicity identities of the sine, and the sign is set accordingly.

| Input range | Identity applied      |
|-------------|-----------------------|
| 91-180      | `sin(a) = sin(180-a)`  |
| 181-270     | `sin(a) = -sin(a-180)` |
| 271-359     | `sin(a) = -sin(360-a)` |
