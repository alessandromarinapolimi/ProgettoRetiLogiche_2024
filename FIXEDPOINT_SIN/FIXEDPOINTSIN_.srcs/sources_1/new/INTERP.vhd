library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERP is
    generic (
        N : positive
    );
    Port (
        ANGLE_DIFF : in std_logic_vector(2 downto 0);
        SINE1      : in std_logic_vector(N-1 downto 0);
        SINE2      : in std_logic_vector(N-1 downto 0);
        RESULT     : out std_logic_vector(N-1 downto 0)
    );
end INTERP;

architecture RTL of INTERP is
    component RCA is
        generic (N : positive);
        Port (
            A, B  : in  std_logic_vector(N-1 downto 0);
            CIN   : in  std_logic;
            SUM   : out std_logic_vector(N-1 downto 0);
            COUT  : out std_logic
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y  : in  std_logic_vector(N-1 downto 0);
            DIFF  : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- Segnali per le differenze e i multipli
    signal SINE_DIFF : std_logic_vector(N-1 downto 0);
    signal MULT_1, MULT_2, MULT_4 : std_logic_vector(N-1 downto 0);
    
    -- Segnali per le somme intermedie (calcolate in parallelo)
    signal SUM_1_2, SUM_1_4, SUM_2_4, SUM_1_2_4 : std_logic_vector(N-1 downto 0);
    
    -- Segnale per il valore selezionato prima della divisione
    signal SELECTED_VALUE : std_logic_vector(N-1 downto 0);
    
    -- Segnale per il valore dopo la divisione
    signal DIVIDED_VALUE : std_logic_vector(N-1 downto 0);

begin
    -- Calcolo parallelo della differenza
    DIFF_UNIT: SUB
        generic map (N => N)
        port map (
            X    => SINE2,
            Y    => SINE1,
            DIFF => SINE_DIFF
        );

    -- Calcolo parallelo dei multipli
    MULT_PARALLEL: process(SINE_DIFF)
    begin
        MULT_1 <= SINE_DIFF;
        MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';
        MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";
    end process;

    -- Calcolo parallelo di tutte le possibili somme
    SUM_PARALLEL_1_2: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => MULT_2,
            CIN  => '0',
            SUM  => SUM_1_2,
            COUT => open
        );

    SUM_PARALLEL_1_4: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_1_4,
            COUT => open
        );

    SUM_PARALLEL_2_4: RCA
        generic map (N => N)
        port map (
            A    => MULT_2,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_2_4,
            COUT => open
        );

    SUM_PARALLEL_1_2_4: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => SUM_2_4,
            CIN  => '0',
            SUM  => SUM_1_2_4,
            COUT => open
        );

    -- Selezione parallela del valore basato su ANGLE_DIFF
    VALUE_SELECT: process(ANGLE_DIFF, MULT_1, MULT_2, MULT_4, 
                         SUM_1_2, SUM_1_4, SUM_2_4, SUM_1_2_4)
    begin
        case ANGLE_DIFF is
            when "001"  => SELECTED_VALUE <= MULT_1;
            when "010"  => SELECTED_VALUE <= MULT_2;
            when "011"  => SELECTED_VALUE <= SUM_1_2;
            when "100"  => SELECTED_VALUE <= MULT_4;
            when "101"  => SELECTED_VALUE <= SUM_1_4;
            when "110"  => SELECTED_VALUE <= SUM_2_4;
            when "111"  => SELECTED_VALUE <= SUM_1_2_4;
            when others => SELECTED_VALUE <= (others => '0');
        end case;
    end process;

    -- Divisione per 8 (shift right di 3) in parallelo
    DIVIDED_VALUE <= "000" & SELECTED_VALUE(N-1 downto 3);

    -- Somma finale in parallelo
    FINAL_ADD: RCA
        generic map (N => N)
        port map (
            A    => SINE1,
            B    => DIVIDED_VALUE,
            CIN  => '0',
            SUM  => RESULT,
            COUT => open
        );

end RTL;