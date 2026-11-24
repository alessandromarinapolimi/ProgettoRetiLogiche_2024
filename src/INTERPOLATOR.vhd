----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  INTERPOLATOR - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  INTERPOLATED_SINE = PREV + floor(K * (NEXT - PREV) / 8), where
--               K = DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE (0..7).
--               K * (NEXT - PREV) is a 3-bit shift-and-add multiplier.
-- Dependencies: RCA, SUB
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTERPOLATOR is
    generic (
        N : positive  -- at least 3
    );
    port (
        DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE : in  std_logic_vector(2 downto 0);
        SINE_VALUE_PREVIOUS, SINE_VALUE_NEXT       : in  std_logic_vector(N-1 downto 0);
        INTERPOLATED_SINE                          : out std_logic_vector(N-1 downto 0)
    );
end entity INTERPOLATOR;

architecture RTL of INTERPOLATOR is

    signal SINE_DIFF         : std_logic_vector(N-1 downto 0);
    signal SINE_DIFF_X2      : std_logic_vector(N-1 downto 0);
    signal SINE_DIFF_X4      : std_logic_vector(N-1 downto 0);
    signal K0_MASK           : std_logic_vector(N-1 downto 0);
    signal K1_MASK           : std_logic_vector(N-1 downto 0);
    signal K2_MASK           : std_logic_vector(N-1 downto 0);
    signal PARTIAL_PRODUCT_0 : std_logic_vector(N-1 downto 0);
    signal PARTIAL_PRODUCT_1 : std_logic_vector(N-1 downto 0);
    signal PARTIAL_PRODUCT_2 : std_logic_vector(N-1 downto 0);
    signal PARTIAL_SUM       : std_logic_vector(N-1 downto 0);
    signal PRODUCT           : std_logic_vector(N-1 downto 0);
    signal DELTA_VALUE       : std_logic_vector(N-1 downto 0);

begin

    DIFF_CALCULATOR_SINE_VALUES : entity work.SUB
        generic map (
            N => N
        )
        port map (
            X    => SINE_VALUE_NEXT,
            Y    => SINE_VALUE_PREVIOUS,
            DIFF => SINE_DIFF
        );

    SINE_DIFF_X2 <= SINE_DIFF(N-2 downto 0) & '0';
    SINE_DIFF_X4 <= SINE_DIFF(N-3 downto 0) & "00";

    -- Each bit of K gates one partial product.
    K0_MASK <= (others => DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE(0));
    K1_MASK <= (others => DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE(1));
    K2_MASK <= (others => DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE(2));

    PARTIAL_PRODUCT_0 <= SINE_DIFF    and K0_MASK;
    PARTIAL_PRODUCT_1 <= SINE_DIFF_X2 and K1_MASK;
    PARTIAL_PRODUCT_2 <= SINE_DIFF_X4 and K2_MASK;

    RCA_PP01 : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => PARTIAL_PRODUCT_0,
            B    => PARTIAL_PRODUCT_1,
            CIN  => '0',
            SUM  => PARTIAL_SUM,
            COUT => open
        );

    RCA_PP2 : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => PARTIAL_SUM,
            B    => PARTIAL_PRODUCT_2,
            CIN  => '0',
            SUM  => PRODUCT,
            COUT => open
        );

    -- Divide by 8 with zero fill. This is only correct for NEXT >= PREV,
    -- which holds because the first-quadrant table is increasing.
    DELTA_VALUE <= "000" & PRODUCT(N-1 downto 3);

    FINAL_SUM : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => SINE_VALUE_PREVIOUS,
            B    => DELTA_VALUE,
            CIN  => '0',
            SUM  => INTERPOLATED_SINE,
            COUT => open
        );

end architecture RTL;
