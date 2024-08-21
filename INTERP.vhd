library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity INTERP is
    Port(
        ANGLE             : in  std_logic_vector(6 downto 0);
        SINE1             : in  signed(9 downto 0);
        SINE2             : in  signed(9 downto 0);
        INTERPOLATED_SINE : out signed(9 downto 0)
    );
end INTERP;

architecture RTL of INTERP is
    signal DELTA       : integer;
    signal SINE_DIFF   : signed(9 downto 0);
    signal INTERP_VAL  : signed(19 downto 0);
begin
    process(ANGLE, SINE1, SINE2)
    begin
        DELTA <= to_integer(unsigned(ANGLE(2 downto 0)));  -- 0-7
        SINE_DIFF <= SINE2 - SINE1;
        INTERP_VAL <= SINE1 + ((SINE_DIFF * DELTA) sll 10) / 8; -- Divisione per 8
        INTERPOLATED_SINE <= INTERP_VAL(9 downto 0);
    end process;
end RTL;

