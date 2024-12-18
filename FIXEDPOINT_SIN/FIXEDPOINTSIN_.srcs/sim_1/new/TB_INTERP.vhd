library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_INTERP is
end TB_INTERP;

architecture Behavioral of TB_INTERP is
    constant N : integer := 10;
    
    component INTERP is
        generic (N : positive);
        Port ( 
            ANGLE_DIFF : in std_logic_vector(2 downto 0);  -- Differenza tra angolo in ingresso e l'angolo più piccolo
            SINE1 : in std_logic_vector(N-1 downto 0);         -- Seno dell'angolo più piccolo
            SINE2 : in std_logic_vector(N-1 downto 0);         -- Seno dell'angolo più grande
            RESULT : out std_logic_vector(N-1 downto 0)     -- Risultato interpolato
        );
    end component;
    
    signal ANGLE_DIFF : std_logic_vector(2 downto 0);
    signal SINE1, SINE2, RESULT : std_logic_vector(N-1 downto 0);

begin
    UUT: INTERP
        generic map (N => N)
        port map (
            ANGLE_DIFF => ANGLE_DIFF,
            SINE1 => SINE1,
            SINE2 => SINE2,
            RESULT => RESULT
        );
        
    stim_proc: process
    begin
    
      -- Test per 0 gradi
ANGLE_DIFF <= "000";  -- Differenza di 0 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011"; 
wait for 10 ns;

-- Test per 1 grado
ANGLE_DIFF <= "001";  -- Differenza di 1 grado
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 2 gradi
ANGLE_DIFF <= "010";  -- Differenza di 2 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 3 gradi
ANGLE_DIFF <= "011";  -- Differenza di 3 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 4 gradi
ANGLE_DIFF <= "100";  -- Differenza di 4 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 5 gradi
ANGLE_DIFF <= "101";  -- Differenza di 5 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 6 gradi
ANGLE_DIFF <= "110";  -- Differenza di 6 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;

-- Test per 7 gradi
ANGLE_DIFF <= "111";  -- Differenza di 7 gradi
SINE1 <= "0000000000";  -- sin(0)
SINE2 <= "0000100011";  -- sin(1)
wait for 10 ns;




        
        -- Test per 17 gradi
        ANGLE_DIFF <= "001";  -- Differenza di 1 grado
        SINE1 <= "0001000110";  -- sin(16) 
        SINE2 <= "0001101000";  -- sin(24)
        wait for 10 ns;
    
         -- Test per 23 gradi
        ANGLE_DIFF <= "111";  -- Differenza di 7 gradi
        SINE1 <= "0001000110";  -- sin(16) 
        SINE2 <= "0001101000";  -- sin(24) 
        wait for 10 ns;
        
        -- Test per 29 gradi
        ANGLE_DIFF <= "101";  -- Differenza di 5 gradi
        SINE1 <= "0001101000";  -- sin(24)
        SINE2 <= "0010000111";  -- sin(32)
        wait for 10 ns;

        -- Test per 47 gradi
        ANGLE_DIFF <= "111";  -- Differenza di 7 gradi
        SINE1 <= "0010100100";  -- sin(40) 
        SINE2 <= "0010111110";  -- sin(48)
        wait for 10 ns;
        
        -- Test per 51 gradi
        ANGLE_DIFF <= "011";  -- Differenza di 3 gradi
        SINE1 <= "0010111110";  -- sin(48) 
        SINE2 <= "0011010100";  -- sin(56)
        wait for 10 ns;
        
        -- Test per 69 gradi
        ANGLE_DIFF <= "101";  -- Differenza di 5 gradi
        SINE1 <= "0011100110";  -- sin(64)
        SINE2 <= "0011110011";  -- sin72) 
        wait for 10 ns;

        -- Test per 73 gradi
        ANGLE_DIFF <= "001";  -- Differenza di 1 gradi
        SINE1 <= "0011110011";  -- sin(72) 
        SINE2 <= "0011111100";  -- sin(80)
        wait for 10 ns;
      
        -- Test per 79 gradi
        ANGLE_DIFF <= "111";  -- Differenza di 7 gradi
        SINE1 <= "0011110011";  -- sin(72) 
        SINE2 <= "0011111100";  -- sin(80)
        wait for 10 ns;
        
        
        -- Test per 80 gradi
        ANGLE_DIFF <= "000";  -- Differenza di 1 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
         -- Test per 81 gradi
        ANGLE_DIFF <= "001";  -- Differenza di 1 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 82 gradi
        ANGLE_DIFF <= "010";  -- Differenza di 2 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 83 gradi
        ANGLE_DIFF <= "011";  -- Differenza di 3 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 84 gradi
        ANGLE_DIFF <= "100";  -- Differenza di 4 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 85 gradi
        ANGLE_DIFF <= "101";  -- Differenza di 5 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 86 gradi
        ANGLE_DIFF <= "110";  -- Differenza di 6 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        
        -- Test per 87 gradi
        ANGLE_DIFF <= "111";  -- Differenza di 7 gradi
        SINE1 <= "0011111100";  -- sin(80) 
        SINE2 <= "0011111111";  -- sin(88) 
        wait for 10 ns;
        

        std.env.stop; -- Fermare la simulazione
    end process;

end Behavioral;