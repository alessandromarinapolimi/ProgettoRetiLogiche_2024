library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SINE_CALCULATOR is
    generic (
        N : positive := 10;  -- Number of bits for sine values
        M : positive := 9    -- Number of bits for the angle input
    );
    Port (
        CLK          : in  std_logic;
        RESET      : in  std_logic;
        ANGLE     : in  std_logic_vector(M-1 downto 0);
        SINE         : out std_logic_vector(N-1 downto 0)
    );
end SINE_CALCULATOR;

architecture structural of SINE_CALCULATOR is
    component LUT is
        generic (N : positive);
        Port (
            ANGLE     : in  std_logic_vector(6 downto 0);
            SINE         : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X          : in  std_logic_vector(N-1 downto 0);
            Y          : in  std_logic_vector(N-1 downto 0);
            DIFF    : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component RCA is
        generic (N : positive);
        Port (
            A, B        : in  std_logic_vector(N-1 downto 0);
            CIN         : in  std_logic;
            SUM       : out std_logic_vector(N-1 downto 0);
            COUT     : out std_logic
        );
    end component;

    -- Constants
    constant ANGLE_90         : std_logic_vector(M-1 downto 0)  := "001011010";
    constant ANGLE_180       : std_logic_vector(M-1 downto 0) := "010110100";
    constant ANGLE_270       : std_logic_vector(M-1 downto 0) := "100001110";
    constant ANGLE_360       : std_logic_vector(M-1 downto 0) := "101101000";
    constant ONE_N              : std_logic_vector(N-1 downto 0) := (0 => '1', others => '0');

    -- Pipeline registers
    signal ANGLE_REG                 : std_logic_vector(M-1 downto 0);
    signal QUADRANT                 : std_logic_vector(1 downto 0);
    signal ANGLE_ADJUSTED      : std_logic_vector(6 downto 0);
    signal SINE_TEMP                  : std_logic_vector(N-1 downto 0);
    signal SINE_NEG                    : std_logic;
    signal SINE_FINAL                 : std_logic_vector(N-1 downto 0);
    
    -- Intermediate signals
    signal SUB_RESULT1, SUB_RESULT2, SUB_RESULT3        : std_logic_vector(8 downto 0);
    signal SINE_NEG_TEMP                                                       : std_logic_vector(N-1 downto 0);
    signal RCA_RESULT                                                              : std_logic_vector(N-1 downto 0);

begin
    -- Pipeline Stage 1: Register input and determine QUADRANT
    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_REG <= (others => '0');
            QUADRANT <= "00";
        elsif rising_edge(CLK) then
            ANGLE_REG <= ANGLE;
            
            -- Determine QUADRANT using simple comparisons
            if ANGLE_REG < ANGLE_90 then
                QUADRANT <= "00";    -- First QUADRANT
            elsif ANGLE_REG < ANGLE_180 then
                QUADRANT <= "01";  -- Second QUADRANT
            elsif ANGLE_REG < ANGLE_270 then
                QUADRANT <= "10";  -- Third QUADRANT
            else
                QUADRANT <= "11";  -- Fourth QUADRANT
            end if;
            
        end if;
    end process;

    -- Subtractors for angle adjustment
    SUB_INST1: SUB
    generic map (N => M)
    port map (
        X    => ANGLE_180,
        Y    => ANGLE_REG,
        DIFF => SUB_RESULT1
    );

    SUB_INST2: SUB
    generic map (N => M)
    port map (
        X    => ANGLE_REG,
        Y    => ANGLE_180,
        DIFF => SUB_RESULT2
    );

    SUB_INST3: SUB
    generic map (N => M)
    port map (
        X    => ANGLE_360,
        Y    => ANGLE_REG,
        DIFF => SUB_RESULT3
    );

    -- Pipeline Stage 2: Register angle adjustment and sine negation
    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_ADJUSTED <= (others => '0');
            SINE_NEG <= '0';
        elsif rising_edge(CLK) then
            case QUADRANT is
                when "00" =>   -- First QUADRANT
                    ANGLE_ADJUSTED <= ANGLE_REG(6 downto 0);
                    SINE_NEG <= '0';
                when "01" =>  -- Second QUADRANT
                    ANGLE_ADJUSTED <= SUB_RESULT1(6 downto 0);
                    SINE_NEG <= '0';
                when "10" =>  -- Third QUADRANT
                    ANGLE_ADJUSTED <= SUB_RESULT2(6 downto 0);
                    SINE_NEG <= '1';
                when others => -- Fourth QUADRANT
                    ANGLE_ADJUSTED <= SUB_RESULT3(6 downto 0);
                    SINE_NEG <= '1';
            end case;
        end if;
    end process;

    -- Lookup table
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

    -- Pipeline Stage 3: Register final result
    process(CLK, RESET)
    begin
        if RESET = '1' then
            SINE_FINAL <= (others => '0');
        elsif rising_edge(CLK) then
            if SINE_NEG = '0' then
                SINE_FINAL <= SINE_TEMP;
            else
                SINE_FINAL <= RCA_RESULT;
            end if;
        end if;
    end process;

    -- Output 
    SINE <= SINE_FINAL;

end structural;