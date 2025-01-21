library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_INTERP is
end TB_INTERP;

architecture Behavioral of TB_INTERP is
    -- Define constant for sine precision
    constant N : integer := 10;

    -- Component declaration for the INTERP module
    component INTERP is
        generic (N : positive);
        Port (
            ANGLE_DIFF : in  std_logic_vector(2 downto 0);  -- Angle difference input
            SINE1      : in  std_logic_vector(N-1 downto 0); -- Sine of the smaller angle
            SINE2      : in  std_logic_vector(N-1 downto 0); -- Sine of the larger angle
            RESULT     : out std_logic_vector(N-1 downto 0)  -- Interpolated result
        );
    end component;

    -- Signals for connecting to the INTERP component
    signal ANGLE_DIFF : std_logic_vector(2 downto 0);
    signal SINE1, SINE2, RESULT : std_logic_vector(N-1 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: INTERP
        generic map (N => N)
        port map (
            ANGLE_DIFF => ANGLE_DIFF,
            SINE1      => SINE1,
            SINE2      => SINE2,
            RESULT     => RESULT
        );

    -- Stimulus process to provide test cases
    stim_proc: process
    begin
        -- Test case 1: 0 degrees
        ANGLE_DIFF <= "000";  -- Angle difference = 0
        SINE1      <= "0000000000";  -- sin(0°)
        SINE2      <= "0000100011";  -- Approximation for sin(1°)
        wait for 10 ns;

        -- Test case 2: 1 degree
        ANGLE_DIFF <= "001";  -- Angle difference = 1
        SINE1      <= "0000000000";  -- sin(0°)
        SINE2      <= "0000100011";  -- sin(1°)
        wait for 10 ns;

        -- Test case 3: 2 degrees
        ANGLE_DIFF <= "010";  -- Angle difference = 2
        SINE1      <= "0000000000";  -- sin(0°)
        SINE2      <= "0000100011";  -- sin(1°)
        wait for 10 ns;

        -- Test case 4: 3 degrees
        ANGLE_DIFF <= "011";  -- Angle difference = 3
        SINE1      <= "0000000000";  -- sin(0°)
        SINE2      <= "0000100011";  -- sin(1°)
        wait for 10 ns;

        -- Additional tests for various angles
        -- Testing interpolation between sin(16°) and sin(24°)
        ANGLE_DIFF <= "000";  -- Difference = 0
        SINE1      <= "0001000110";  -- sin(16°)
        SINE2      <= "0001101000";  -- sin(24°)
        wait for 10 ns;

        -- Testing interpolation for sin(16° to 24°) with different differences
        ANGLE_DIFF <= "111";  -- Difference = 7
        SINE1      <= "0001000110";  -- sin(16°)
        SINE2      <= "0001101000";  -- sin(24°)
        wait for 10 ns;

        -- Testing sin(24° to 32°)
        ANGLE_DIFF <= "101";  -- Difference = 5
        SINE1      <= "0001101000";  -- sin(24°)
        SINE2      <= "0010000111";  -- sin(32°)
        wait for 10 ns;

        -- Example for larger angles: sin(72° to 80°)
        ANGLE_DIFF <= "001";  -- Difference = 1
        SINE1      <= "0011110011";  -- sin(72°)
        SINE2      <= "0011111100";  -- sin(80°)
        wait for 10 ns;

        -- Test case for close angles, testing precision
        ANGLE_DIFF <= "111";  -- Difference = 7
        SINE1      <= "0011111100";  -- sin(80°)
        SINE2      <= "0011111111";  -- sin(88°)
        wait for 10 ns;

        -- Testing for different intermediate angles between sin(80° to 88°)
        for i in 0 to 7 loop
            ANGLE_DIFF <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        -- End the simulation
        std.env.stop;
    end process;

end Behavioral;
