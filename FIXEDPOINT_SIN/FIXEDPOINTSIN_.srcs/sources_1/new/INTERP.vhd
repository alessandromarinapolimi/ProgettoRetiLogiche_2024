library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERP is
    generic (
        N : positive := 10 
    );
    
    Port (
        ANGLE_DIFF   : in std_logic_vector(2 downto 0);          -- Input: 3-bit angle difference
        SINE1, SINE2 : in std_logic_vector(N-1 downto 0);        -- Input: First sine value & Second sine value 
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

    signal SINE_DIFF, MULT_2, MULT_4,  MULT_8, SUM_1_2, SUM_1_4, SUM_2_4, SUB_8_1, ADD_VALUE : std_logic_vector(N-1 downto 0);

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
    MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';            -- SINE_DIFF * 2
    MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";           -- SINE_DIFF * 4
    MULT_8 <= SINE_DIFF(N-4 downto 0) & "000";          -- SINE_DIFF * 8

    -- Step 3: Intermediate Additions and Subtractions
    RCA3: RCA
        generic map (N => N)
        port map (
            A    => SINE_DIFF,
            B    => MULT_2,
            CIN  => '0',
            SUM  => SUM_1_2,
            COUT => open
        );

    RCA5: RCA
        generic map (N => N)
        port map (
            A    => SINE_DIFF,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_1_4,
            COUT => open
        );
        
    RCA6: RCA
        generic map (N => N)
        port map (
            A    => MULT_2,
            B    => MULT_4,
            CIN  => '0',
            SUM  => SUM_2_4,
            COUT => open
        );
        
    SUB7: SUB
        generic map (N => N)
        port map (
            X    => MULT_8,
            Y    => SINE_DIFF,
            DIFF => SUB_8_1  
        );
 
    -- Step 4 & 5: Select correct interpolation value based on ANGLE_DIFF & divide by 8 (right shift by 3) 
        process(ANGLE_DIFF, SINE_DIFF, MULT_2, MULT_4, SUM_1_2, SUM_1_4, SUM_2_4, SUB_8_1)
        begin
            case ANGLE_DIFF is
                when "001"   => ADD_VALUE <= "000" & SINE_DIFF(N-1 downto 3);      -- Scale by 1
                when "010"   => ADD_VALUE <= "000" & MULT_2(N-1 downto 3);         -- Scale by 2
                when "011"   => ADD_VALUE <= "000" & SUM_1_2(N-1 downto 3);        -- Scale by 3 (1+2)
                when "100"   => ADD_VALUE <= "000" & MULT_4(N-1 downto 3);         -- Scale by 4
                when "101"   => ADD_VALUE <= "000" & SUM_1_4(N-1 downto 3);        -- Scale by 5 (1+4)
                when "110"   => ADD_VALUE <= "000" & SUM_2_4(N-1 downto 3);        -- Scale by 6 (2+4)
                when others  => ADD_VALUE <= "000" & SUB_8_1(N-1 downto 3);        -- Default case "111", scale by 7 (8-1)
            end case;
        end process;

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