library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SINE is
    generic (
        N : positive := 10;  -- Number of bits for sine values
        M : positive := 9    -- Number of bits for the angle input
    );
    Port (
        CLK          : in  std_logic;
        ANGLE        : in  std_logic_vector(M-1 downto 0);
        SINE         : out std_logic_vector(N-1 downto 0)
    );
end SINE;

architecture structural of SINE is
    component LUT is
        generic (N : positive);
        Port (
            ANGLE     : in  std_logic_vector(6 downto 0);
            SINE     : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X         : in  std_logic_vector(N-1 downto 0);
            Y         : in  std_logic_vector(N-1 downto 0);
            DIFF      : out std_logic_vector(N-1 downto 0)
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
    constant ANGLE_90    : std_logic_vector(M-1 downto 0)  := "001011010";
    constant ANGLE_180   : std_logic_vector(M-1 downto 0)  := "010110100";
    constant ANGLE_270   : std_logic_vector(M-1 downto 0)  := "100001110";
    constant ANGLE_360   : std_logic_vector(M-1 downto 0)  := "101101000";
    constant ONE_N       : std_logic_vector(N-1 downto 0)  := (0 => '1', others => '0');

    -- Pipeline registers
    signal ANGLE_REG         : std_logic_vector(M-1 downto 0);
    signal QUADRANT          : std_logic_vector(1 downto 0);
    signal ANGLE_ADJUSTED    : std_logic_vector(6 downto 0);
    signal SINE_TEMP         : std_logic_vector(N-1 downto 0);
    signal SINE_NEG          : std_logic;
    signal SINE_FINAL        : std_logic_vector(N-1 downto 0);
    
    -- Intermediate signals for the two's complement
    signal SINE_NEG_TEMP     : std_logic_vector(N-1 downto 0);
    signal RCA_RESULT        : std_logic_vector(N-1 downto 0);
    
    signal ANGLE_180_MINUS_REG : std_logic_vector(6 downto 0);
    signal ANGLE_REG_MINUS_180 : std_logic_vector(6 downto 0);
    signal ANGLE_360_MINUS_REG : std_logic_vector(6 downto 0);

begin
    -- Stage 1: Register input and determine QUADRANT
    process(CLK)
    begin
        if rising_edge(CLK) then
            ANGLE_REG <= ANGLE;
            
            if ANGLE_REG < ANGLE_90 then
                QUADRANT <= "00";
            elsif ANGLE_REG < ANGLE_180 then
                QUADRANT <= "01";
            elsif ANGLE_REG < ANGLE_270 then
                QUADRANT <= "10";
            else
                QUADRANT <= "11";
            end if;
        end if;
    end process;

    SUB_180_MINUS_REG: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE_180(6 downto 0),
        Y    => ANGLE_REG(6 downto 0),
        DIFF => ANGLE_180_MINUS_REG
    );

    SUB_REG_MINUS_180: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE_REG(6 downto 0),
        Y    => ANGLE_180(6 downto 0),
        DIFF => ANGLE_REG_MINUS_180
    );

    SUB_360_MINUS_REG: SUB
    generic map (N => 7)
    port map (
        X    => ANGLE_360(6 downto 0),
        Y    => ANGLE_REG(6 downto 0),
        DIFF => ANGLE_360_MINUS_REG
    );

    -- Stage 2: Adjusted angle calculation
    process(CLK)
    begin
        if rising_edge(CLK) then
            case QUADRANT is
                when "00" =>   -- First quadrant
                    ANGLE_ADJUSTED <= ANGLE_REG(6 downto 0);
                    SINE_NEG <= '0';
                when "01" =>   -- Second quadrant
                    ANGLE_ADJUSTED <= ANGLE_180_MINUS_REG;
                    SINE_NEG <= '0';
                when "10" =>   -- Third quadrant
                    ANGLE_ADJUSTED <= ANGLE_REG_MINUS_180;
                    SINE_NEG <= '1';
                when others => -- Fourth quadrant
                    ANGLE_ADJUSTED <= ANGLE_360_MINUS_REG;
                    SINE_NEG <= '1';
            end case;
        end if;
    end process;

    LUT_INST: LUT
        generic map (N => N)
        port map (
            ANGLE => ANGLE_ADJUSTED,
            SINE  => SINE_TEMP
        );

    -- Two's complement calculation (combinational)
    SINE_NEG_TEMP <= not SINE_TEMP;
    
    RCA_INST: RCA
        generic map (N => N)
        port map (
            A    => SINE_NEG_TEMP,
            B    => ONE_N,
            CIN  => '0',
            SUM  => RCA_RESULT,
            COUT => open
        );

    -- Stage 3: Final output register
    process(CLK)
    begin
        if rising_edge(CLK) then
            if SINE_NEG = '0' then
                SINE_FINAL <= SINE_TEMP;
            else
                SINE_FINAL <= RCA_RESULT;
            end if;
        end if;
    end process;

    -- Output assignment
    SINE <= SINE_FINAL;

end structural;