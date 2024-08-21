library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RCA is
    Port(
        A    : in  std_logic_vector (9 downto 0);
        B    : in  std_logic_vector (9 downto 0);
        CIN  : in  std_logic;
        SUM  : out std_logic_vector (9 downto 0);
        COUT : out std_logic
        );
end RCA;

architecture RTL of RCA is

signal carry : std_logic_vector (10 downto 0);
    
begin

    carry(0) <= CIN;
    gen: for i in 0 to 9 generate
        FA_inst: entity work.FA
            port map(
                        X    => A(i),
                        Y    => B(i),
                        CIN  => carry(i),
                        SUM  => SUM(i),
                        COUT => carry(i + 1)
                     );
    end generate;
    COUT <= carry(10);
    
end RTL;
