library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT is
    Port( 
         ANGLE : in  std_logic_vector(6 downto 0);
         SINE : out std_logic_vector(9 downto 0)
         );
end LUT;

architecture RTL of LUT is
    type lut_type is array (0 to 11) of signed(9 downto 0);
    constant SINE_LUT : LUT_TYPE := (
        -- Sine values in fixed point: 2 bits integer, 8 bits fraction
        to_signed(0, 10),         -- sin(0)
        to_signed(36, 10),        -- sin(8)
        to_signed(71, 10),        -- sin(16)
        to_signed(105, 10),       -- sin(24)
        to_signed(139, 10),       -- sin(32)
        to_signed(173, 10),       -- sin(40)
        to_signed(207, 10),       -- sin(48)
        to_signed(239, 10),       -- sin(56)
        to_signed(271, 10),       -- sin(64)
        to_signed(302, 10),       -- sin(72)
        to_signed(333, 10),       -- sin(80)
        to_signed(362, 10)        -- sin(88)
    );
    
begin
    process(ANGLE)
    begin
        case to_integer(unsigned(ANGLE)) is
            when 0  => SINE <= std_logic_vector(SINE_LUT(0));
            when 8  => SINE <= std_logic_vector(SINE_LUT(1));
            when 16 => SINE <= std_logic_vector(SINE_LUT(2));
            when 24 => SINE <= std_logic_vector(SINE_LUT(3));
            when 32 => SINE <= std_logic_vector(SINE_LUT(4));
            when 40 => SINE <= std_logic_vector(SINE_LUT(5));
            when 48 => SINE <= std_logic_vector(SINE_LUT(6));
            when 56 => SINE <= std_logic_vector(SINE_LUT(7));
            when 64 => SINE <= std_logic_vector(SINE_LUT(8));
            when 72 => SINE <= std_logic_vector(SINE_LUT(9));
            when 80 => SINE <= std_logic_vector(SINE_LUT(10));
            when 88 => SINE <= std_logic_vector(SINE_LUT(11));
            when 89 | 90 => SINE <= std_logic_vector(SINE_LUT(11));
            when others => SINE <= (others => '0');  -- default case
        end case;
    end process;
end RTL;
