library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SINE_CALCULATOR is
    generic (
        N : positive := 10;  -- Number of bits for sine values
        M : positive := 9    -- Number of bits for input angle
    );
    Port (
        clk   : in  std_logic;
        reset : in  std_logic;
        angle : in  std_logic_vector(M-1 downto 0);
        sine  : out std_logic_vector(N-1 downto 0)
    );
end SINE_CALCULATOR;

architecture Structural of SINE_CALCULATOR is
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

    signal angle_adjusted : std_logic_vector(M-1 downto 0);
    signal angle_final : std_logic_vector(6 downto 0);
    signal sine_temp : std_logic_vector(N-1 downto 0);
    signal sine_neg : std_logic_vector(N-1 downto 0);
    signal neg_flag : std_logic;

    -- Constants
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := (M-1 => '1', others => '0');  -- 360 degrees
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := (M-2 => '1', others => '0');  -- 180 degrees
    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := (M-3 => '1', others => '0');  -- 90 degrees

    -- Signals for angle adjustment
    signal angle_plus_360 : std_logic_vector(M-1 downto 0);
    signal angle_minus_360 : std_logic_vector(M-1 downto 0);
    signal angle_minus_180 : std_logic_vector(M-1 downto 0);
    signal angle_90_minus : std_logic_vector(M-1 downto 0);

begin
    -- Angle adjustment logic
    ADD_360: RCA
    generic map (N => M)
    port map (
        A => angle,
        B => ANGLE_360,
        CIN => '0',
        SUM => angle_plus_360,
        COUT => open
    );

    SUB_360: SUB
    generic map (N => M)
    port map (
        X => angle,
        Y => ANGLE_360,
        DIFF => angle_minus_360
    );

    SUB_180: SUB
    generic map (N => M)
    port map (
        X => angle,
        Y => ANGLE_180,
        DIFF => angle_minus_180
    );

    SUB_FROM_90: SUB
    generic map (N => M)
    port map (
        X => ANGLE_90,
        Y => angle,
        DIFF => angle_90_minus
    );

    process(clk, reset)
    begin
        if reset = '1' then
            angle_adjusted <= (others => '0');
            neg_flag <= '0';
        elsif rising_edge(clk) then
            if angle(M-1) = '1' then
                angle_adjusted <= angle_plus_360;
            elsif angle >= ANGLE_360 then
                angle_adjusted <= angle_minus_360;
            else
                angle_adjusted <= angle;
            end if;

            if angle_adjusted >= ANGLE_180 then
                angle_adjusted <= angle_minus_180;
                neg_flag <= '1';
            else
                neg_flag <= '0';
            end if;

            if angle_adjusted > ANGLE_90 then
                angle_adjusted <= angle_90_minus;
            end if;
        end if;
    end process;

    -- Use only the 7 least significant bits for the LUT
    angle_final <= angle_adjusted(6 downto 0);

    -- LUT instance
    LUT_INST: LUT
    generic map (N => N)
    port map (
        ANGLE => angle_final,
        SINE => sine_temp
    );

    -- Negate sine if necessary
    NEG_SINE: SUB
    generic map (N => N)
    port map (
        X => (others => '0'),
        Y => sine_temp,
        DIFF => sine_neg
    );

    -- Multiplexer for selecting between positive and negative sine
    process(sine_temp, sine_neg, neg_flag)
    begin
        if neg_flag = '1' then
            sine <= sine_neg;
        else
            sine <= sine_temp;
        end if;
    end process;

end Structural;
