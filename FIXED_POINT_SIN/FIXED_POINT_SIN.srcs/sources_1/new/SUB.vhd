library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SUB is
    Port(
        X    : in  std_logic_vector(9 downto 0);
        Y    : in  std_logic_vector(9 downto 0);
        DIFF : out std_logic_vector(9 downto 0)
    );
end SUB;

architecture RTL of SUB is
    component RCA is
        Port(
            A    : in  std_logic_vector (9 downto 0);
            B    : in  std_logic_vector (9 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector (9 downto 0);
            COUT : out std_logic
        );
    end component;

    signal Y_comp : std_logic_vector(9 downto 0);

begin
    Y_comp <= not Y;
    
    SUB_RCA: RCA port map(
        A => X,
        B => Y_comp,
        CIN => '1',
        SUM => DIFF,
        COUT => open
    );

end RTL;