library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA is
    generic (
        N : positive
    );
    Port (
        A, B : in  std_logic_vector(N-1 downto 0);
        CIN  : in  std_logic;
        SUM  : out std_logic_vector(N-1 downto 0);
        COUT : out std_logic
    );
end RCA;

architecture RTL of RCA is
    signal C : std_logic_vector(N downto 0);
begin
    C(0) <= CIN;
    
    gen: for i in 0 to N-1 generate
        FA_inst: entity work.FA
            port map(
                X    => A(i),
                Y    => B(i),
                CIN  => C(i),
                SUM  => SUM(i),
                COUT => C(i + 1)
            );
    end generate;
    
    COUT <= C(N);
end RTL;