----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  TB_INTERP - Behavioral
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Tests INTERPOLATOR on every pair of adjacent table entries
--               for K = 0..7 against PREV + floor(K * (NEXT - PREV) / 8).
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_INTERP is
end entity TB_INTERP;

architecture Behavioral of TB_INTERP is

    constant N : positive := 10;

    -- sin(0), sin(8), ..., sin(88), sin(90) in Q2.8, as in ANGLE_SINE_MAPPER
    type INT_ARRAY is array (natural range <>) of natural;
    constant TABLE : INT_ARRAY := (0, 35, 70, 104, 135, 164, 190, 212, 230, 243, 252, 255, 256);

    signal K                   : std_logic_vector(2 downto 0);
    signal SINE_PREV, SINE_NXT : std_logic_vector(N-1 downto 0);
    signal RESULT              : std_logic_vector(N-1 downto 0);

begin

    UUT : entity work.INTERPOLATOR
        generic map (
            N => N
        )
        port map (
            DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE => K,
            SINE_VALUE_PREVIOUS                        => SINE_PREV,
            SINE_VALUE_NEXT                            => SINE_NXT,
            INTERPOLATED_SINE                          => RESULT
        );

    STIM_PROC : process
        variable EXPECTED : natural;
        variable ERRORS   : natural := 0;
    begin
        for j in 0 to TABLE'high - 1 loop
            for i in 0 to 7 loop
                SINE_PREV <= std_logic_vector(to_unsigned(TABLE(j), N));
                SINE_NXT  <= std_logic_vector(to_unsigned(TABLE(j+1), N));
                K         <= std_logic_vector(to_unsigned(i, 3));
                wait for 10 ns;
                EXPECTED := TABLE(j) + (i * (TABLE(j+1) - TABLE(j))) / 8;
                if to_integer(unsigned(RESULT)) /= EXPECTED then
                    ERRORS := ERRORS + 1;
                    report "Entry " & integer'image(j) & ", K = " & integer'image(i)
                           & ": expected " & integer'image(EXPECTED)
                           & ", got " & integer'image(to_integer(unsigned(RESULT)))
                        severity error;
                end if;
            end loop;
        end loop;

        if ERRORS = 0 then
            report "TB_INTERP: all cases match" severity note;
        else
            report "TB_INTERP: " & integer'image(ERRORS) & " mismatches" severity failure;
        end if;

        std.env.finish;
    end process STIM_PROC;

end architecture Behavioral;
