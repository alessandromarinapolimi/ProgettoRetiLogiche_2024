library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SINE is
end TB_SINE;

architecture TB of TB_SINE is
    -- Component declaration for the unit under test (UUT)
    component SINE_CALCULATOR
        generic (
            N : positive := 10;
            M : positive := 9
        );
        Port (
            CLK   : in  std_logic;
            RESET : in  std_logic;
            ANGLE : in  std_logic_vector(M-1 downto 0);
            SINE  : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- Constants and signals
    constant N : positive := 10;
    constant M : positive := 9;
    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '1';
    signal ANGLE : std_logic_vector(M-1 downto 0);
    signal SINE  : std_logic_vector(N-1 downto 0);

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

    -- Test angle array
    type angle_array is array (natural range <>) of std_logic_vector(6 downto 0);
    constant TEST_ANGLES : angle_array := (
        "0000000", -- 0
        "0000001", -- 1
        "0000010", -- 2
        "0001000", -- 8
        "0001100", -- 12
        "0010000", -- 16
        "0010001", -- 17
        "0010111", -- 23
        "0011000", -- 24
        "0011101", -- 29
        "0100000", -- 32
        "0101000", -- 40
        "0101111", -- 47
        "0110000", -- 48
        "0110011", -- 51
        "0111000", -- 56
        "1000000", -- 64
        "1000101", -- 69
        "1001000", -- 72
        "1001001", -- 73
        "1001111", -- 79
        "1010000", -- 80
        "1010001", -- 81
        "1010010", -- 82
        "1010011", -- 83
        "1010100", -- 84
        "1010101", -- 85
        "1010110", -- 86
        "1010111", -- 87
        "1011000", -- 88
        "1011001", -- 89
        "1011010"  -- 90
    );

    -- Total number of angles in the array
    constant NUM_ANGLES : integer := TEST_ANGLES'length;

    -- Signal for the test process
    signal test_done : boolean := false;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: SINE_CALCULATOR
        generic map (
            N => N,
            M => M
        )
        port map (
            CLK   => CLK,
            RESET => RESET,
            ANGLE => ANGLE,
            SINE  => SINE
        );

    -- Clock process
    CLK_process : process
    begin
        while not test_done loop
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
        variable angle_extended : std_logic_vector(M-1 downto 0);
    begin
        -- Wait 100 ns for global reset to finish
        wait for 100 ns;
        RESET <= '0';
        wait for CLK_PERIOD;
        
        -- Loop through all angles in the array
        for i in 0 to NUM_ANGLES-1 loop
            -- Test 1st quadrant angles (0 to 90)
            angle_extended := "00" & TEST_ANGLES(i);
            ANGLE <= angle_extended;
            wait for CLK_PERIOD * 5;
            
            -- Test 2nd quadrant angles (90 to 180)
            angle_extended := "01" & TEST_ANGLES(NUM_ANGLES - 1 - i);
            ANGLE <= angle_extended;
            wait for CLK_PERIOD * 5;
            
            -- Test 3rd quadrant angles (180 to 270)
            angle_extended := "10" & TEST_ANGLES(i);
            ANGLE <= angle_extended;
            wait for CLK_PERIOD * 5;
            
            -- Test 4th quadrant angles (270 to 360)
            angle_extended := "11" & TEST_ANGLES(NUM_ANGLES - 1 - i);
            ANGLE <= angle_extended;
            wait for CLK_PERIOD * 5;
        end loop;

        -- End simulation
        test_done <= true;
        wait;
    end process;

end TB;