library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

---------------------------------
-- Interpolator (INTERP)
---------------------------------
entity INTERP is
    generic (
        N : positive   -- Number of bits for sine values
    );
    Port (
        ANGLE_DIFF    : in  std_logic_vector(2 downto 0);         -- 3-bit angle difference input
        SINE1               : in  std_logic_vector(N-1 downto 0);     -- First sine value
        SINE2               : in  std_logic_vector(N-1 downto 0);     -- Second sine value
        RESULT            : out std_logic_vector(N-1 downto 0)    -- Interpolated result
    );
end entity INTERP;

architecture RTL of INTERP is

    component RCA is
        generic (N : positive);
        Port (
            A, B       : in  std_logic_vector(N-1 downto 0);       -- Operand inputs
            CIN        : in  std_logic;                                             -- Carry-in
            SUM      : out std_logic_vector(N-1 downto 0);     -- Sum output
            COUT    : out std_logic                                             -- Carry-out
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y      : in  std_logic_vector(N-1 downto 0);        -- Inputs: Minuend and Subtrahend
            DIFF     : out std_logic_vector(N-1 downto 0)       -- Output: Difference
        );
    end component;

    signal SINE_DIFF                : std_logic_vector(N-1 downto 0);     -- Difference between SINE2 and SINE1
    signal MULT_2, MULT_4    : std_logic_vector(N-1 downto 0);     -- Scaled differences
    signal SUM_1, SUM_2        : std_logic_vector(N-1 downto 0);     -- Intermediate sums
    signal ADD_VALUE             : std_logic_vector(N-1 downto 0);     -- Final value to be added
    
    begin
        ---------
        -- Step 1: Calculate the difference between SINE2 and SINE1
        ---------
        DIFF_CALC: SUB
            generic map (N)
            port map (
                X     => SINE2,
                Y     => SINE1,
                DIFF  => SINE_DIFF
            );
            
        ---------
        -- Step 2: Calculate multiples of the difference
        ---------
        MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';         -- Left shift by 1 (multiply by 2)
        MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";     -- Left shift by 2 (multiply by 4)
    
        ---------
        -- Step 3: Add multiples of SINE_DIFF using RCAs
        ---------
        RCA1: RCA
            generic map (N => N)
            port map (
                A     => SINE_DIFF,
                B     => MULT_2,
                CIN   => '0',
                SUM   => SUM_1,
                COUT  => open
            );
    
        RCA2: RCA
            generic map (N => N)
            port map (
                A     => SUM_1,
                B     => MULT_4,
                CIN   => '0',
                SUM   => SUM_2,
                COUT  => open
            );
    
        ---------
        -- Step 4: Select the correct value based on ANGLE_DIFF and divide by 8
        ---------
        process(ANGLE_DIFF, SINE_DIFF, MULT_2, MULT_4, SUM_1, SUM_2)
            variable temp : std_logic_vector(N-1 downto 0);
            
            begin
                case ANGLE_DIFF is
                    when "000"                 => temp := (others => '0');
                    when "001"                 => temp := SINE_DIFF;
                    when "010"                 => temp := MULT_2;
                    when "100"                 => temp := MULT_4;
                    when "011" | "101"    => temp := SUM_1;
                    when others               => temp := SUM_2;      -- For "110" or "111"
                end case;
        
            ADD_VALUE <= "000" & temp(N-1 downto 3);      -- Divide by 8 (right shift by 3)
        end process;
        
        ---------
        -- Step 5: Add ADD_VALUE to SINE1 to get the interpolated result
        ---------
        FINAL_SUM: RCA
            generic map (N => N)
            port map (
                A     => SINE1,
                B     => ADD_VALUE,
                CIN   => '0',
                SUM   => RESULT,
                COUT  => open
            );
            
end architecture RTL;