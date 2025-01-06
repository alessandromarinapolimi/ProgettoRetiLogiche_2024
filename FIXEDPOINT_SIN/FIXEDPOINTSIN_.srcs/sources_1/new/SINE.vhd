library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SINE is
    generic (
        N : positive := 10;  -- Number of bits for sine values
        M : positive := 9    -- Number of bits for the angle input
    );
    Port (
        CLK          : in  std_logic;
        ANGLE        : in  std_logic_vector(M-1 downto 0);
        SINE         : out std_logic_vector(N-1 downto 0) := "0000000000"
    );
end SINE;

architecture structural of SINE is
    component LUT is
        generic (N : positive);
        Port (
            ANGLE     : in  std_logic_vector(M-3 downto 0);
            SINE      : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y         : in  std_logic_vector(N-1 downto 0); 
            DIFF         : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component RCA is
        generic (N : positive);
        Port (
            A, B      : in  std_logic_vector(N-1 downto 0);
            CIN       : in  std_logic;
            SUM       : out std_logic_vector(N-1 downto 0);
            COUT      : out std_logic
        );
    end component;

    -- Constants 
    constant ANGLE_180   : std_logic_vector(M-1 downto 0)  := "010110100";  

    -- Signals for angle processing
    signal ANGLE_ADJUSTED, SUB_180_ANGLE, SUB_ANGLE_180, SUB_360_ANGLE : std_logic_vector(M-3 downto 0); 
    signal SINE_TEMP, SINE_NEG_TEMP, SINE_NEG                          : std_logic_vector(N-1 downto 0);
    signal NEG_FLAG                                                    : std_logic;

    -- Function for comparing vectors
    function GREATER_THAN(A, B: std_logic_vector) return boolean is
    begin
        for I in A'range loop
            if A(I) = '1' and B(I) = '0' then
                return true;
            elsif A(I) = '0' and B(I) = '1' then
                return false;
            end if;
        end loop;
        return false;
    end function;

begin  
    -- Subtractors for angle adjustments
    SUB180ANGLE: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE_180(6 downto 0),
        Y    => ANGLE(6 downto 0),
        DIFF => SUB_180_ANGLE
    );

    SUBANGLE180: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE(6 downto 0),
        Y    => ANGLE_180(6 downto 0),
        DIFF => SUB_ANGLE_180
    );

    SUB360ANGLE: SUB
    generic map (N => 7)
    port map (
        X    => "1101000",
        Y    => ANGLE(6 downto 0),
        DIFF => SUB_360_ANGLE
    );

    -- LUT instance for sine value lookup
    LUT_INST: LUT
    generic map (N => N)
    port map (
        ANGLE => ANGLE_ADJUSTED,
        SINE  => SINE_TEMP
    );

    -- Two's complement calculation for negative values
    SINE_NEG_TEMP <= not SINE_TEMP;
    
    RCA_INST: RCA
    generic map (N => N)
    port map (
        A    => SINE_NEG_TEMP,
        B    => (0 => '1', others => '0'),
        CIN  => '0',
        SUM  => SINE_NEG,
        COUT => open
    );

    process(CLK)
    begin
        if rising_edge(CLK) then
                if not GREATER_THAN(ANGLE, "001011010") then           -- First quadrant: 0-90 degrees 
                    ANGLE_ADJUSTED <= ANGLE(6 downto 0);
                    NEG_FLAG <= '0';
                elsif not GREATER_THAN(ANGLE, ANGLE_180) then          -- Second quadrant: 90-180 degrees
                    ANGLE_ADJUSTED <= SUB_180_ANGLE;
                    NEG_FLAG <= '0';
                elsif not GREATER_THAN(ANGLE, "100001110") then        -- Third quadrant: 180-270 degrees 
                    ANGLE_ADJUSTED <= SUB_ANGLE_180;
                    NEG_FLAG <= '1';
                else                                                   -- Fourth quadrant: 270-360 degrees 
                    ANGLE_ADJUSTED <= SUB_360_ANGLE;
                    NEG_FLAG <= '1';
                end if;
            end if;
    end process;
    
    process(CLK)
    begin
        if falling_edge(CLK) then
            if NEG_FLAG = '0' then
                SINE <= SINE_TEMP;
            else
                SINE <= SINE_NEG;
            end if;
        end if;
    end process;

end structural;
