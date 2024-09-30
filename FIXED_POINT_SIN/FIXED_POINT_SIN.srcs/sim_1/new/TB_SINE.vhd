library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_SINE is
end TB_SINE;

architecture Behavioral of TB_SINE is
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

    signal CLK   : std_logic := '0';
    signal RESET : std_logic := '0';
    signal ANGLE : std_logic_vector(8 downto 0) := (others => '0');
    signal SINE  : std_logic_vector(9 downto 0);

    constant CLK_period : time := 3 ns;

    type angle_array is array (natural range <>) of std_logic_vector(8 downto 0);
    constant TEST_ANGLES : angle_array := (
        "000000000", -- 0
        "000000001", -- 1
        "000000010", -- 2
        "000001000", -- 8
        "000001100", -- 12
        "000010000", -- 16
        "000010001", -- 17
        "000010111", -- 23
        "000011000", -- 24
        "000011101", -- 29
        "000100000", -- 32
        "000101000", -- 40
        "000101111", -- 47
        "000110000", -- 48
        "000110011", -- 51
        "000111000", -- 56
        "011111110", -- 
        "001000101", -- 69
        "001001000", -- 72
        "001001001", -- 73
        "001001111", -- 79
        "001010000", -- 80
        "001010001", -- 81
        "001010010", -- 82
        "001010011", -- 83
        "100111110", -- 318 gradi
        "001010110", -- 86
        "100010101",
        "100100010",
        "100111011",
        "101011001",
        "101100111"
    );

begin
    uut: SINE_CALCULATOR
        generic map (
            N => 10,
            M => 9
        )
        port map (
            CLK => CLK,
            RESET => RESET,
            ANGLE => ANGLE,
            SINE => SINE
        );

    CLK_process : process
    begin
        CLK <= '0';
        wait for CLK_period/10;
        CLK <= '1';
        wait for CLK_period/10;
    end process;

    stim_proc: process
    begin
        RESET <= '1';
        wait for CLK_period * 5;
        RESET <= '0';
        wait for CLK_period * 5;

        for i in TEST_ANGLES'range loop
            ANGLE <= TEST_ANGLES(i);
            wait for CLK_period * 10;  -- Tempo aumentato per ogni angolo
        end loop;

        wait;
    end process;

end Behavioral;
