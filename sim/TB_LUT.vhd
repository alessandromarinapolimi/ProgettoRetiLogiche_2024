----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  TB_LUT - Behavioral
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Tests ANGLE_SINE_MAPPER (table plus interpolation) for every
--               angle 0..90. There is no separate LUT entity.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_LUT is
end entity TB_LUT;

architecture Behavioral of TB_LUT is

    constant N : positive := 10;

    -- Expected outputs, Q2.8
    type SINE_ARRAY is array (0 to 90) of std_logic_vector(N-1 downto 0);
    constant EXPECTED_SINE : SINE_ARRAY := (
        "0000000000", "0000000100", "0000001000", "0000001101", "0000010001", "0000010101",  -- 0..5
        "0000011010", "0000011110", "0000100011", "0000100111", "0000101011", "0000110000",  -- 6..11
        "0000110100", "0000111000", "0000111101", "0001000001", "0001000110", "0001001010",  -- 12..17
        "0001001110", "0001010010", "0001010111", "0001011011", "0001011111", "0001100011",  -- 18..23
        "0001101000", "0001101011", "0001101111", "0001110011", "0001110111", "0001111011",  -- 24..29
        "0001111111", "0010000011", "0010000111", "0010001010", "0010001110", "0010010001",  -- 30..35
        "0010010101", "0010011001", "0010011100", "0010100000", "0010100100", "0010100111",  -- 36..41
        "0010101010", "0010101101", "0010110001", "0010110100", "0010110111", "0010111010",  -- 42..47
        "0010111110", "0011000000", "0011000011", "0011000110", "0011001001", "0011001011",  -- 48..53
        "0011001110", "0011010001", "0011010100", "0011010110", "0011011000", "0011011010",  -- 54..59
        "0011011101", "0011011111", "0011100001", "0011100011", "0011100110", "0011100111",  -- 60..65
        "0011101001", "0011101010", "0011101100", "0011101110", "0011101111", "0011110001",  -- 66..71
        "0011110011", "0011110100", "0011110101", "0011110110", "0011110111", "0011111000",  -- 72..77
        "0011111001", "0011111010", "0011111100", "0011111100", "0011111100", "0011111101",  -- 78..83
        "0011111101", "0011111101", "0011111110", "0011111110", "0011111111", "0011111111",  -- 84..89
        "0100000000"   -- 90
    );

    signal ANGLE : std_logic_vector(6 downto 0);
    signal SINE  : std_logic_vector(N-1 downto 0);

begin

    UUT : entity work.ANGLE_SINE_MAPPER
        generic map (
            N => N,
            M => 6
        )
        port map (
            ANGLE => ANGLE,
            SINE  => SINE
        );

    STIM_PROC : process
        variable ERRORS : natural := 0;
    begin
        for i in 0 to 90 loop
            ANGLE <= std_logic_vector(to_unsigned(i, ANGLE'length));
            wait for 10 ns;
            if SINE /= EXPECTED_SINE(i) then
                ERRORS := ERRORS + 1;
                report "Angle " & integer'image(i) & ": expected "
                       & to_string(EXPECTED_SINE(i)) & ", got " & to_string(SINE)
                    severity error;
            end if;
        end loop;

        if ERRORS = 0 then
            report "TB_LUT: all 91 angles match" severity note;
        else
            report "TB_LUT: " & integer'image(ERRORS) & " mismatches" severity failure;
        end if;

        std.env.finish;
    end process STIM_PROC;

end architecture Behavioral;
