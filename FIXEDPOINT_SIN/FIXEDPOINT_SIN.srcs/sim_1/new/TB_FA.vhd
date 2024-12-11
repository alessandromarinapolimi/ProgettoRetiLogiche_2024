library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FA is
end TB_FA;

architecture Behavioral of TB_FA is

    -- Component declaration of the Full Adder (FA)
    component FA
        Port(
            X, Y, CIN : in  std_logic;
            SUM, COUT : out std_logic
        );
    end component;

    -- Test signals to connect to the FA component
    signal X, Y, CIN : std_logic;
    signal SUM, COUT    : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT), the Full Adder (FA)
    UUT: FA
        Port map (
            X    => X,
            Y    => Y,
            CIN  => CIN,
            SUM  => SUM,
            COUT => COUT
        );

    -- Stimulus process to apply test vectors
    stimulus_process: process
    begin
        -- Test case 1: X = 0, Y = 0, CIN = 0 => CIN = 0, COUT = 0
        X <= '0'; Y <= '0'; CIN <= '0';
        wait for 10 ns;
        assert (SUM = '0' and COUT = '0') 
            report "Test Case 1 Failed: Expected CIN = 0, COUT = 0" 
            severity error;

        -- Test case 2: X = 0, Y = 0, CIN = 1 => CIN = 1, COUT = 0
        X <= '0'; Y <= '0'; CIN <= '1';
        wait for 10 ns;
        assert (SUM = '1' and COUT = '0') 
            report "Test Case 2 Failed: Expected CIN = 1, COUT = 0" 
            severity error;

        -- Test case 3: X = 0, Y = 1, CIN = 0 => CIN = 1, COUT = 0
        X <= '0'; Y <= '1'; CIN <= '0';
        wait for 10 ns;
        assert (SUM = '1' and COUT = '0') 
            report "Test Case 3 Failed: Expected CIN = 1, COUT = 0" 
            severity error;

        -- Test case 4: X = 0, Y = 1, CIN = 1 => CIN = 0, COUT = 1
        X <= '0'; Y <= '1'; CIN <= '1';
        wait for 10 ns;
        assert (SUM = '0' and COUT = '1') 
            report "Test Case 4 Failed: Expected CIN = 0, COUT = 1" 
            severity error;

        -- Test case 5: X = 1, Y = 0, CIN = 0 => CIN = 1, COUT = 0
        X <= '1'; Y <= '0'; CIN <= '0';
        wait for 10 ns;
        assert (SUM = '1' and COUT = '0') 
            report "Test Case 5 Failed: Expected CIN = 1, COUT = 0" 
            severity error;

        -- Test case 6: X = 1, Y = 0, CIN = 1 => CIN = 0, COUT = 1
        X <= '1'; Y <= '0'; CIN <= '1';
        wait for 10 ns;
        assert (SUM = '0' and COUT = '1') 
            report "Test Case 6 Failed: Expected CIN = 0, COUT = 1" 
            severity error;

        -- Test case 7: X = 1, Y = 1, CIN = 0 => CIN = 0, COUT = 1
        X <= '1'; Y <= '1'; CIN <= '0';
        wait for 10 ns;
        assert (SUM = '0' and COUT = '1') 
            report "Test Case 7 Failed: Expected CIN = 0, COUT = 1" 
            severity error;

        -- Test case 8: X = 1, Y = 1, CIN = 1 => CIN = 1, COUT = 1
        X <= '1'; Y <= '1'; CIN <= '1';
        wait for 10 ns;
        assert (SUM = '1' and COUT = '1') 
            report "Test Case 8 Failed: Expected CIN = 1, COUT = 1" 
            severity error;

        -- Tests completed 
        report "-----------------------------------------" severity note;
        report "----SIMULATION COMPLETED SUCCESSFULLY----" severity NOTE;
        report "-----------------------------------------" severity note;

        -- Simulation ended
        std.env.stop;
    end process;

end Behavioral;
