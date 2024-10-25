library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Subtractor (SUB)
entity SUB is
    generic (
        N : positive  ;
        M : positive 
    );
    Port (
        X        : in  std_logic_vector(N-1 downto 0);     -- Input: Minuend (X)
        Y        : in  std_logic_vector(N-1 downto 0);     -- Input: Subtrahend (Y)
        DIFF  : out std_logic_vector(M-1 downto 0)     -- Output: Difference (X - Y)
    );
end SUB;

architecture RTL of SUB is

    -- Component declaration for RCA to be used for subtraction
    component RCA is
        generic (
            N,M : positive 
           
        );
        
        Port (
            A           : in  std_logic_vector(N-1 downto 0);               -- Input: First operand
            B           : in  std_logic_vector(N-1 downto 0);               -- Input: Second operand
            CIN       : in  std_logic;                                                      -- Input: Carry-in
            SUM     : out std_logic_vector(M-1 downto 0);              -- Output: Sum (or difference in this case)
            COUT    : out std_logic                                                     -- Output: Carry-out (unused here)
        );
    end component;

    -- Signal to store the 2's complement of Y
    signal Y_comp : std_logic_vector(N-1 downto 0);

begin

    -- Take 2's complement of Y (invert Y bits for subtraction)
    Y_comp <= not Y;

    -- Instantiate RCA to perform subtraction
    SUB_RCA: RCA
    generic map (N => N,M=>M)            -- Specify the bit-width
    
    port map (
        A                    => X,                 -- Minuend (X)
        B                    => Y_comp,      -- Subtrahend (Y's 2's complement)
        CIN                => '1',                -- Set carry-in to 1 for 2's complement addition
        SUM              => DIFF,            -- Output: Difference (X - Y)
        COUT            => open             -- Carry-out is not used, so it's left open
    );

end RTL;
