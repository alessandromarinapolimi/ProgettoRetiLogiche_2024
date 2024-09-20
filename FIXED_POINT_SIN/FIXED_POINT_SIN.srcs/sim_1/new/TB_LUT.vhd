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
            SINE : out std_logic_vector(N-1 downto 0)
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
        Port(
            X, Y : in std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    signal ANGLE : std_logic_vector(6 downto 0) := (others => '0');
    signal SINE : std_logic_vector(N-1 downto 0);
    signal TEST_CASE : std_logic_vector(3 downto 0) := (others => '0');
    signal TEST_PASS : std_logic := '0';
    
    -- Funzione per confrontare due vettori con una certa tolleranza
    function compare_with_tolerance(a, b: std_logic_vector; tolerance: integer) return boolean is
        variable diff : std_logic_vector(N-1 downto 0);
        variable abs_diff : std_logic_vector(N-1 downto 0);
        variable tolerance_vec : std_logic_vector(N-1 downto 0);
    begin
        -- Calcola la differenza
        SUB_INST: SUB generic map (N => N)
                      port map (X => a, Y => b, DIFF => diff);
        
        -- Calcola il valore assoluto della differenza
        abs_diff := diff when diff(N-1) = '0' else not diff;
        
        -- Converti la tolleranza in un vettore
        tolerance_vec := std_logic_vector(to_unsigned(tolerance, N));
        
        -- Confronta con la tolleranza
        return (abs_diff <= tolerance_vec);
    end function;

begin
    UUT: LUT generic map (N => N)
             port map (ANGLE => ANGLE, SINE => SINE);
    
    process
        variable expected_sine : std_logic_vector(N-1 downto 0);
    begin
        -- Test Case 1: Angle 0
        ANGLE <= "0000000";
        TEST_CASE <= "0001";
        expected_sine := "0000000000";
        wait for 10 ns;
        TEST_PASS <= '1' when SINE = expected_sine else '0';
        wait for 10 ns;
        
        -- Test Case 2: Angle 90
        ANGLE <= "1011010";
        TEST_CASE <= "0010";
        expected_sine := "0100000000";
        wait for 10 ns;
        TEST_PASS <= '1' when SINE = expected_sine else '0';
        wait for 10 ns;
        
        -- Test Case 3: Angle 89
        ANGLE <= "1011001";
        TEST_CASE <= "0011";
        expected_sine := "0011111111";
        wait for 10 ns;
        TEST_PASS <= '1' when SINE = expected_sine else '0';
        wait for 10 ns;
        
        -- Test Case 4: Angle 8 (multiple of 8)
        ANGLE <= "0001000";
        TEST_CASE <= "0100";
        expected_sine := "0000100011";
        wait for 10 ns;
        TEST_PASS <= '1' when SINE = expected_sine else '0';
        wait for 10 ns;
        
        -- Test Case 5: Angle 45 (requires interpolation)
        ANGLE <= "0101101";
        TEST_CASE <= "0101";
        expected_sine := "0010110101";
        wait for 10 ns;
        TEST_PASS <= '1' when compare_with_tolerance(SINE, expected_sine, 2) else '0';
        wait for 10 ns;
        
        -- Test Case 6: Angle 30 (requires interpolation)
        ANGLE <= "0011110";
        TEST_CASE <= "0110";
        expected_sine := "0001111011";
        wait for 10 ns;
        TEST_PASS <= '1' when compare_with_tolerance(SINE, expected_sine, 2) else '0';
        wait for 10 ns;
        
        -- Test Case 7: Angle 60 (requires interpolation)
        ANGLE <= "0111100";
        TEST_CASE <= "0111";
        expected_sine := "0011011010";
        wait for 10 ns;
        TEST_PASS <= '1' when compare_with_tolerance(SINE, expected_sine, 2) else '0';
        wait for 10 ns;
        
        -- Test Case 8: Angle 1 (edge case, close to 0)
        ANGLE <= "0000001";
        TEST_CASE <= "1000";
        expected_sine := "0000000011";
        wait for 10 ns;
        TEST_PASS <= '1' when compare_with_tolerance(SINE, expected_sine, 2) else '0';
        wait for 10 ns;
        
        -- End of simulation
        TEST_CASE <= "1111";
        wait;
    end process;

end Behavioral;