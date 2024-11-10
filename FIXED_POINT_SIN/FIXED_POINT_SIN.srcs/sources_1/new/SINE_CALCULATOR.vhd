library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity: SINE_CALCULATOR
-- This module calculates the sine of an input angle using a pipelined architecture
-- The calculation is done using lookup tables and quadrant determination
entity SINE_CALCULATOR is
    generic (
        N : positive := 10;  -- Number of bits for sine values (amplitude precision)
        M : positive := 9    -- Number of bits for the angle input (angle precision)
    );
    Port (
        CLK     : in  std_logic;                                              -- System clock
        RESET   : in  std_logic;                                            -- Asynchronous reset
        ANGLE   : in  std_logic_vector(M-1 downto 0);    -- Input angle (0 to 360 degrees)
        SINE    : out std_logic_vector(N-1 downto 0)       -- Output sine value
    );
end SINE_CALCULATOR;

architecture structural of SINE_CALCULATOR is
    -- Component declarations for the building blocks
    component LUT is
        generic (N : positive);
        Port (
            ANGLE : in  std_logic_vector(6 downto 0);     -- Input angle for lookup
            SINE  : out std_logic_vector(N-1 downto 0)    -- Sine value from lookup table
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X    : in  std_logic_vector(N-1 downto 0);        -- Minuend
            Y    : in  std_logic_vector(N-1 downto 0);        -- Subtrahend
            DIFF : out std_logic_vector(N-1 downto 0)     -- Difference result
        );
    end component;

    component RCA is
        generic (N : positive);
        Port (
            A, B  : in  std_logic_vector(N-1 downto 0);       -- Input operands
            CIN   : in  std_logic;                                             -- Carry input
            SUM   : out std_logic_vector(N-1 downto 0);   -- Sum result
            COUT  : out std_logic                                          -- Carry output
        );
    end component;

    -- Constants for quadrant determination
    -- These values represent angles in the same units as the input ANGLE
    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := "001011010";   -- 90 degrees
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := "010110100";  -- 180 degrees
    constant ANGLE_270 : std_logic_vector(M-1 downto 0) := "100001110";  -- 270 degrees
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := "101101000";  -- 360 degrees
    constant ONE_N    : std_logic_vector(N-1 downto 0) := (0 => '1', others => '0'); -- Constant 1 for two's complement

    -- Pipeline stage registers and control signals
    signal ANGLE_REG              : std_logic_vector(M-1 downto 0);     -- Registered input angle
    signal QUADRANT               : std_logic_vector(1 downto 0);         -- Current quadrant (00=1st, 01=2nd, 10=3rd, 11=4th)
    signal ANGLE_ADJUSTED    : std_logic_vector(6 downto 0);          -- Adjusted angle for LUT access
    signal SINE_TEMP               : std_logic_vector(N-1 downto 0);      -- Temporary sine value from LUT
    signal SINE_NEG                 : std_logic;                                             -- Flag for negative sine value
    signal SINE_FINAL              : std_logic_vector(N-1 downto 0);       -- Final calculated sine value
    
    -- Signals for two's complement calculation
    signal SINE_NEG_TEMP    : std_logic_vector(N-1 downto 0);      -- Inverted sine value
    signal RCA_RESULT           : std_logic_vector(N-1 downto 0);     -- Result of two's complement
    
    -- Signals for angle adjustments in different quadrants
    signal ANGLE_180_MINUS_REG : std_logic_vector(6 downto 0);   -- 180° - angle
    signal ANGLE_REG_MINUS_180 : std_logic_vector(6 downto 0);   -- angle - 180°
    signal ANGLE_360_MINUS_REG : std_logic_vector(6 downto 0);   -- 360° - angle
    
begin
    -- Stage 1: Input registration and quadrant determination
    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_REG <= (others => '0');
            QUADRANT <= "00";
        elsif rising_edge(CLK) then
            ANGLE_REG <= ANGLE;
            -- Determine quadrant based on angle value
            if ANGLE_REG < ANGLE_90 then
                QUADRANT <= "00";      -- First quadrant (0° to 90°)
            elsif ANGLE_REG < ANGLE_180 then
                QUADRANT <= "01";      -- Second quadrant (90° to 180°)
            elsif ANGLE_REG < ANGLE_270 then
                QUADRANT <= "10";      -- Third quadrant (180° to 270°)
            else
                QUADRANT <= "11";      -- Fourth quadrant (270° to 360°)
            end if;
        end if;
    end process;

    -- Instantiate subtractors for angle adjustments
    SUB_180_MINUS_REG: SUB
    generic map (N => 7) 
    port map (
        X    => ANGLE_180(6 downto 0), 
        Y    => ANGLE_REG(6 downto 0),  
        DIFF => ANGLE_180_MINUS_REG     -- Calculates 180° - angle
    );

    SUB_REG_MINUS_180: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE_REG(6 downto 0),  
        Y    => ANGLE_180(6 downto 0), 
        DIFF => ANGLE_REG_MINUS_180     -- Calculates angle - 180°
    );

    SUB_360_MINUS_REG: SUB
    generic map (N => 7) 
    port map (
        X    => ANGLE_360(6 downto 0), 
        Y    => ANGLE_REG(6 downto 0), 
        DIFF => ANGLE_360_MINUS_REG     -- Calculates 360° - angle
    );

    -- Stage 2: Angle adjustment based on quadrant
    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_ADJUSTED <= (others => '0');
            SINE_NEG <= '0';
        elsif rising_edge(CLK) then
            case QUADRANT is
                when "00" =>   -- First quadrant: use angle as is
                    ANGLE_ADJUSTED <= ANGLE_REG(6 downto 0);
                    SINE_NEG <= '0';
                when "01" =>   -- Second quadrant: use 180° - angle
                    ANGLE_ADJUSTED <= ANGLE_180_MINUS_REG;
                    SINE_NEG <= '0';
                when "10" =>   -- Third quadrant: use angle - 180°
                    ANGLE_ADJUSTED <= ANGLE_REG_MINUS_180;
                    SINE_NEG <= '1';
                when others => -- Fourth quadrant: use 360° - angle
                    ANGLE_ADJUSTED <= ANGLE_360_MINUS_REG;
                    SINE_NEG <= '1';
            end case;
        end if;
    end process;

    -- Lookup table for sine values
    LUT_INST: LUT
        generic map (N => N)
        port map (
            ANGLE => ANGLE_ADJUSTED,
            SINE  => SINE_TEMP
        );

    -- Two's complement calculation for negative values
    SINE_NEG_TEMP <= not SINE_TEMP;    -- Invert bits
    
    -- Add 1 to complete two's complement
    RCA_INST: RCA
        generic map (N => N)
        port map (
            A    => SINE_NEG_TEMP,
            B    => ONE_N,
            CIN  => '0',
            SUM  => RCA_RESULT,
            COUT => open
        );

    -- Stage 3: Final output registration
    process(CLK, RESET)
    begin
        if RESET = '1' then
            SINE_FINAL <= (others => '0');
        elsif rising_edge(CLK) then
            if SINE_NEG = '0' then
                SINE_FINAL <= SINE_TEMP;     -- Positive sine value
            else
                SINE_FINAL <= RCA_RESULT;    -- Negative sine value
            end if;
        end if;
    end process;

    -- Output assignment
    SINE <= SINE_FINAL;

end structural;