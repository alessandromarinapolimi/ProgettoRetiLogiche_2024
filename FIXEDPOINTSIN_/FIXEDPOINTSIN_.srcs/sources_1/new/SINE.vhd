library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- Sine Calculator (SINE)
--------------------------------------
entity SINE is
    generic (
        M : positive := 9;    -- Number of bits for the angle input
        N : positive := 10    -- Number of bits for sine values output
    );
    Port (
        CLK            : in  std_logic;
        ANGLE          : in  std_logic_vector(M-1 downto 0);
        SINE           : out std_logic_vector(N-1 downto 0) := (others => '0')
    );
end SINE;

architecture structural of SINE is

    component LUT is
        generic (N : positive);
        Port (
            ANGLE       : in  std_logic_vector(M-3 downto 0);
            SINE        : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y     : in  std_logic_vector(N-1 downto 0);
            DIFF     : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component RCA is
        generic (N : positive);
        Port (
            A, B    : in  std_logic_vector(N-1 downto 0);
            CIN     : in  std_logic;
            SUM     : out std_logic_vector(N-1 downto 0);
            COUT    : out std_logic
        );
    end component;

    component COMPARATOR is
        generic (N : positive);
        Port (
            A    : in  std_logic_vector(N-1 downto 0);
            B    : in  std_logic_vector(N-1 downto 0);
            GT   : out std_logic  
        );
    end component;

    --------
    -- Constants
    --------
    constant ANGLE_90    : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "001011010";
    constant ANGLE_180   : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "010110100";
    constant ANGLE_270   : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "100001110";
    constant ANGLE_360   : std_logic_vector(M-1 downto 0) := (M-1 downto 9 => '0') & "101101000";

    --------
    -- Signals
    --------
    signal ANGLE_ADJUSTED, SUB_180_ANGLE, SUB_ANGLE_180, SUB_360_ANGLE   : std_logic_vector(M-3 downto 0);
    signal SINE_TEMP, SINE_NEG_TEMP, SINE_NEG                            : std_logic_vector(N-1 downto 0);
    signal GT_90, GT_180, GT_270, NEG_FLAG                               : std_logic;  

begin

    --------
    -- Comparator instantiations
    --------
    COMP_90: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_90,
            GT   => GT_90
        );

    COMP_180: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_180,
            GT   => GT_180
        );

    COMP_270: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_270,
            GT   => GT_270
        );

    --------
    -- Subtraction logic
    --------
    SUB180ANGLE: SUB
        generic map (N => M-2)
        port map (
            X    => ANGLE_180(M-3 downto 0),
            Y    => ANGLE(M-3 downto 0),
            DIFF => SUB_180_ANGLE
        );

    SUBANGLE180: SUB
        generic map (N => M-2)
        port map (
            X    => ANGLE(M-3 downto 0),
            Y    => ANGLE_180(M-3 downto 0),
            DIFF => SUB_ANGLE_180
        );

    SUB360ANGLE: SUB
        generic map (N => M-2)
        port map (
            X    => ANGLE_360(M-3 downto 0),
            Y    => ANGLE(M-3 downto 0),
            DIFF => SUB_360_ANGLE
        );

    --------
    -- LUT instantiation for sine value lookup table
    --------
    LUT_INST: LUT
        generic map (N => N)
        port map (
            ANGLE   => ANGLE_ADJUSTED,
            SINE    => SINE_TEMP
        );

    --------
    -- Two's complement logic for negative sine
    --------
    SINE_NEG_TEMP <= not SINE_TEMP;
    RCA_2COMPL: RCA
        generic map (N => N)
        port map (
            A    => SINE_NEG_TEMP,
            B    => (others => '0'),  
            CIN  => '1',
            SUM  => SINE_NEG,
            COUT => open
        );

    --------
    -- Angle quadrant adjustment
    --------
    process(CLK)
    begin
        if rising_edge(CLK) then
           if GT_270 = '1' then                        -- Quadrant 4 (271°-359°)
                ANGLE_ADJUSTED <= SUB_360_ANGLE;
                NEG_FLAG <= '1';
                
            elsif GT_180 = '1' then                    -- Quadrant 3 (181°-270°)
                ANGLE_ADJUSTED <= SUB_ANGLE_180;
                NEG_FLAG <= '1';
                
            elsif GT_90 = '1' then                     -- Quadrant 2 (91°-180°)
                ANGLE_ADJUSTED <= SUB_180_ANGLE;
                NEG_FLAG <= '0';
                
            else                                       -- Quadrant 1 (0°-90°)
                ANGLE_ADJUSTED <= ANGLE(M-3 downto 0);
                NEG_FLAG <= '0';
            end if;
        end if;
    end process;
    
    --------
    -- Sine value output logic
    --------
    process(CLK)
    begin
       if falling_edge(CLK) then
        if NEG_FLAG = '1' then
            SINE <= SINE_NEG;
        else
            SINE <= SINE_TEMP;
        end if;
    end if;
    end process;

end structural;
