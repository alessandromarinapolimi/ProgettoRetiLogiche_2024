library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_RCA is
    generic (
        N : positive := 10  -- Number of bits for tests
    );
end TB_RCA;

architecture Behavioral of TB_RCA is
    -- Component declaration
    component RCA
        generic (
            N : positive
        );
        Port (
            A, B : in  std_logic_vector(N-1 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(N-1 downto 0);
            COUT : out std_logic
        );
    end component;
    
    -- Signal declarations
    signal A, B, SUM : std_logic_vector(N-1 downto 0);
    signal CIN, COUT : std_logic;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: RCA 
    generic map (N => N)
    port map (
        A => A,
        B => B,
        CIN => CIN,
        SUM => SUM,
        COUT => COUT
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: 000...000 + 000...000 + 0
        A <= (others => '0'); B <= (others => '0'); CIN <= '0';
        wait for 10 ns;
        assert (unsigned(SUM) = 0 and COUT = '0') 
            report "Test case 1 failed: Expected 0, got " & integer'image(to_integer(unsigned(SUM))) 
            severity ERROR;
        
        -- Test case 2: 000...000 + 000...000 + 1
        A <= (others => '0'); B <= (others => '0'); CIN <= '1';
        wait for 10 ns;
        assert (unsigned(SUM) = 1 and COUT = '0') 
            report "Test case 2 failed: Expected 1, got " & integer'image(to_integer(unsigned(SUM))) 
            severity ERROR;
        
        -- Test case 3: 111...111 + 111...111 + 0
        A <= (others => '1'); B <= (others => '1'); CIN <= '0';
        wait for 10 ns;
        assert (unsigned(SUM) = 2**N - 2 and COUT = '1') 
            report "Test case 3 failed: Expected " & integer'image(2**N - 2) & " with carry, got " & integer'image(to_integer(unsigned(SUM))) 
            severity ERROR;
        
        -- Test case 4: 111...111 + 111...111 + 1
        A <= (others => '1'); B <= (others => '1'); CIN <= '1';
        wait for 10 ns;
        assert (unsigned(SUM) = 2**N - 1 and COUT = '1') 
            report "Test case 4 failed: Expected " & integer'image(2**N - 1) & " with carry, got " & integer'image(to_integer(unsigned(SUM))) 
            severity ERROR;
        
        -- Test case 5: 1010... + 0101... + 0 (alternating bits)
        A <= (N-1 downto 0 => '1', others => '0'); 
        B <= not A; 
        CIN <= '0';
        wait for 10 ns;
        assert (unsigned(SUM) = unsigned(A) + unsigned(B)) 
            report "Test case 5 failed: Expected " & integer'image(to_integer(unsigned(A) + unsigned(B))) & 
                   ", got " & integer'image(to_integer(unsigned(SUM)))
            severity ERROR;
        
        -- Test case 6: 1010... + 0101... + 1 (alternating bits)
        A <= (N-1 downto 0 => '1', others => '0'); 
        B <= not A; 
        CIN <= '1';
        wait for 10 ns;
        assert (unsigned(SUM) = unsigned(A) + unsigned(B) + 1) 
            report "Test case 6 failed: Expected " & integer'image(to_integer(unsigned(A) + unsigned(B) + 1)) & 
                   ", got " & integer'image(to_integer(unsigned(SUM)))
            severity ERROR;
        
        -- Test case 7: 111...111 + 000...000 + 0
        A <= (others => '1'); B <= (others => '0'); CIN <= '0';
        wait for 10 ns;
        assert (unsigned(SUM) = 2**N - 1 and COUT = '0') 
            report "Test case 7 failed: Expected " & integer'image(2**N - 1) & ", got " & integer'image(to_integer(unsigned(SUM)))
            severity ERROR;
        
        -- Test case 8: 111...111 + 000...000 + 1
        A <= (others => '1'); B <= (others => '0'); CIN <= '1';
        wait for 10 ns;
        assert (unsigned(SUM) = 0 and COUT = '1') 
            report "Test case 8 failed: Expected 0 with carry, got " & integer'image(to_integer(unsigned(SUM))) & " with COUT = " & std_logic'image(COUT)
            severity ERROR;
        
        -- Test case 9: 000...000 + 111...111 + 0
        A <= (others => '0'); B <= (others => '1'); CIN <= '0';
        wait for 10 ns;
        assert (unsigned(SUM) = 2**N - 1 and COUT = '0') 
            report "Test case 9 failed: Expected " & integer'image(2**N - 1) & ", got " & integer'image(to_integer(unsigned(SUM)))
            severity ERROR;
        
        -- Test case 10: 000...000 + 111...111 + 1
        A <= (others => '0'); B <= (others => '1'); CIN <= '1';
        wait for 10 ns;
        assert (unsigned(SUM) = 0 and COUT = '1') 
            report "Test case 10 failed: Expected 0 with carry, got " & integer'image(to_integer(unsigned(SUM)))
            severity ERROR;
        
        -- Tests completed 
        report "-----------------------------------------" severity NOTE;
        report "----SIMULATION COMPLETED SUCCESSFULLY----" severity NOTE;
        report "-----------------------------------------" severity NOTE;

        -- Simulation ended
        std.env.stop; 
    end process;

end Behavioral;