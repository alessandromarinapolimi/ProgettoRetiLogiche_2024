library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT is
    Port ( 
        ANGLE : in  std_logic_vector(6 downto 0);
        SINE : out std_logic_vector(9 downto 0)
    );
end LUT;

architecture RTL of LUT is
    type lut_type is array (0 to 13) of std_logic_vector(9 downto 0);
    constant SINE_LUT : lut_type := (
        "0000000000",  -- sin(0)
        "0000100100",  -- sin(8)
        "0001000111",  -- sin(16)
        "0001101001",  -- sin(24)
        "0010001011",  -- sin(32)
        "0010101101",  -- sin(40)
        "0011001111",  -- sin(48)
        "0011101111",  -- sin(56)
        "0100001111",  -- sin(64)
        "0100101110",  -- sin(72)
        "0101001101",  -- sin(80)
        "0101101010",  -- sin(88)
        "0101101011",  -- sin(89)
        "0101101100"   -- sin(90)
    );

begin
    process(ANGLE)
    variable angle_int : integer;
    begin
        angle_int := to_integer(unsigned(ANGLE));
        
        if angle_int = 89 then
            SINE <= SINE_LUT(12);
        elsif angle_int = 90 then
            SINE <= SINE_LUT(13);
        elsif angle_int mod 8 = 0 then
            SINE <= SINE_LUT(angle_int / 8);
        else
            -- Per angoli intermedi, fornisci il valore più vicino
            -- Questo è un placeholder per l'interpolazione lineare
            SINE <= SINE_LUT(angle_int / 8);
        end if;
    end process;
end RTL;