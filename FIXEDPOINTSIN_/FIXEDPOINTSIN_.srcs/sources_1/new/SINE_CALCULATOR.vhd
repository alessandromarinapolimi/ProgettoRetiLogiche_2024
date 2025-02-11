library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- Sine Calculator (SINE)
--------------------------------------
entity SINE_CALCULATOR is
    generic (
        M : positive := 9;    -- Number of bits for the angle input
        N : positive := 10    -- Number of bits for sine values output
    );
    Port (
        CLK            : in  std_logic;
        RST          : in  std_logic := '0';
        ANGLE          : in  std_logic_vector(M-1 downto 0);
        SINE           : out std_logic_vector(N-1 downto 0)
    );
end SINE_CALCULATOR;

architecture structural of SINE_CALCULATOR is

    component ANGLE_SINE_MAPPER is
        generic (N,M : positive);
        Port (
            ANGLE       : in  std_logic_vector(M downto 0);
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
            GREATER_THAN_FLAG   : out std_logic  
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
    signal QUADRANT_ADJUSTED_ANGLE, SUB_180_ANGLE, SUB_ANGLE_180, SUB_360_ANGLE : std_logic_vector(M-3 downto 0);
    signal SINE_TEMP_VALUE, SINE_NEG_VALUE, SINE_NEG_TEMP_VALUE, SINE_NEXT_VALUE               : std_logic_vector(N-1 downto 0);
    signal ANGLE_GREATER_THAN_90, ANGLE_GREATER_THAN_180, ANGLE_GREATER_THAN_270                                       : std_logic;
    signal ANGLE_QUADRANT_SELECTOR                                     : std_logic_vector(2 downto 0);


begin

    --------
    -- Comparator instantiations
    --------
    COMP_90: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_90,
            GREATER_THAN_FLAG   => ANGLE_GREATER_THAN_90
        );

    COMP_180: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_180,
            GREATER_THAN_FLAG   => ANGLE_GREATER_THAN_180
        );

    COMP_270: COMPARATOR
        generic map (N => M)
        port map (
            A    => ANGLE,
            B    => ANGLE_270,
            GREATER_THAN_FLAG   => ANGLE_GREATER_THAN_270
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
    -- ANGLE_SINE_MAPPER instantiation for sine value lookup table
    --------
    ANGLE_SINE_MAPPER_INST: ANGLE_SINE_MAPPER
        generic map (N => N, M=>M-3)
        port map (
            ANGLE   => QUADRANT_ADJUSTED_ANGLE,
            SINE    => SINE_TEMP_VALUE
        );

    
    ANGLE_QUADRANT_SELECTOR <= ANGLE_GREATER_THAN_270 & ANGLE_GREATER_THAN_180 & ANGLE_GREATER_THAN_90;


    --------
    -- Two's complement logic for negative sine
    --------
    SINE_NEG_TEMP_VALUE <= not SINE_TEMP_VALUE;
    RCA_2COMPL: RCA
        generic map (N => N)
        port map (
            A    => SINE_NEG_TEMP_VALUE,
            B    => (others => '0'),  
            CIN  => '1',
            SUM  => SINE_NEG_VALUE,
            COUT => open
        );

    
  process(ANGLE_QUADRANT_SELECTOR, ANGLE, SUB_360_ANGLE, SUB_ANGLE_180, SUB_180_ANGLE)
    begin
        case ANGLE_QUADRANT_SELECTOR is
            when "111" =>   -- Quadrant 4 (271°-359°)
                QUADRANT_ADJUSTED_ANGLE <= SUB_360_ANGLE;
            when "011" =>   -- Quadrant 3 (181°-270°)
                QUADRANT_ADJUSTED_ANGLE <= SUB_ANGLE_180;
            when "001" =>   -- Quadrant 2 (91°-180°)
                QUADRANT_ADJUSTED_ANGLE <= SUB_180_ANGLE;
            when others => -- Quadrant 1 (0°-90°)
                QUADRANT_ADJUSTED_ANGLE <= ANGLE(M-3 downto 0);
        end case;
    end process;

    --------
    -- Combinational process for sine value selection
    --------
    process(ANGLE_QUADRANT_SELECTOR)
    begin
        if ANGLE_QUADRANT_SELECTOR(1) = '1' then
            SINE_NEXT_VALUE <= SINE_NEG_VALUE;
        else
            SINE_NEXT_VALUE <= SINE_TEMP_VALUE;
        end if;
    end process;

    --------
    -- Sequential process for registering outputs
    --------
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                 SINE <= (others => '0');
            else
                SINE <= SINE_NEXT_VALUE;
            end if;
        end if;
    end process;

end structural;
