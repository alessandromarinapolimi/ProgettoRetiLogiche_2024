library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_LUT is
end TB_LUT;

architecture Behavioral of TB_LUT is
    constant N : positive := 10;
    
    component LUT is
        generic (
            N : positive := 10
        );
        Port (
            ANGLE : in std_logic_vector(6 downto 0);
            SINE  : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal ANGLE : std_logic_vector(6 downto 0);
    signal SINE  : std_logic_vector(N-1 downto 0);
    
    type angle_array is array (natural range <>) of std_logic_vector(6 downto 0);
    constant test_angles : angle_array := (
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

begin
    UUT: LUT
    generic map (N => N)
    port map (
        ANGLE => ANGLE,
        SINE  => SINE
    );

    stim_proc: process
    begin
        for i in test_angles'range loop
            ANGLE <= test_angles(i);
            wait for 10 ns;
           
        end loop;
        
        std.env.stop;
    end process;

end Behavioral;