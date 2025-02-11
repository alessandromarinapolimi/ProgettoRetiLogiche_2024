library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
 
--------------------------------------

-- Interpolator (INTERPOLATOR)

--------------------------------------

entity INTERPOLATOR is

    generic (

        N : positive                                                                                                        -- Number of bits for interpolation

    );

    Port (

        DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE      : in  std_logic_vector(2 downto 0);                     -- Input: 3-bit angle difference

        SINE_VALUE_PREVIOUS, SINE_VALUE_NEXT                        : in  std_logic_vector(N-1 downto 0);                 -- Input: First and second sine values

        INTERPOLATED_SINE          : out std_logic_vector(N-1 downto 0)                 -- Output: Interpolated result

    );

end entity INTERPOLATOR;
 
architecture RTL of INTERPOLATOR is
 
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

    signal SINE_DIFF    : std_logic_vector(N-1 downto 0);  -- Difference between SINE2 and SINE1

    signal SCALE_FACTOR_2         : std_logic_vector(N-1 downto 0);  -- SINE_DIFFERENCE multiplied by 2

    signal SCALE_FACTOR_4           : std_logic_vector(N-1 downto 0);  -- SINE_DIFFERENCE multiplied by 4

    signal SCALE_FACTOR_8           : std_logic_vector(N-1 downto 0);  -- SINE_DIFFERENCE multiplied by 8

    signal SCALE_FACTOR_3      : std_logic_vector(N-1 downto 0);  -- Sum of SINE_DIFFERENCE and DOUBLE_DIFF

    signal SCALE_FACTOR_5      : std_logic_vector(N-1 downto 0);  -- Sum of SINE_DIFFERENCE and QUAD_DIFF

    signal SCALE_FACTOR_6      : std_logic_vector(N-1 downto 0);  -- Sum of DOUBLE_DIFF and QUAD_DIFF

    signal SCALE_FACTOR_7      : std_logic_vector(N-1 downto 0);  -- OCTA_DIFF minus SINE_DIFFERENCE

    signal DELTA_VALUE         : std_logic_vector(N-1 downto 0);  -- Value to be added to SINE1

begin

    --------

    -- Step 1: Calculate difference between input sine values

    --------

    DIFF_CALCULATOR_SINE_VALUES: SUB

        generic map (

            N => N

        )

        port map (

            X    => SINE_VALUE_NEXT,

            Y    => SINE_VALUE_PREVIOUS,

            DIFF => SINE_DIFF

        );
 
    --------

    -- Step 2: Generate multiples through shifting

    --------

    SCALE_FACTOR_2 <= SINE_DIFF(N-2 downto 0) & '0';       -- Multiply by 2

    SCALE_FACTOR_4 <= SINE_DIFF(N-3 downto 0) & "00";      -- Multiply by 4

    SCALE_FACTOR_8 <= SINE_DIFF(N-4 downto 0) & "000";     -- Multiply by 8
 
    --------

    -- Step 3: Calculate intermediate sums and differences

    --------

    RCA3: RCA

        generic map (N => N)

        port map (

            A    => SINE_DIFF,

            B    => SCALE_FACTOR_2,

            CIN  => '0',

            SUM  => SCALE_FACTOR_3,

            COUT => open

        );
 
    RCA5: RCA

        generic map (N => N)

        port map (

            A    => SINE_DIFF,

            B    => SCALE_FACTOR_4,

            CIN  => '0',

            SUM  => SCALE_FACTOR_5,

            COUT => open

        );
 
    RCA6: RCA

        generic map (N => N)

        port map (

            A    => SCALE_FACTOR_2,

            B    => SCALE_FACTOR_4,

            CIN  => '0',

            SUM  => SCALE_FACTOR_6,

            COUT => open

        );
 
    SUB7: SUB

        generic map (N => N)

        port map (

            X    => SCALE_FACTOR_8,

            Y    => SINE_DIFF,

            DIFF => SCALE_FACTOR_7

        );
 
    --------

    -- Step 4: Select interpolation value based on angle difference

    --------

    process(DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE, SINE_VALUE_PREVIOUS)

    variable temp : std_logic_vector(N-4 downto 0);

    begin

        case DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE is

            when "001"   => temp := SINE_DIFF(N-1 downto 3);             -- Scale by 1

            when "010"   => temp := SCALE_FACTOR_2(N-1 downto 3);       -- Scale by 2

            when "011"   => temp := SCALE_FACTOR_3(N-1 downto 3);       -- Scale by 3

            when "100"   => temp := SCALE_FACTOR_4(N-1 downto 3);        -- Scale by 4

            when "101"   => temp := SCALE_FACTOR_5(N-1 downto 3);       -- Scale by 5

            when "110"   => temp := SCALE_FACTOR_6(N-1 downto 3);       -- Scale by 6

            when others => temp := SCALE_FACTOR_7(N-1 downto 3);        -- Scale by 7

        end case;

        DELTA_VALUE <= "000" & temp;

    end process;
 
    --------

    -- Step 5: Calculate final interpolated result

    --------

    FINAL_SUM: RCA

        generic map (N => N)

        port map (

            A    => SINE_VALUE_PREVIOUS,

            B    => DELTA_VALUE,

            CIN  => '0',

            SUM  => INTERPOLATED_SINE,

            COUT => open

        );
 
end architecture RTL;
 