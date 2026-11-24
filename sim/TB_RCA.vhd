----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  TB_RCA - Behavioral
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Exhaustive test of RCA: every A, B and CIN for the given N.
--               That is 2^(2N+1) cases at 1 ns each. With N = 10 the waveform
--               written by make is about 50 MB, hence the default of 8.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_RCA is
    generic (
        N : positive := 8
    );
end entity TB_RCA;

architecture Behavioral of TB_RCA is

    signal A, B, SUM : std_logic_vector(N-1 downto 0);
    signal CIN, COUT : std_logic;

begin

    UUT : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => A,
            B    => B,
            CIN  => CIN,
            SUM  => SUM,
            COUT => COUT
        );

    STIM_PROC : process
        variable C        : std_logic;
        variable EXPECTED : unsigned(N downto 0);
        variable ERRORS   : natural := 0;
    begin
        for i in 0 to 2**N - 1 loop
            for j in 0 to 2**N - 1 loop
                for c_int in 0 to 1 loop
                    if c_int = 0 then
                        C := '0';
                    else
                        C := '1';
                    end if;
                    A   <= std_logic_vector(to_unsigned(i, N));
                    B   <= std_logic_vector(to_unsigned(j, N));
                    CIN <= C;
                    wait for 1 ns;
                    EXPECTED := to_unsigned(i + j + c_int, N+1);
                    if (COUT & SUM) /= std_logic_vector(EXPECTED) then
                        ERRORS := ERRORS + 1;
                        report integer'image(i) & " + " & integer'image(j) & " + "
                               & integer'image(c_int) & ": expected "
                               & to_string(EXPECTED) & ", got " & to_string(COUT & SUM)
                            severity error;
                    end if;
                end loop;
            end loop;
        end loop;

        if ERRORS = 0 then
            report "TB_RCA: all cases match" severity note;
        else
            report "TB_RCA: " & integer'image(ERRORS) & " mismatches" severity failure;
        end if;

        std.env.finish;
    end process STIM_PROC;

end architecture Behavioral;
