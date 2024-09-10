library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port(
        X, Y, CIN : in  std_logic;
        SUM, COUT : out std_logic
    );
end FA;

architecture RTL of FA is
begin
    SUM  <= X xor Y xor CIN;
    COUT <= (X and Y) or (CIN and (X xor Y));
end RTL;