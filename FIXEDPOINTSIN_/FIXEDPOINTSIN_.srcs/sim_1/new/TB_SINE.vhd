library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_SINE is
end entity TB_SINE;

architecture Behavioral of TB_SINE is
    component SINE_CALCULATOR
        Port (
            CLK   : in  std_logic;
            RESET : in  std_logic;
            ANGLE : in  std_logic_vector(8 downto 0);
            SINE  : out std_logic_vector(9 downto 0)
        );
    end component;
    
    signal CLK     : std_logic;
    signal RESET   : std_logic;
    signal ANGLE   : std_logic_vector(8 downto 0);
    signal SINE    : std_logic_vector(9 downto 0);
    constant CLK_PERIOD : time := 3 ns;
    
begin
    -- Unit Under Test
    uut: SINE_CALCULATOR
        port map (
            CLK   => CLK,
            RESET => RESET,
            ANGLE => ANGLE,
            SINE  => SINE
        );

    
    reset_process: process
    begin
        RESET <= '1';  -- Assert reset
        wait for CLK_period*2;
        
        RESET <= '0';  -- Deassert reset
        wait;  -- Wait forever
    end process reset_process;       
    
           --------
    -- Clock generation process
    --------
 CLK_process: process
begin
    CLK <= '1';
    wait for CLK_period/2;
    CLK <= '0';
    wait for CLK_period/2;
end process CLK_process;

 --------
    -- Stimulus process
    --------
    stim_proc: process
    begin
            
        wait for CLK_period*33;  
        
        
        -- Test all angles from 0 to 359
        for i in 0 to 359 loop
            ANGLE <= std_logic_vector(to_unsigned(i, ANGLE'length));
            wait for CLK_PERIOD;
        end loop;
        
       
        
        -- End simulation
        std.env.finish;  -- End simulation
    end process;
    
    
    end architecture Behavioral;
