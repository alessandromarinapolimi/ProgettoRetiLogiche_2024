----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  SUB - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  N-bit subtractor, DIFF = X - Y modulo 2^N.
--               Computed as X + not(Y) + 1 on an RCA.
-- Dependencies: RCA
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUB is
    generic (
        N : positive
    );
    port (
        X, Y : in  std_logic_vector(N-1 downto 0);
        DIFF : out std_logic_vector(N-1 downto 0)
    );
end entity SUB;

architecture RTL of SUB is

    signal Y_N : std_logic_vector(N-1 downto 0);

begin

    Y_N <= not Y;

    SUB_RCA : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => X,
            B    => Y_N,
            CIN  => '1',
            SUM  => DIFF,
            COUT => open
        );

end architecture RTL;
