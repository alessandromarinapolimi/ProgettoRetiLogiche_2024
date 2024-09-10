library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERP is
    Port(
        ANGLE             : in  std_logic_vector(2 downto 0);
        SINE1, SINE2      : in  std_logic_vector(9 downto 0);
        INTERPOLATED_SINE : out std_logic_vector(9 downto 0)
    );
end INTERP;

architecture RTL of INTERP is
    component RCA is
        Port(
            A, B : in  std_logic_vector(9 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(9 downto 0);
            COUT : out std_logic
        );
    end component;
    
    component SUB is
        Port(
            X, Y : in  std_logic_vector(9 downto 0);
            DIFF : out std_logic_vector(9 downto 0)
        );
    end component;
    
    signal SINE_DIFF   : std_logic_vector(9 downto 0);
    signal MULT_TEMP   : std_logic_vector(9 downto 0);
    signal SHIFTED_0   : std_logic_vector(9 downto 0);
    signal SHIFTED_1   : std_logic_vector(9 downto 0);
    signal SHIFTED_2   : std_logic_vector(9 downto 0);
    signal TEMP_SUM    : std_logic_vector(9 downto 0);
    
begin
    -- Calcolo della differenza
    SINE_DIFF_CALC: SUB port map(
        X    => SINE2,
        Y    => SINE1,
        DIFF => SINE_DIFF
    );
    
    -- Preparazione dei valori shiftati
    SHIFTED_0 <= SINE_DIFF when ANGLE(0) = '1' else (others => '0');
    SHIFTED_1 <= '0' & SINE_DIFF(9 downto 1) when ANGLE(1) = '1' else (others => '0');
    SHIFTED_2 <= "00" & SINE_DIFF(9 downto 2) when ANGLE(2) = '1' else (others => '0');
    
    -- Somma dei valori shiftati
    RCA1: RCA port map(
        A    => SHIFTED_0,
        B    => SHIFTED_1,
        CIN  => '0',
        SUM  => TEMP_SUM,
        COUT => open
    );
    
    RCA2: RCA port map(
        A    => TEMP_SUM,
        B    => SHIFTED_2,
        CIN  => '0',
        SUM  => MULT_TEMP,
        COUT => open
    );
    
    -- Somma finale
    RCA_FINAL: RCA port map(
        A    => SINE1,
        B    => MULT_TEMP,
        CIN  => '0',
        SUM  => INTERPOLATED_SINE,
        COUT => open
    );
    
end RTL;