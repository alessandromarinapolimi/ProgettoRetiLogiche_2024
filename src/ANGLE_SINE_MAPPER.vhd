----------------------------------------------------------------------------------
-- Engineer:     Alessandro Marina, Ashvinder Singh
-- Module Name:  ANGLE_SINE_MAPPER - RTL
-- Project Name: ProgettoRetiLogiche_2024
-- Description:  First-quadrant sine (ANGLE = 0..90 degrees) in Q2.8.
--               ANGLE(6 downto 3) selects the two table entries around the
--               angle and ANGLE(2 downto 0) is the interpolation step.
-- Dependencies: INTERPOLATOR
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANGLE_SINE_MAPPER is
    generic (
        N : positive := 10;
        M : positive := 6   -- MSB index of ANGLE; the table needs M = 6
    );
    port (
        ANGLE : in  std_logic_vector(M downto 0);
        SINE  : out std_logic_vector(N-1 downto 0)
    );
end entity ANGLE_SINE_MAPPER;

architecture RTL of ANGLE_SINE_MAPPER is

    -- sin(0), sin(8), ..., sin(88), sin(90)
    type LUT_TYPE is array (0 to 12) of std_logic_vector(N-1 downto 0);
    constant SINE_LUT : LUT_TYPE := (
        "0000000000",  -- 0.00000000
        "0000100011",  -- 0.13671875
        "0001000110",  -- 0.27343750
        "0001101000",  -- 0.40625000
        "0010000111",  -- 0.52734375
        "0010100100",  -- 0.64062500
        "0010111110",  -- 0.74218750
        "0011010100",  -- 0.82812500
        "0011100110",  -- 0.89843750
        "0011110011",  -- 0.94921875
        "0011111100",  -- 0.98437500
        "0011111111",  -- 0.99609375
        "0100000000"   -- 1.00000000
    );

    signal LUT_ADDR            : std_logic_vector(3 downto 0);
    signal SINE_VALUE_PREVIOUS : std_logic_vector(N-1 downto 0);
    signal SINE_VALUE_NEXT     : std_logic_vector(N-1 downto 0);
    signal INTERPOLATED_SINE   : std_logic_vector(N-1 downto 0);
    signal IS_90               : std_logic;
    signal IS_90_V             : std_logic_vector(N-1 downto 0);

begin

    LUT_ADDR <= ANGLE(6 downto 3);

    -- Addresses 11 and up cover 88..90; 91..127 never reach this block.
    with LUT_ADDR select SINE_VALUE_PREVIOUS <=
        SINE_LUT(0)  when "0000",
        SINE_LUT(1)  when "0001",
        SINE_LUT(2)  when "0010",
        SINE_LUT(3)  when "0011",
        SINE_LUT(4)  when "0100",
        SINE_LUT(5)  when "0101",
        SINE_LUT(6)  when "0110",
        SINE_LUT(7)  when "0111",
        SINE_LUT(8)  when "1000",
        SINE_LUT(9)  when "1001",
        SINE_LUT(10) when "1010",
        SINE_LUT(11) when others;

    with LUT_ADDR select SINE_VALUE_NEXT <=
        SINE_LUT(1)  when "0000",
        SINE_LUT(2)  when "0001",
        SINE_LUT(3)  when "0010",
        SINE_LUT(4)  when "0011",
        SINE_LUT(5)  when "0100",
        SINE_LUT(6)  when "0101",
        SINE_LUT(7)  when "0110",
        SINE_LUT(8)  when "0111",
        SINE_LUT(9)  when "1000",
        SINE_LUT(10) when "1001",
        SINE_LUT(11) when "1010",
        SINE_LUT(12) when others;

    INTERPOLATOR_INST : entity work.INTERPOLATOR
        generic map (
            N => N
        )
        port map (
            DIFF_BETWEEN_ANGLE_AND_PREVIOUS_8_MULTIPLE => ANGLE(2 downto 0),
            SINE_VALUE_PREVIOUS                        => SINE_VALUE_PREVIOUS,
            SINE_VALUE_NEXT                            => SINE_VALUE_NEXT,
            INTERPOLATED_SINE                          => INTERPOLATED_SINE
        );

    -- Interpolating between sin(88) and sin(90) with K = 2 truncates to
    -- sin(88), so 90 ("1011010") is decoded separately and forced to 1.
    IS_90 <= ANGLE(6) and (not ANGLE(5)) and ANGLE(4) and ANGLE(3)
             and (not ANGLE(2)) and ANGLE(1) and (not ANGLE(0));
    IS_90_V <= (others => IS_90);

    SINE <= (SINE_LUT(12) and IS_90_V) or (INTERPOLATED_SINE and (not IS_90_V));

end architecture RTL;
