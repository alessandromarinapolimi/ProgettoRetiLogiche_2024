library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
-- Ripple Carry Adder (RCA)
entity RCA is
    generic (
        N : positive   
    );
    Port (
        A            :  in  std_logic_vector(N-1 downto 0);            -- First input operand
        B            :  in  std_logic_vector(N-1 downto 0);            -- Second input operand
        CIN        :  in  std_logic;                                                  -- Carry input
        SUM      :  out std_logic_vector(N-1 downto 0);           -- Sum output
        COUT    :  out std_logic                                                  -- Carry output
    );
end RCA;

architecture RTL of RCA is 

-- C(0) is the input carry, C(N) is the output carry
signal C : std_logic_vector(N downto 0);

begin
    C(0) <= CIN;

    gen: for i in 0 to N-1 generate
        -- Each FA takes inputs A(i), B(i), and previous carry
        -- Outputs connect to SUM(i) and next carry
        FA_i: entity work.FA
           
                port map(
                    X              => A(i),              -- Current bit from first operand
                    Y              => B(i),              -- Current bit from second operand
                    CIN          => C(i),              -- Carry in from previous FA
                    SUM        => SUM(i),        -- Current bit of sum
                    COUT      => C(i + 1)          -- Carry out to next FA
                );
    end generate;
    
    --Final carry out
    COUT <= C(N);
end RTL;