library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Interpolator (INTERP)
entity INTERP is
    generic (
        N : positive  
    );
    
    Port (
        ANGLE_DIFF   : in std_logic_vector(2 downto 0);         -- Input: 3-bit angle difference
        SINE1        : in std_logic_vector(N-1 downto 0);     -- Input: First sine value
        SINE2        : in std_logic_vector(N-1 downto 0);     -- Input: Second sine value
        RESULT       : out std_logic_vector(N-1 downto 0)   -- Output: Interpolated sine result
    );
end INTERP;

architecture RTL of INTERP is

    -- Component declaration for the RCA
    component RCA is
        generic (N,M : positive);
        
        Port (
            A, B    : in  std_logic_vector(N-1 downto 0);     -- Inputs: Operands A and B
            CIN     : in  std_logic;                          -- Input: Carry-in
            SUM     : out std_logic_vector(N-1 downto 0);     -- Output: Sum
            COUT    : out std_logic                           -- Output: Carry-out
        );
    end component;

    -- Component declaration for the SUB
    component SUB is
        generic (N,M : positive);
        
        Port (
            X, Y   : in  std_logic_vector(N-1 downto 0);      -- Inputs: X (minuend) and Y (subtrahend)
            DIFF   : out std_logic_vector(N-1 downto 0)       -- Output: Difference (X - Y)
        );
    end component;

    -- Signal declarations
    signal SINE_DIFF : std_logic_vector(N-1 downto 0);            -- Difference between SINE2 and SINE1
    signal MULT_1, MULT_2, MULT_4 : std_logic_vector(N-1 downto 0);     -- Multiples of the sine difference
    signal SUM_1, SUM_2 : std_logic_vector(N-1 downto 0);         -- Intermediate sums
    signal ADD_VALUE : std_logic_vector(N-1 downto 0);            -- Final add value for interpolation

begin

    -- Step 1: Calculate the difference between SINE2 and SINE1
    DIFF_CALC: SUB
        generic map (N,M => N)
        port map (
            X     => SINE2,      -- Input: SINE2
            Y     => SINE1,      -- Input: SINE1
            DIFF  => SINE_DIFF   -- Output: SINE_DIFF = SINE2 - SINE1
        );

    -- Step 2: Prepare multiples of the difference (SINE_DIFF, SINE_DIFF * 2, SINE_DIFF * 4)
    MULT_1 <= SINE_DIFF;                              -- MULT_1 is the sine difference (SINE_DIFF)
    MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';          -- MULT_2 is SINE_DIFF * 2 (left shift by 1)
    MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";         -- MULT_4 is SINE_DIFF * 4 (left shift by 2)

    -- Step 3: Add multiples of SINE_DIFF
    -- RCA1: Add MULT_1 and MULT_2
    RCA1: RCA
        generic map (N => N,M=>N)
        port map (
            A     => MULT_1,     -- Input: MULT_1
            B     => MULT_2,     -- Input: MULT_2
            CIN   => '0',        -- Carry-in is 0
            SUM   => SUM_1,      -- Output: SUM_1 = MULT_1 + MULT_2
            COUT  => open
        );

    -- RCA2: Add SUM_1 and MULT_4
    RCA2: RCA
        generic map (N => N,M=>N)
        port map (
            A     => SUM_1,      -- Input: SUM_1
            B     => MULT_4,     -- Input: MULT_4
            CIN   => '0',        -- Carry-in is 0
            SUM   => SUM_2,      -- Output: SUM_2 = SUM_1 + MULT_4
            COUT  => open
        );

    -- Step 4 and 5: Select the correct value based on ANGLE_DIFF and divide by 8
    process(ANGLE_DIFF, MULT_1, MULT_2, MULT_4, SUM_1, SUM_2)
        variable temp : std_logic_vector(N-1 downto 0);
    begin
        case ANGLE_DIFF is
            when "001"  => temp := MULT_1;
            when "010"  => temp := MULT_2;
            when "011"  => temp := SUM_1;
            when "100"  => temp := MULT_4;
            when "101"  => temp := SUM_1;
            when "110" | "111" => temp := SUM_2;
            when others => temp := (others => '0');
        end case;
        -- Divide by 8 (right shift by 3) and assign to ADD_VALUE
        ADD_VALUE <= "000" & temp(N-1 downto 3);
    end process;

    -- Step 6: Final sum - add ADD_VALUE to SINE1 to get the interpolated result
    FINAL_SUM: RCA
        generic map (N => N,M=>N)
        port map (
            A     => SINE1,      -- Input: SINE1
            B     => ADD_VALUE,  -- Input: ADD_VALUE
            CIN   => '0',        -- Carry-in is 0
            SUM   => RESULT,     -- Output: RESULT = SINE1 + ADD_VALUE
            COUT  => open
        );

end RTL;