----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  FA - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  1-bit full adder.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    port (
        X, Y, CIN : in  std_logic;
        SUM, COUT : out std_logic
    );
end entity FA;

architecture RTL of FA is
begin

    SUM  <= X xor Y xor CIN;
    COUT <= (X and Y) or (CIN and (X xor Y));

end architecture RTL;
