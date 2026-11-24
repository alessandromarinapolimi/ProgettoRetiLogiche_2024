----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  TB_SUB - Behavioral
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Exhaustive test of SUB: every X and Y for the given N,
--               DIFF expected to be (X - Y) mod 2^N.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_SUB is
    generic (
        N : positive := 8
    );
end entity TB_SUB;

architecture Behavioral of TB_SUB is

    signal X, Y, DIFF : std_logic_vector(N-1 downto 0);

begin

    UUT : entity work.SUB
        generic map (
            N => N
        )
        port map (
            X    => X,
            Y    => Y,
            DIFF => DIFF
        );

    STIM_PROC : process
        variable EXPECTED : unsigned(N-1 downto 0);
        variable ERRORS   : natural := 0;
    begin
        for i in 0 to 2**N - 1 loop
            for j in 0 to 2**N - 1 loop
                X <= std_logic_vector(to_unsigned(i, N));
                Y <= std_logic_vector(to_unsigned(j, N));
                wait for 1 ns;
                EXPECTED := to_unsigned(i, N) - to_unsigned(j, N);
                if DIFF /= std_logic_vector(EXPECTED) then
                    ERRORS := ERRORS + 1;
                    report integer'image(i) & " - " & integer'image(j) & ": expected "
                           & to_string(EXPECTED) & ", got " & to_string(DIFF)
                        severity error;
                end if;
            end loop;
        end loop;

        if ERRORS = 0 then
            report "TB_SUB: all cases match" severity note;
        else
            report "TB_SUB: " & integer'image(ERRORS) & " mismatches" severity failure;
        end if;

        std.env.finish;
    end process STIM_PROC;

end architecture Behavioral;
