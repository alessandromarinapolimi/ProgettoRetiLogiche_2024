library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Interpolator (INTERP)
entity INTERP is
    generic (
        N : positive  
    );
    
    Port (
        ANGLE_DIFF   : in std_logic_vector(2 downto 0);         -- Input: 3-bit angle difference
        SINE1              : in std_logic_vector(N-1 downto 0);     -- Input: First sine value
        SINE2              : in std_logic_vector(N-1 downto 0);     -- Input: Second sine value
        RESULT           : out std_logic_vector(N-1 downto 0)   -- Output: Interpolated sine result
    );
end INTERP;

architecture RTL of INTERP is

    -- Component declaration for the RCA
    component RCA is
        generic (N : positive);
        
        Port (
            A, B      : in  std_logic_vector(N-1 downto 0);             -- Inputs: Operands A and B
            CIN       : in  std_logic;                                                   -- Input: Carry-in
            SUM     : out std_logic_vector(N-1 downto 0);           -- Output: Sum
            COUT   : out std_logic                                                   -- Output: Carry-out
        );
    end component;

    -- Component declaration for the SUB
    component SUB is
        generic (N : positive);
        
        Port (
            X, Y   : in  std_logic_vector(N-1 downto 0);      -- Inputs: X (minuend) and Y (subtrahend)
            DIFF  : out std_logic_vector(N-1 downto 0)     -- Output: Difference (X - Y)
        );
    end component;

    -- Signal declarations
    signal SINE_DIFF : std_logic_vector(N-1 downto 0);                                -- Difference between SINE2 and SINE1
    signal MULT_1, MULT_2, MULT_4 : std_logic_vector(N-1 downto 0);     -- Multiples of the sine difference
    signal SUM_1, SUM_2,SUM_3 : std_logic_vector(N-1 downto 0);                        -- Intermediate sums
    signal ADD_VALUE : std_logic_vector(N-1 downto 0);                              -- Final add value for interpolation

begin

    -- Step 1: Calculate the difference between SINE2 and SINE1
    DIFF_CALC: SUB
        generic map (N => N)
        port map (
            X            => SINE2,          -- Input: SINE2
            Y            => SINE1,          -- Input: SINE1
            DIFF      => SINE_DIFF    -- Output: SINE_DIFF = SINE2 - SINE1
        );

    -- Step 2: Prepare multiples of the difference (SINE_DIFF, SINE_DIFF * 2, SINE_DIFF * 4)
    MULT_1 <= SINE_DIFF;                                              -- MULT_1 is the sine difference (SINE_DIFF)
    MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';            -- MULT_2 is SINE_DIFF * 2 (left shift by 1)
    MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";        -- MULT_4 is SINE_DIFF * 4 (left shift by 2)

    -- Step 3: Add multiples of SINE_DIFF
    -- RCA1: Add MULT_1 and MULT_2
    RCA1: RCA
        generic map (N => N)
        port map (
            A            => MULT_1,           -- Input: MULT_1
            B            => MULT_2,           -- Input: MULT_2
            CIN        => '0',                     -- Carry-in is 0
            SUM      => SUM_1,             -- Output: SUM_1 = MULT_1 + MULT_2
            COUT    => open
        );

    -- RCA2: Add SUM_1 and MULT_4
    RCA2: RCA
        generic map (N => N)
        port map (
            A              => SUM_1,           -- Input: SUM_1
            B              => MULT_4,         -- Input: MULT_4
            CIN          => '0',                   -- Carry-in is 0
            SUM        => SUM_2,           -- Output: SUM_2 = SUM_1 + MULT_4
            COUT      => open
        );

    -- Step 4: Multiplexer to select the correct value based on ANGLE_DIFF
    process(ANGLE_DIFF, MULT_1, MULT_2, MULT_4, SUM_1, SUM_2)
    begin
        case ANGLE_DIFF is
            when "001"                   => SUM_3 <= MULT_1;            -- Select MULT_1 when ANGLE_DIFF is "001"
            when "010"                   => SUM_3 <= MULT_2;            -- Select MULT_2 when ANGLE_DIFF is "010"
            when "011"                   => SUM_3 <= SUM_1;              -- Select SUM_1 when ANGLE_DIFF is "011"
            when "100"                   => SUM_3 <= MULT_4;            -- Select MULT_4 when ANGLE_DIFF is "100"
            when "101"                   => SUM_3 <= SUM_1;              -- Select SUM_1 when ANGLE_DIFF is "101"
            when "110"                   => SUM_3 <= SUM_2;              -- Select SUM_2 when ANGLE_DIFF is "110"
            when "111"                   => SUM_3 <= SUM_2;              -- Select SUM_2 when ANGLE_DIFF is "111"
            when others                 => SUM_3 <= (others => '0');  -- Default: set SUM_3 to 0
        end case;
    end process;

    -- Step 5: Divide SUM_3 by 8 (right shift by 3) to normalize
    ADD_VALUE <= "000" & SUM_3(N-1 downto 3);  -- Shift right by 3

    -- Step 6: Final sum - add ADD_VALUE to SINE1 to get the interpolated result
    FINAL_SUM: RCA
        generic map (N => N)
        port map (
            A             => SINE1,               -- Input: SINE1
            B             => ADD_VALUE,    -- Input: ADD_VALUE
            CIN         => '0',                     -- Carry-in is 0
            SUM       => RESULT,            -- Output: RESULT = SINE1 + ADD_VALUE
            COUT     => open
        );

end RTL;
