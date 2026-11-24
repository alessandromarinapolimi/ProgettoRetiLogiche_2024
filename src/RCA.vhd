----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  RCA - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  N-bit ripple-carry adder, a chain of FA instances.
-- Dependencies: FA
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
    generic (
        N : positive
    );
    port (
        A, B : in  std_logic_vector(N-1 downto 0);
        CIN  : in  std_logic;
        SUM  : out std_logic_vector(N-1 downto 0);
        COUT : out std_logic
    );
end entity RCA;

architecture RTL of RCA is

    signal C : std_logic_vector(N downto 0);  -- C(i) is the carry into bit i

begin

    C(0) <= CIN;

    GEN_FA : for i in 0 to N-1 generate
        FA_I : entity work.FA
            port map (
                X    => A(i),
                Y    => B(i),
                CIN  => C(i),
                SUM  => SUM(i),
                COUT => C(i+1)
            );
    end generate GEN_FA;

    COUT <= C(N);

end architecture RTL;
