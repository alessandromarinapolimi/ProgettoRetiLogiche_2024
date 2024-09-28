library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SINE_CALCULATOR is
    generic (
        N : positive := 10;  -- Number of bits for sine values
        M : positive := 9    -- Number of bits for input angle
    );
    Port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        ANGLE : in  std_logic_vector(M-1 downto 0);
        SINE  : out std_logic_vector(N-1 downto 0)
    );
end SINE_CALCULATOR;

architecture structural of SINE_CALCULATOR is
    component LUT is
        generic (N : positive);
        Port (
            ANGLE : in  std_logic_vector(6 downto 0);
            SINE  : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component RCA is
        generic (N : positive);
        Port (
            A, B : in  std_logic_vector(N-1 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(N-1 downto 0);
            COUT : out std_logic
        );
    end component;

    component SUB is
        generic (N : positive);
        Port (
            X, Y : in  std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- Constants
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := (M-1 => '1', others => '0');  -- 360 degrees
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := (M-2 => '1', others => '0');  -- 180 degrees
    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := (M-3 => '1', others => '0');  -- 90 degrees

    -- Signals
    signal ANGLE_ADJUSTED : std_logic_vector(M-1 downto 0);
    signal ANGLE_FINAL : std_logic_vector(6 downto 0);
    signal SINE_TEMP : std_logic_vector(N-1 downto 0);
    signal SINE_NEG : std_logic_vector(N-1 downto 0);
    signal NEG_FLAG : std_logic;

    -- Intermediate signals for angle adjustment
    signal ANGLE_MINUS_360, ANGLE_MINUS_180 : std_logic_vector(M-1 downto 0);
    signal ANGLE_180_MINUS, ANGLE_90_MINUS : std_logic_vector(M-1 downto 0);

    -- Function to compare two std_logic_vector
    function GREATER_THAN(A, B: std_logic_vector) return boolean is
    begin
        for I in A'high downto A'low loop
            if A(I) = '1' and B(I) = '0' then
                return true;
            elsif A(I) = '0' and B(I) = '1' then
                return false;
            end if;
        end loop;
        return false;
    end function;

begin
    -- Subtractors for angle adjustment
    SUB_360: SUB
    generic map (N => M)
    port map (X => ANGLE, Y => ANGLE_360, DIFF => ANGLE_MINUS_360);

    SUB_180: SUB
    generic map (N => M)
    port map (X => ANGLE_360, Y => ANGLE_ADJUSTED, DIFF => ANGLE_180_MINUS);

    SUB_FROM_180: SUB
    generic map (N => M)
    port map (X => ANGLE_180, Y => ANGLE_ADJUSTED, DIFF => ANGLE_90_MINUS);

    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_ADJUSTED <= (others => '0');
            NEG_FLAG <= '0';
        elsif rising_edge(CLK) then
            -- Step 1: Normalize angle to 0-359 range
            if GREATER_THAN(ANGLE, ANGLE_360) then
                ANGLE_ADJUSTED <= ANGLE_MINUS_360;
            else
                ANGLE_ADJUSTED <= ANGLE;
            end if;

            -- Step 2: Handle negative flag and mirror for 180-359
            if GREATER_THAN(ANGLE_ADJUSTED, ANGLE_180) then
                ANGLE_ADJUSTED <= ANGLE_180_MINUS;
                NEG_FLAG <= '1';
            else
                NEG_FLAG <= '0';
            end if;

            -- Step 3: Mirror for 90-179
            if GREATER_THAN(ANGLE_ADJUSTED, ANGLE_90) then
                ANGLE_ADJUSTED <= ANGLE_90_MINUS;
            end if;
        end if;
    end process;

    -- Use only the 7 least significant bits for the LUT
    ANGLE_FINAL <= ANGLE_ADJUSTED(6 downto 0);

    -- LUT instance
    LUT_INST: LUT
    generic map (N => N)
    port map (
        ANGLE => ANGLE_FINAL,
        SINE => SINE_TEMP
    );

    -- Negate sine if necessary (two's complement)
    NEG_SINE: SUB
    generic map (N => N)
    port map (
        X => (others => '0'),
        Y => SINE_TEMP,
        DIFF => SINE_NEG
    );

    -- Multiplexer for selecting between positive and negative sine
    SINE <= SINE_NEG when NEG_FLAG = '1' else SINE_TEMP;

end structural;
