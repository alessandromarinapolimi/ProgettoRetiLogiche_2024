----------------------------------------------------------------------------------
-- Engineer:       Alessandro Marina, Ashvinder Singh
-- Module Name:    SINE_CALCULATOR - RTL
-- Project Name:   ProgettoRetiLogiche_2024
-- Target Devices: xc7a200tsbg484-1
-- Description:    Top level. SINE = sin(ANGLE) for ANGLE = 0..359 degrees,
--                 Q2.8 two's complement, registered on the rising edge of CLK.
--                 The angle is folded into 0..90 and the sign is set after
--                 the lookup.
-- Dependencies:   COMPARATOR, SUB, RCA, ANGLE_SINE_MAPPER
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SINE_CALCULATOR is
    generic (
        M : positive := 9;   -- angle width; the folding logic assumes 9
        N : positive := 10   -- sine width
    );
    port (
        CLK   : in  std_logic;
        RST   : in  std_logic := '0';  -- synchronous, active high
        ANGLE : in  std_logic_vector(M-1 downto 0);
        SINE  : out std_logic_vector(N-1 downto 0)
    );
end entity SINE_CALCULATOR;

architecture RTL of SINE_CALCULATOR is

    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "001011010";
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "010110100";
    constant ANGLE_270 : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "100001110";
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "101101000";

    signal ANGLE_GREATER_THAN_90   : std_logic;
    signal ANGLE_GREATER_THAN_180  : std_logic;
    signal ANGLE_GREATER_THAN_270  : std_logic;
    signal SEL_Q1, SEL_Q2          : std_logic;
    signal SEL_Q3, SEL_Q4          : std_logic;
    signal SEL_Q1_V, SEL_Q2_V      : std_logic_vector(M-3 downto 0);
    signal SEL_Q3_V, SEL_Q4_V      : std_logic_vector(M-3 downto 0);
    signal SUB_180_ANGLE           : std_logic_vector(M-3 downto 0);
    signal SUB_ANGLE_180           : std_logic_vector(M-3 downto 0);
    signal SUB_360_ANGLE           : std_logic_vector(M-3 downto 0);
    signal QUADRANT_ADJUSTED_ANGLE : std_logic_vector(M-3 downto 0);
    signal SINE_TEMP_VALUE         : std_logic_vector(N-1 downto 0);
    signal SINE_NEG_TEMP_VALUE     : std_logic_vector(N-1 downto 0);
    signal SINE_NEG_VALUE          : std_logic_vector(N-1 downto 0);
    signal SEL_NEG_V               : std_logic_vector(N-1 downto 0);
    signal SINE_NEXT_VALUE         : std_logic_vector(N-1 downto 0);

begin

    COMP_90 : entity work.COMPARATOR
        generic map (
            N => M
        )
        port map (
            A                 => ANGLE,
            B                 => ANGLE_90,
            GREATER_THAN_FLAG => ANGLE_GREATER_THAN_90
        );

    COMP_180 : entity work.COMPARATOR
        generic map (
            N => M
        )
        port map (
            A                 => ANGLE,
            B                 => ANGLE_180,
            GREATER_THAN_FLAG => ANGLE_GREATER_THAN_180
        );

    COMP_270 : entity work.COMPARATOR
        generic map (
            N => M
        )
        port map (
            A                 => ANGLE,
            B                 => ANGLE_270,
            GREATER_THAN_FLAG => ANGLE_GREATER_THAN_270
        );

    -- The folded angle is at most 90, so 7 bits (M-2) are enough. The
    -- differences are taken modulo 2^7, which is exact inside each quadrant.
    SUB180ANGLE : entity work.SUB
        generic map (
            N => M-2
        )
        port map (
            X    => ANGLE_180(M-3 downto 0),
            Y    => ANGLE(M-3 downto 0),
            DIFF => SUB_180_ANGLE
        );

    SUBANGLE180 : entity work.SUB
        generic map (
            N => M-2
        )
        port map (
            X    => ANGLE(M-3 downto 0),
            Y    => ANGLE_180(M-3 downto 0),
            DIFF => SUB_ANGLE_180
        );

    SUB360ANGLE : entity work.SUB
        generic map (
            N => M-2
        )
        port map (
            X    => ANGLE_360(M-3 downto 0),
            Y    => ANGLE(M-3 downto 0),
            DIFF => SUB_360_ANGLE
        );

    -- The comparator flags form a thermometer code, so exactly one select is high.
    SEL_Q1 <= not ANGLE_GREATER_THAN_90;                                -- 0..90
    SEL_Q2 <= ANGLE_GREATER_THAN_90  and (not ANGLE_GREATER_THAN_180);  -- 91..180
    SEL_Q3 <= ANGLE_GREATER_THAN_180 and (not ANGLE_GREATER_THAN_270);  -- 181..270
    SEL_Q4 <= ANGLE_GREATER_THAN_270;                                   -- 271..359

    SEL_Q1_V <= (others => SEL_Q1);
    SEL_Q2_V <= (others => SEL_Q2);
    SEL_Q3_V <= (others => SEL_Q3);
    SEL_Q4_V <= (others => SEL_Q4);

    QUADRANT_ADJUSTED_ANGLE <= (ANGLE(M-3 downto 0) and SEL_Q1_V)
                            or (SUB_180_ANGLE       and SEL_Q2_V)
                            or (SUB_ANGLE_180       and SEL_Q3_V)
                            or (SUB_360_ANGLE       and SEL_Q4_V);

    ANGLE_SINE_MAPPER_INST : entity work.ANGLE_SINE_MAPPER
        generic map (
            N => N,
            M => M-3
        )
        port map (
            ANGLE => QUADRANT_ADJUSTED_ANGLE,
            SINE  => SINE_TEMP_VALUE
        );

    -- Two's complement negation: not(x) + 1.
    SINE_NEG_TEMP_VALUE <= not SINE_TEMP_VALUE;

    RCA_2COMPL : entity work.RCA
        generic map (
            N => N
        )
        port map (
            A    => SINE_NEG_TEMP_VALUE,
            B    => (others => '0'),
            CIN  => '1',
            SUM  => SINE_NEG_VALUE,
            COUT => open
        );

    SEL_NEG_V <= (others => ANGLE_GREATER_THAN_180);

    SINE_NEXT_VALUE <= (SINE_NEG_VALUE and SEL_NEG_V) or (SINE_TEMP_VALUE and (not SEL_NEG_V));

    SINE_REG : process (CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                SINE <= (others => '0');
            else
                SINE <= SINE_NEXT_VALUE;
            end if;
        end if;
    end process SINE_REG;

end architecture RTL;
