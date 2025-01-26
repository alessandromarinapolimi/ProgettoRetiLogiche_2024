library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- Interpolator (INTERP)
--------------------------------------
entity INTERP is
    generic (
        N : positive                                                                                     -- Number of bits for interpolation
    );
    Port (
        ANGLE_DIFF     : in  std_logic_vector(2 downto 0);                     -- Input: 3-bit angle difference
        SINE1, SINE2    : in  std_logic_vector(N-1 downto 0);                 -- Input: First and second sine values
        RESULT             : out std_logic_vector(N-1 downto 0)                 -- Output: Interpolated result
    );
end entity INTERP;

architecture RTL of INTERP is

    --------
    -- Component declarations
    --------
    component RCA is
        generic (
            N : positive
        );
        Port (
            A, B        : in  std_logic_vector(N-1 downto 0);            -- Input operands
            CIN         : in  std_logic;                                                  -- Carry input
            SUM       : out std_logic_vector(N-1 downto 0);          -- Sum output
            COUT     : out std_logic                                                  -- Carry output
        );
    end component;

    component SUB is
        generic (
            N : positive
        );
        Port (
            X, Y      : in  std_logic_vector(N-1 downto 0);               -- Input operands
            DIFF     : out std_logic_vector(N-1 downto 0)              -- Difference output
        );
    end component;

    --------
    -- Internal signals for intermediate calculations
    --------
    signal SINE_DIFF, MULT_2, MULT_4, MULT_8, SUM_1_2, SUM_1_4,  SUM_2_4, SUB_8_1, ADD_VALUE : std_logic_vector(N-1 downto 0);
    
begin
    --------
    -- Step 1: Calculate difference between input sine values
    --------
    DIFF_CALC: SUB
        generic map (
            N => N
        )
        port map (
            X    => SINE2,
            Y    => SINE1,
            DIFF => SINE_DIFF
        );

    --------
    -- Step 2: Generate multiples through shifting
    --------
    MULT_2 <= SINE_DIFF(N-2 downto 0) & '0';                              -- Multiply by 2
    MULT_4 <= SINE_DIFF(N-3 downto 0) & "00";                           -- Multiply by 4
    MULT_8 <= SINE_DIFF(N-4 downto 0) & "000";                         -- Multiply by 8

    --------
    -- Step 3: Calculate intermediate sums and differences
    --------
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

    --------
    -- Step 4: Select interpolation value based on angle difference
    --------
    process(ANGLE_DIFF, SINE_DIFF, MULT_2, MULT_4, SUM_1_2, SUM_1_4, SUM_2_4, SUB_8_1)
    variable temp : std_logic_vector(N-4 downto 0);
    begin
        case ANGLE_DIFF is
            when "001"   => temp := SINE_DIFF(N-1 downto 3);   -- Scale by 1
            when "010"   => temp := MULT_2(N-1 downto 3);       -- Scale by 2
            when "011"   => temp := SUM_1_2(N-1 downto 3);      -- Scale by 3
            when "100"   => temp := MULT_4(N-1 downto 3);       -- Scale by 4
            when "101"   => temp := SUM_1_4(N-1 downto 3);      -- Scale by 5
            when "110"   => temp := SUM_2_4(N-1 downto 3);      -- Scale by 6
            when others => temp := SUB_8_1(N-1 downto 3);       -- Scale by 7
        end case;
        ADD_VALUE <= "000" & temp;
    end process;

    --------
    -- Step 5: Calculate final interpolated result
    --------
    FINAL_SUM: RCA
        generic map (N => N)
        port map (
            A    => SINE1,
            B    => ADD_VALUE,
            CIN  => '0',
            SUM  => RESULT,
            COUT => open
        );

end architecture RTL;