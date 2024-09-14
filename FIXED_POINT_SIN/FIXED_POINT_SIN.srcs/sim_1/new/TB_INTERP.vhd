library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_INTERP is
end TB_INTERP;

architecture Behavioral of TB_INTERP is
    constant N : positive := 10;  -- Assuming 10-bit precision for sine values

    component INTERP is
        generic (
            N : positive 
        );
        Port(
            ANGLE             : in  std_logic_vector(6 downto 0);
            SINE1, SINE2      : in  std_logic_vector(N-1 downto 0);
            INTERPOLATED_SINE : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal ANGLE : std_logic_vector(6 downto 0) := (others => '0');
    signal SINE1, SINE2, INTERPOLATED_SINE : std_logic_vector(N-1 downto 0) := (others => '0');

    -- Function to convert real to std_logic_vector
    function real_to_slv(r : real; bits : positive) return std_logic_vector is
        variable int_val : integer;
    begin
        int_val := integer(r * real(2**(bits-2)));
        return std_logic_vector(to_signed(int_val, bits));
    end function;

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: INTERP 
        generic map (N => N)
        port map (
            ANGLE => ANGLE,
            SINE1 => SINE1,
            SINE2 => SINE2,
            INTERPOLATED_SINE => INTERPOLATED_SINE
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Angle = 0, SINE1 = 0, SINE2 = 0.5
        ANGLE <= "0000000";  -- 0 degrees
        SINE1 <= real_to_slv(0.0, N);
        SINE2 <= real_to_slv(0.5, N);
        wait for 10 ns;
        assert (unsigned(INTERPOLATED_SINE) = 0) 
            report "Test case 1 failed" severity ERROR;

        -- Test case 2: Angle = 4 (halfway between 0 and 8), SINE1 = 0, SINE2 = 0.5
        ANGLE <= "0000100";  -- 4 degrees
        SINE1 <= real_to_slv(0.0, N);
        SINE2 <= real_to_slv(0.5, N);
        wait for 10 ns;
        assert (unsigned(INTERPOLATED_SINE) = unsigned(real_to_slv(0.25, N))) 
            report "Test case 2 failed" severity ERROR;

        -- Test case 3: Angle = 8, SINE1 = 0, SINE2 = 0.5
        ANGLE <= "0001000";  -- 8 degrees
        SINE1 <= real_to_slv(0.0, N);
        SINE2 <= real_to_slv(0.5, N);
        wait for 10 ns;
        assert (unsigned(INTERPOLATED_SINE) = unsigned(real_to_slv(0.5, N))) 
            report "Test case 3 failed" severity ERROR;

        -- Test case 4: Random angle between 0 and 8
        ANGLE <= "0000110";  -- 6 degrees
        SINE1 <= real_to_slv(0.0, N);
        SINE2 <= real_to_slv(1.0, N);
        wait for 10 ns;
        assert (unsigned(INTERPOLATED_SINE) > unsigned(real_to_slv(0.6, N)) and
                unsigned(INTERPOLATED_SINE) < unsigned(real_to_slv(0.8, N))) 
            report "Test case 4 failed" severity ERROR;

        -- End simulation
        
        report "Simulation finished successfully";
        std.env.stop;
    end process;

end Behavioral;