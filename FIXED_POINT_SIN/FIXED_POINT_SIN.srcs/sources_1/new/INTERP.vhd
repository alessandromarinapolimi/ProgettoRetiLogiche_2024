library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERP is
    generic (
        N : positive 
    );
    Port(
        ANGLE             : in  std_logic_vector(6 downto 0);  -- 7 bit per rappresentare angoli da 0 a 90
        SINE1, SINE2      : in  std_logic_vector(N-1 downto 0);
        INTERPOLATED_SINE : out std_logic_vector(N-1 downto 0)
    );
end INTERP;

architecture RTL of INTERP is
    component RCA is
        generic (N : positive);
        Port(
            A, B : in  std_logic_vector(N-1 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(N-1 downto 0);
            COUT : out std_logic
        );
    end component;
    
    component SUB is
        generic (N : positive);
        Port(
            X, Y : in  std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    signal SINE_DIFF   : std_logic_vector(N-1 downto 0);
    signal MULT_TEMP   : std_logic_vector(N-1 downto 0);
    signal ROUNDED_ANGLE : std_logic_vector(6 downto 0);
    signal FRACTION    : std_logic_vector(6 downto 0);  -- Changed to 7 bits
    signal ANGLE_PLUS_4 : std_logic_vector(6 downto 0);
    
    -- Segnali per la moltiplicazione
    signal PARTIAL_PRODUCT_0, PARTIAL_PRODUCT_1, PARTIAL_PRODUCT_2 : std_logic_vector(N+2 downto 0);
    signal SUM_0_1, FINAL_SUM : std_logic_vector(N+2 downto 0);
    
begin
    -- Arrotondamento dell'angolo al multiplo di 8 più vicino
    ADD_4: RCA
    generic map (N => 7)
    port map(
        A    => ANGLE,
        B    => "0000100",  -- 4 in binario
        CIN  => '0',
        SUM  => ANGLE_PLUS_4,
        COUT => open
    );
    
    ROUNDED_ANGLE <= ANGLE_PLUS_4(6 downto 3) & "000";
    -- Calcolo della frazione (differenza tra l'angolo arrotondato e quello originale)
    FRACTION_CALC: SUB
    generic map (N => 7)
    port map(
        X    => ROUNDED_ANGLE,
        Y    => ANGLE,
        DIFF => FRACTION  -- Now 7 bits
    );
    -- Calcolo della differenza tra SINE2 e SINE1
    SINE_DIFF_CALC: SUB 
    generic map (N => N)
    port map(
        X    => SINE2,
        Y    => SINE1,
        DIFF => SINE_DIFF
    );
    
    -- Calcolo del termine di interpolazione (SINE_DIFF * FRACTION / 8)
    PARTIAL_PRODUCT_0 <= (SINE_DIFF & "000") when FRACTION(0) = '1' else (others => '0');
    PARTIAL_PRODUCT_1 <= ('0' & SINE_DIFF & "00") when FRACTION(1) = '1' else (others => '0');
    PARTIAL_PRODUCT_2 <= ("00" & SINE_DIFF & '0') when FRACTION(2) = '1' else (others => '0');
    
    -- Somma dei prodotti parziali
    RCA_SUM_0_1: RCA
    generic map (N => N+3)
    port map(
        A    => PARTIAL_PRODUCT_0,
        B    => PARTIAL_PRODUCT_1,
        CIN  => '0',
        SUM  => SUM_0_1,
        COUT => open
    );
    
    RCA_FINAL_SUM: RCA
    generic map (N => N+3)
    port map(
        A    => SUM_0_1,
        B    => PARTIAL_PRODUCT_2,
        CIN  => '0',
        SUM  => FINAL_SUM,
        COUT => open
    );
    
    -- Divisione per 8 (prendiamo i bit da N+2 a 3)
    MULT_TEMP <= FINAL_SUM(N+2 downto 3);
    
    -- Somma finale
    RCA_FINAL: RCA 
    generic map (N => N)
    port map(
        A    => SINE1,
        B    => MULT_TEMP,
        CIN  => '0',
        SUM  => INTERPOLATED_SINE,
        COUT => open
    );
    
end RTL;