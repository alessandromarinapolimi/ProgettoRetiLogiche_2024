----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  TB_FA - Behavioral
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Exhaustive test of FA (all 8 input combinations).
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_FA is
end entity TB_FA;

architecture Behavioral of TB_FA is

    signal X, Y, CIN : std_logic;
    signal SUM, COUT : std_logic;

begin

    UUT : entity work.FA
        port map (
            X    => X,
            Y    => Y,
            CIN  => CIN,
            SUM  => SUM,
            COUT => COUT
        );

    STIM_PROC : process
        variable VEC      : unsigned(2 downto 0);
        variable EXPECTED : unsigned(1 downto 0);
        variable ERRORS   : natural := 0;
    begin
        for i in 0 to 7 loop
            VEC := to_unsigned(i, 3);
            X   <= VEC(2);
            Y   <= VEC(1);
            CIN <= VEC(0);
            wait for 10 ns;
            EXPECTED := ('0' & VEC(2)) + ('0' & VEC(1)) + ('0' & VEC(0));
            if SUM /= EXPECTED(0) or COUT /= EXPECTED(1) then
                ERRORS := ERRORS + 1;
                report "X Y CIN = " & to_string(VEC) & ": expected COUT SUM = "
                       & to_string(EXPECTED) & ", got " & std_logic'image(COUT)
                       & std_logic'image(SUM)
                    severity error;
            end if;
        end loop;

        if ERRORS = 0 then
            report "TB_FA: all 8 cases match" severity note;
        else
            report "TB_FA: " & integer'image(ERRORS) & " mismatches" severity failure;
        end if;

        std.env.finish;
    end process STIM_PROC;

end architecture Behavioral;
