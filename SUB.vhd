library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SUB is
    Port(
        X    : in  std_logic_vector(9 downto 0);
        Y    : in  std_logic_vector(9 downto 0);
        DIFF : out std_logic_vector(9 downto 0)
    );
end SUB;

architecture RTL of SUB is
begin
    process(X, Y)
    begin
        DIFF <= std_logic_vector(signed(X) - signed(Y));
    end process;
end RTL;
