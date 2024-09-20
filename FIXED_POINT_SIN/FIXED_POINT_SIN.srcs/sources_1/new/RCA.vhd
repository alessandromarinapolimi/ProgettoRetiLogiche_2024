library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Ripple Carry Adder (RCA)
entity RCA is
    generic (
        N : positive   -- N-bit width of the inputs and output
    );
    
    Port (
        A, B    : in  std_logic_vector(N-1 downto 0);        -- Inputs: N-bit vectors A and B
        CIN     : in  std_logic;                                              -- Input: Carry-in (CIN)
        SUM   : out std_logic_vector(N-1 downto 0);      -- Output: N-bit sum vector
        COUT  : out std_logic                                             -- Output: Final carry-out
    );
end RCA;

architecture RTL of RCA is
    signal C : std_logic_vector(N downto 0);  -- Internal signal to hold carry bits
    
begin
    -- Initialize the first carry with the input carry-in (CIN)
    C(0) <= CIN;
    
    gen: for i in 0 to N-1 generate
        FA_inst: entity work.FA    -- Instantiate the Full Adder (FA) for each bit
            port map(
                X          => A(i),            -- Input X from A(i)
                Y          => B(i),            -- Input Y from B(i)
                CIN      => C(i),            -- Carry-in from the previous stage
                SUM    => SUM(i),      -- Output sum for the current bit
                COUT  => C(i + 1)       -- Carry-out to the next stage
            );
    end generate;
    
    -- The final carry-out is assigned to COUT
    COUT <= C(N);
end RTL;
