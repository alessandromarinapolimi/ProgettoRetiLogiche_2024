library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---------------------------
-- Subtractor (SUB)
---------------------------

entity SUB is
    generic (
        N : positive    
    );
    Port (
        X, Y            : in  std_logic_vector(N-1 downto 0);       -- Input: Minuend (X) and Subtrahend (Y)
        DIFF          : out std_logic_vector(N-1 downto 0)       -- Output: Difference (X - Y)
    );
end entity SUB;

architecture RTL of SUB is

    component RCA is
        generic (
            N : positive                                                              -- Number of bits for the operands
        );
        Port (
            A, B         : in  std_logic_vector(N-1 downto 0);     -- Input: First operand and Second operand
            CIN          : in  std_logic;                                           -- Carry-in
            SUM        : out std_logic_vector(N-1 downto 0);   -- Output: Sum
            COUT       : out std_logic                                          -- Carry-out 
        );
    end component;

    signal Y_COMP : std_logic_vector(N-1 downto 0);       -- Signal for the 2's complement of Y

    begin
            Y_COMP <= not Y;                                                   -- Calculate 2's complement of Y for subtraction
    
            SUB_RCA: RCA
            generic map (
                N => N
            )
            port map (
                A            => X,                                                       -- Minuend (X)
                B            => Y_COMP,                                           -- Subtrahend (Y's 2's complement)
                CIN        => '1',                                                      -- Carry-in set to 1 for 2's complement addition
                SUM      => DIFF,                                                  -- Output: Difference (X - Y)
                COUT    => open                                                   -- Carry-out is not used
            );
            
end architecture RTL;
