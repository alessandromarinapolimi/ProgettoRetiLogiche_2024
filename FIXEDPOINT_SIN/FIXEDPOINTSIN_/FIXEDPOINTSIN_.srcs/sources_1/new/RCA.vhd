library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- Ripple Carry Adder (RCA)
--------------------------------------

entity RCA is
    generic (
        N : positive                                                    -- Number of bits for the adder
    );
    Port (
        A, B            : in  std_logic_vector(N-1 downto 0);           -- First and second input operand 
        CIN             : in  std_logic;                                -- Carry input
        SUM             : out std_logic_vector(N-1 downto 0);           -- Sum output
        COUT            : out std_logic                                 -- Final carry output
    );
end entity RCA;

architecture RTL of RCA is
    signal C : std_logic_vector(N downto 0);                            -- Internal signal for carries: C(0) is carry-in, C(N) is carry-out
    
    begin
        C(0) <= CIN;    
        
        --------
        -- Generate block for each bit of the adder
        --------
        gen: for i in 0 to N-1 generate
            FA_i: entity work.FA
                port map (
                    X              => A(i),                      -- Current bit from first operand
                    Y              => B(i),                      -- Current bit from second operand
                    CIN            => C(i),                      -- Carry in from previous stage
                    SUM            => SUM(i),                    -- Current sum bit
                    COUT           => C(i+1)                     -- Carry out to next stage
                );
        end generate;
    
        COUT <= C(N);
end architecture RTL;