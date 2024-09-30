# ProgettoRetiLogiche_2024

- Voto finale: -

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
| FIXED-POINT SINE FUNCTION      |   🟡  |

| Elements                        | Status |
|---------------------------------|--------|
| FA                              |   🟢   |
| RCA                             |   🟢   |
| SUB                             |   🟢   |
| INTERP                          |   🟢   |
| LUT                             |   🟢   |
| SINE_CALCULATOR                 |   🟢   |


## About the Project

Sine Calculation Module
This module is designed to calculate the sine of an angle given in degrees. The input angle, encoded in natural binary, must be between 0 and 359 degrees. The resulting sine value, which ranges from -1 to 1, is represented using 10-bit fixed-point precision, with 2 bits for the integer part and 8 bits for the fractional part.

### Key Features:
- Input Range: The module accepts angles from 0 to 359 degrees.
Fixed-Point Representation: The sine output is a 10-bit value with 2 integer bits and 8 fractional bits, allowing for accurate representation of values between -1 and 1.
Trigonometric Symmetry: To efficiently compute the sine for angles outside the 0-90° range, the module leverages trigonometric identities, extending the calculation to cover angles between 91° and 359°.
### Calculation Method:
- 0-90 Degrees: The sine of angles between 0° and 90° is computed using a lookup table. This table stores the sine values for angles between 0° and 88° (at 8° intervals), as well as for 89° and 90°.
Interpolation: If the input angle does not directly match a value in the lookup table, the sine is computed using linear interpolation within the closest interval from the table.
91-359 Degrees: For angles beyond 90°, the module applies trigonometric identities (e.g., sine symmetry and periodicity) to compute the sine based on the known values from the 0-90° range.

