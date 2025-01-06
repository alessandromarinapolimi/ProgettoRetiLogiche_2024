library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------
-- Testbench for SINE Module
--------------------------------------
entity TB_SINE is
end entity TB_SINE;

architecture Behavioral of TB_SINE is
    --------
    -- Component declaration for Device Under Test (DUT)
    --------
    component SINE
        generic (
            M : positive := 9;                                                     -- Number of bits for angle input
            N : positive := 10                                                     -- Number of bits for sine output
        );
        Port (
            CLK   : in  std_logic;                                                -- System clock
            ANGLE : in  std_logic_vector(M-1 downto 0);                          -- Input angle
            SINE  : out std_logic_vector(N-1 downto 0)                           -- Output sine value
        );
    end component;
    
    --------
    -- Test signals
    --------
    signal CLK     : std_logic := '0';                                           -- Clock signal
    signal ANGLE   : std_logic_vector(8 downto 0) := (others => '0');           -- Input angle signal
    signal SINE_V  : std_logic_vector(9 downto 0);                              -- Output sine value
    constant CLK_period : time := 3 ns;                                         -- Clock period definition
    
    --------
    -- Test vector definition
    --------
    type angle_array is array (natural range <>) of std_logic_vector(8 downto 0);
    constant TEST_ANGLES : angle_array := (
        "000000000",  --     (0)
        "000000001",  --    (1)
        "000000010",  --    (2)
        "000001000",  --   (8)
        "000001100",  --   (12)
        "000010000",  --  (16)
        "000010001",  --    (17)
        "000010111",  --  (23)
        "000011000",  --  (24)
        "000011101",  --  (29)
        "000100000",  --   (32)
        "000101000",  --   (40)
        "000101111",  --   (47)
        "000110000",  --   (48)
        "000110011",  --   (51)
        "100001101",  --  (269)
        "011111110",  --  (254)
        "001000101",  --   (69)
        "001001000",  --   (72)
        "001001001",  --   (73)
        "001001111",  --   (79)
        "001010000",  --   (80)
        "001010001",  --   (81)
        "001010010",  --   (82)
        "001010011",  --   (83)
        "001010110",  --   (86)
        "001010101",  --     (85)
        "001011111",  --   (95)
        "100100010",  --  (290)
        "100111011",  --  (315)
        "010110011",  --    (179)
        "101100111"   --  (359)
    );

begin
    --------
    -- Device Under Test (DUT) instantiation
    --------
    uut: SINE
        generic map (
            N => 10,                                                             -- 10-bit sine output
            M => 9                                                              -- 9-bit angle input
        )
        port map (
            CLK   => CLK,
            ANGLE => ANGLE,
            SINE  => SINE_V
        );

    --------
    -- Clock generation process
    --------
    CLK_process : process
    begin
        CLK <= '0';
        wait for CLK_period/10;
        CLK <= '1';
        wait for CLK_period/10;
    end process;

    --------
    -- Stimulus process
    --------
    stim_proc: process
    begin
        wait for CLK_period;                                                    -- Initial stabilization period
        
        for i in TEST_ANGLES'range loop
            ANGLE <= TEST_ANGLES(i);
            wait for CLK_period * 10;                                          -- Allow time for sine computation
        end loop;
        
        wait;                                                                  -- End simulation
    end process;
    
end architecture Behavioral;