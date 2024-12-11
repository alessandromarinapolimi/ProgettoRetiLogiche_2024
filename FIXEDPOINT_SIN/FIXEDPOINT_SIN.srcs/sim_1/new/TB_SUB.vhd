library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_SUB is
end TB_SUB;

architecture Behavioral of TB_SUB is

    -- Generic parameter
    constant N : positive := 8;  -- Number of bits for the test

    -- Component declaration for the SUB
    component SUB
        generic (
            N : positive
        );
        Port(
            X    : in  std_logic_vector(N-1 downto 0);
            Y    : in  std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- Signals to drive the inputs and capture outputs
    signal X, Y, DIFF : std_logic_vector(N-1 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: SUB
        generic map (N => N)
        port map (
            X => X,
            Y => Y,
            DIFF => DIFF
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: 00000000 - 00000000 = 00000000
        X <= (others => '0');
        Y <= (others => '0');
        wait for 10 ns;
        assert (unsigned(DIFF) = 0) 
            report "Test Case 1 Failed: Expected 00000000, got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 2: 00000001 - 00000000 = 00000001
        X <= "00000001";
        Y <= "00000000";
        wait for 10 ns;
        assert (unsigned(DIFF) = 1) 
            report "Test Case 2 Failed: Expected 00000001, got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 3: 00000010 - 00000001 = 00000001
        X <= "00000010";
        Y <= "00000001";
        wait for 10 ns;
        assert (unsigned(DIFF) = 1) 
            report "Test Case 3 Failed: Expected 00000001, got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 4: 00000001 - 00000010 = 11111111 (underflow)
        X <= "00000001";
        Y <= "00000010";
        wait for 10 ns;
        assert (unsigned(DIFF) = 255) 
            report "Test Case 4 Failed: Expected 11111111 (255), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 5: 11111111 - 00000001 = 11111110
        X <= "11111111";
        Y <= "00000001";
        wait for 10 ns;
        assert (unsigned(DIFF) = 254) 
            report "Test Case 5 Failed: Expected 11111110 (254), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 6: 10000000 - 10000000 = 00000000
        X <= "10000000";
        Y <= "10000000";
        wait for 10 ns;
        assert (unsigned(DIFF) = 0) 
            report "Test Case 6 Failed: Expected 00000000, got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 7: Random case: 10101010 - 01010101 = 01010101
        X <= "10101010";
        Y <= "01010101";
        wait for 10 ns;
        assert (unsigned(DIFF) = 85)  -- 10101010 - 01010101 = 01010101 (85 in decimal)
            report "Test Case 7 Failed: Expected 01010101 (85), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 8: Random case: 11110000 - 00001111 = 11100001
        X <= "11110000";
        Y <= "00001111";
        wait for 10 ns;
        assert (unsigned(DIFF) = 225)  -- 11110000 - 00001111 = 11100001 (225 in decimal)
            report "Test Case 8 Failed: Expected 11100001 (225), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 9: 00000000 - 00000001 = 11111111 (underflow)
        X <= "00000000";
        Y <= "00000001";
        wait for 10 ns;
        assert (unsigned(DIFF) = 255)  -- Underflow, 0 - 1 = 11111111 (255 in decimal)
            report "Test Case 9 Failed: Expected 11111111 (255), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 10: 00000000 - 11111111 = 00000001 (underflow)
        X <= "00000000";
        Y <= "11111111";
        wait for 10 ns;
        assert (unsigned(DIFF) = 1)  -- Underflow, 0 - 255 = 1 in 2's complement arithmetic
            report "Test Case 10 Failed: Expected 00000001 (1), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- Test case 11: 11111111 - 00000000 = 11111111
        X <= "11111111";
        Y <= "00000000";
        wait for 10 ns;
        assert (unsigned(DIFF) = 255)  -- 11111111 - 00000000 = 11111111
            report "Test Case 11 Failed: Expected 11111111 (255), got " & integer'image(to_integer(unsigned(DIFF))) 
            severity error;

        -- End of test cases
        report "-----------------------------------------" severity note;
        report "SIMULAZIONE ESEGUITA CORRETTAMENTE" severity note;
        report "-----------------------------------------" severity note;

        -- Stop simulation
        std.env.stop;
    end process;

end Behavioral;
