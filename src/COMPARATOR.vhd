----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  COMPARATOR - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  Unsigned A > B, taken from the sign bit of B - A.
-- Dependencies: SUB
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR is
    generic (
        N : positive
    );
    port (
        A, B              : in  std_logic_vector(N-1 downto 0);
        GREATER_THAN_FLAG : out std_logic  -- '1' when A > B (unsigned)
    );
end entity COMPARATOR;

architecture RTL of COMPARATOR is

    signal A_EXT, B_EXT, B_MINUS_A : std_logic_vector(N downto 0);

begin

    -- With one extra bit B - A cannot overflow, so its MSB is set exactly
    -- when A > B. A = B gives zero, so no equality check is needed.
    A_EXT <= '0' & A;
    B_EXT <= '0' & B;

    SUB_B_A : entity work.SUB
        generic map (
            N => N+1
        )
        port map (
            X    => B_EXT,
            Y    => A_EXT,
            DIFF => B_MINUS_A
        );

    GREATER_THAN_FLAG <= B_MINUS_A(N);

end architecture RTL;
