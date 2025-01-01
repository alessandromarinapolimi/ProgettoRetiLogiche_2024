library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERP is
    generic (
        N : positive  
    );
    
    Port (
        ANGLE_DIFF   : in std_logic_vector(2 downto 0);         -- Input: 3-bit angle difference
        SINE1        : in std_logic_vector(N-1 downto 0);        -- Input: First sine value
        SINE2        : in std_logic_vector(N-1 downto 0);        -- Input: Second sine value
        RESULT       : out std_logic_vector(N-1 downto 0)        -- Output: Interpolated sine result
    );
end INTERP;

architecture RTL of INTERP is

    component RCA is
        generic (N : positive);
        Port (
            A, B      : in  std_logic_vector(N-1 downto 0);
            CIN       : in  std_logic;
            SUM       : out std_logic_vector(N-1 downto 0);
            COUT      : out std_logic
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y   : in  std_logic_vector(N-1 downto 0);
            DIFF   : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal SINE_DIFF : std_logic_vector(N-1 downto 0);
    signal MULT_1, MULT_2, MULT_4 : std_logic_vector(N-1 downto 0);
    signal SUM_1, SUM_2, SUM_3, SUM_4 : std_logic_vector(N-1 downto 0);
    signal ADD_VALUE : std_logic_vector(N-1 downto 0);
    signal INTERP_VALUE : std_logic_vector(N-1 downto 0);  -- Nuovo segnale per il valore di interpolazione

begin

    -- Step 1: Calculate the difference between SINE2 and SINE1
    DIFF_CALC: SUB
        generic map (N => N)
        port map (
            X    => SINE2,
            Y    => SINE1,
            DIFF => SINE_DIFF
        );

    -- Step 2: Prepare multiples of the difference
    MULT_1 <= SINE_DIFF;                                -- SINE_DIFF * 1
    MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';            -- SINE_DIFF * 2
    MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";           -- SINE_DIFF * 4

    -- Step 3: Intermediate Additions
    RCA1: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => MULT_2,
            CIN  => '0',
            SUM  => SUM_1,
            COUT => open
        );

    RCA2: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_2,
            COUT => open
        );
        
    RCA3: RCA
        generic map (N => N)
        port map (
            A    => MULT_2,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_3,
            COUT => open
        );
        
    RCA4: RCA
        generic map (N => N)
        port map (
            A    => MULT_1,
            B    => SUM_3,
            CIN  => '0',
            SUM  => SUM_4,
            COUT => open
        );

    -- Step 4: Select correct interpolation value based on ANGLE_DIFF
    process(ANGLE_DIFF, MULT_1, MULT_2, MULT_4, SUM_1, SUM_2, SUM_3, SUM_4)
    begin
        case ANGLE_DIFF is
            when "001"   => INTERP_VALUE <= MULT_1;          -- Scale by 1
            when "010"   => INTERP_VALUE <= MULT_2;          -- Scale by 2
            when "011"   => INTERP_VALUE <= SUM_1;           -- Scale by 3 (1+2)
            when "100"   => INTERP_VALUE <= MULT_4;          -- Scale by 4
            when "101"   => INTERP_VALUE <= SUM_2;           -- Scale by 5 (1+4)
            when "110"   => INTERP_VALUE <= SUM_3;           -- Scale by 6 (2+4)
            when "111"   => INTERP_VALUE <= SUM_4;           -- Scale by 7 (1+2+4)
            when others  => INTERP_VALUE <= (others => '0');  -- Default case
        end case;
    end process;

    -- Step 5: Divide by 8 (right shift by 3)
    ADD_VALUE <= "000" & INTERP_VALUE(N-1 downto 3);

    -- Step 6: Final sum to get interpolated result
    FINAL_SUM: RCA
        generic map (N => N)
        port map (
            A    => SINE1,
            B    => ADD_VALUE,
            CIN  => '0',
            SUM  => RESULT,
            COUT => open
        );

end RTL;