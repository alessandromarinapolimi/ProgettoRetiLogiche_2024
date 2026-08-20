# ProgettoRetiLogiche_2024

Members of the group:

- Alessandro Marina (alessandro.marina@mail.polimi.it)
- Ashvinder Singh (ashvinder.singh@mail.polimi.it)

## Implemented features
Legend:

- 🟢: Implemented
- 🟡: Work in Progress
- 🔴: Not Implemented

| Project Chosen                 | Status |
|--------------------------------|--------|
| FIXED-POINT SINE FUNCTION      |   🟢  |

| Elements                        | Status |
|---------------------------------|--------|
| FA                              |   🟢   |
| RCA                             |   🟢   |
| SUB                             |   🟢   |
| INTERP                          |   🟢   |
| LUT                             |   🟢   |
| SINE_CALCULATOR                 |   🟢   |


## Overview

The module takes an angle expressed in degrees, encoded in natural binary, and produces the
corresponding sine value. Since the result lies in the interval [-1, 1], it is encoded in a signed
fixed-point format instead of an integer.

### Numeric format

The output uses a 10-bit signed fixed-point format with 2 integer bits and 8 fractional bits
(Q2.8, two's complement):

- resolution: 2^-8 = 1/256 = 0.00390625
- representable range: -2.0 to +1.99609375
- the values +1 and -1, reached at 90 and 270 degrees, are exactly representable

### Key features

- Input range: integer angles from 0 to 359 degrees.
- Fixed-point output: 10 bits, 2 integer and 8 fractional, enough to cover [-1, 1] exactly at the
  endpoints and with a quantization step of 1/256 elsewhere.
- Trigonometric symmetry: only the first quadrant is stored; angles from 91 to 359 degrees are
  reduced to it, so no extra table entries are needed.
- Structural design: the arithmetic is built bottom-up from a 1-bit full adder, so the adder and the
  subtractor are explicit hardware rather than inferred operators.

### Calculation method

1. **0-90 degrees.** The sine is read from a lookup table that stores the values for 0, 8, 16, ...,
   88 degrees (a step of 8 degrees, 12 entries) plus the two extra points 89 and 90 degrees, for a
   total of 14 entries.
2. **Interpolation.** If the input angle does not match a table entry, the result is computed by
   linear interpolation between the two nearest entries of the enclosing 8-degree interval.
3. **91-359 degrees.** The angle is folded back into the first quadrant using the symmetry and
   periodicity identities of the sine, and the sign of the result is set accordingly:
   - 91-180 degrees: sin(a) = sin(180 - a)
   - 181-270 degrees: sin(a) = -sin(a - 180)
   - 271-359 degrees: sin(a) = -sin(360 - a)
