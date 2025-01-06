library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_LUT is
end TB_LUT;

architecture Behavioral of TB_LUT is
    -- Define constant for sine precision
    constant N : positive := 10;

    -- Component declaration for the LUT module
    component LUT is
        generic (
            N : positive := 10
        );
        Port (
            ANGLE : in  std_logic_vector(6 downto 0); -- Input angle (7-bit)
            SINE  : out std_logic_vector(N-1 downto 0) -- Output sine value (N-bit)
        );
    end component;

    -- Signals for connecting to the LUT component
    signal ANGLE : std_logic_vector(6 downto 0);
    signal SINE  : std_logic_vector(N-1 downto 0);

    -- Define an array of test angles
    type angle_array is array (natural range <>) of std_logic_vector(6 downto 0);
    constant test_angles : angle_array := (
        "0000000", -- 0 degrees
        "0000001", -- 1 degree
        "0000010", -- 2 degrees
        "0001000", -- 8 degrees
        "0001100", -- 12 degrees
        "0010000", -- 16 degrees
        "0010001", -- 17 degrees
        "0010111", -- 23 degrees
        "0011000", -- 24 degrees
        "0011101", -- 29 degrees
        "0100000", -- 32 degrees
        "0101000", -- 40 degrees
        "0101111", -- 47 degrees
        "0110000", -- 48 degrees
        "0110011", -- 51 degrees
        "0111000", -- 56 degrees
        "1000000", -- 64 degrees
        "1000101", -- 69 degrees
        "1001000", -- 72 degrees
        "1001001", -- 73 degrees
        "1001111", -- 79 degrees
        "1010000", -- 80 degrees
        "1010001", -- 81 degrees
        "1010010", -- 82 degrees
        "1010011", -- 83 degrees
        "1010100", -- 84 degrees
        "1010101", -- 85 degrees
        "1010110", -- 86 degrees
        "1010111", -- 87 degrees
        "1011000", -- 88 degrees
        "1011001", -- 89 degrees
        "1011010"  -- 90 degrees
    );

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: LUT
        generic map (N => N)
        port map (
            ANGLE => ANGLE,
            SINE  => SINE
        );

    -- Stimulus process to apply test cases
    stim_proc: process
    begin
        -- Iterate through all test angles
        for i in test_angles'range loop
            ANGLE <= test_angles(i); -- Apply the test angle to the LUT
            wait for 10 ns;          -- Wait for output to stabilize
        end loop;

        -- Stop the simulation
        std.env.stop;
    end process;

end Behavioral;
