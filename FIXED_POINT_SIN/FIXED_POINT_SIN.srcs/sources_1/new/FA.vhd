library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------
-- Full Adder (FA)
------------------------
entity FA is
    Port(
        X, Y, CIN       : in  std_logic;          -- Inputs: X, Y, carry-in (CIN)
        SUM, COUT  : out std_logic         -- Outputs: sum and carry-out (COUT)
    );
end FA;

architecture RTL of FA is
begin

    SUM  <= X xor Y xor CIN;                                -- SUM is calculated using the XOR of X, Y, CIN    
    COUT <= (X and Y) or (CIN and (X xor Y));     -- COUT is generated based on the carry logic
   
end RTL;
