library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT is
    generic (
        N : positive := 10  -- Number of bits for sine values
    );
    Port (
        ANGLE : in std_logic_vector(6 downto 0);     -- Input: 7-bit angle
        SINE  : out std_logic_vector(N-1 downto 0)   -- Output: N-bit sine value
    );
end entity LUT;

architecture RTL of LUT is
    type lut_type is array (0 to 12) of std_logic_vector(N-1 downto 0);
    constant SINE_LUT : lut_type := (
        "0000000000", -- sin(0)    (0.00000000)
        "0000100011", -- sin(8)    (0.13671875)
        "0001000110", -- sin(16)   (0.27343750)
        "0001101000", -- sin(24)   (0.40625000)
        "0010000111", -- sin(32)   (0.52734375)
        "0010100100", -- sin(40)   (0.64062500)
        "0010111110", -- sin(48)   (0.74218750)
        "0011010100", -- sin(56)   (0.82812500)
        "0011100110", -- sin(64)   (0.89843750)
        "0011110011", -- sin(72)   (0.94921875)
        "0011111100", -- sin(80)   (0.98437500)
        "0011111111", -- sin(88) & sin(89) (0.99609375)
        "0100000000"  -- sin(90)   (1.00000000)
    );

    component INTERP is 
        generic (N : positive);
        Port (
            ANGLE_DIFF : in std_logic_vector(2 downto 0);
            SINE1, SINE2 : in std_logic_vector(N-1 downto 0);
            RESULT : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component MUX is
        Port (
            A, B : in std_logic;
            S   : in std_logic;
            Z   : out std_logic
        );
    end component;

    signal SINE1, SINE2 : std_logic_vector(N-1 downto 0);
    signal ANGLE_DIFF : std_logic_vector(2 downto 0);
    signal INTERPOLATED_SINE : std_logic_vector(N-1 downto 0);
    signal LUT_OUT : std_logic_vector(N-1 downto 0);
    signal is_special_case : std_logic;
    signal mux_out : std_logic_vector(N-1 downto 0);

begin
    -- Interpolator instantiation
    INTERPOLATOR: INTERP
        generic map (N => N)  
        port map (
            ANGLE_DIFF => ANGLE_DIFF,
            SINE1 => SINE1,
            SINE2 => SINE2,
            RESULT => INTERPOLATED_SINE
        );

    -- Generate N multiplexers, one for each bit of the output
    GEN_MUX: for i in 0 to N-1 generate
        MUX_i: MUX
            port map (
                A => INTERPOLATED_SINE(i),
                B => LUT_OUT(i),
                S => is_special_case,
                Z => mux_out(i)
            );
    end generate GEN_MUX;

    -- Process for angle input handling
    process(ANGLE)
    begin
        -- Default assignments
        LUT_OUT <= SINE_LUT(0);
        SINE1 <= SINE_LUT(0);
        SINE2 <= SINE_LUT(1);
        ANGLE_DIFF <= ANGLE(2 downto 0);
        is_special_case <= '0';

        -- Special cases handling
        if ANGLE = "1011010" then     -- 90°
            LUT_OUT <= SINE_LUT(12);
            is_special_case <= '1';
            
        elsif ANGLE(6 downto 1) = "101100" then    -- 88° or 89°
            LUT_OUT <= SINE_LUT(11);
            is_special_case <= '1';
            
        elsif ANGLE(2 downto 0) = "000" then    -- Multiple of 8°
            case ANGLE(6 downto 3) is
                when "0000" => LUT_OUT <= SINE_LUT(0);
                when "0001" => LUT_OUT <= SINE_LUT(1);
                when "0010" => LUT_OUT <= SINE_LUT(2);
                when "0011" => LUT_OUT <= SINE_LUT(3);
                when "0100" => LUT_OUT <= SINE_LUT(4);
                when "0101" => LUT_OUT <= SINE_LUT(5);
                when "0110" => LUT_OUT <= SINE_LUT(6);
                when "0111" => LUT_OUT <= SINE_LUT(7);
                when "1000" => LUT_OUT <= SINE_LUT(8);
                when "1001" => LUT_OUT <= SINE_LUT(9);
                when others => LUT_OUT <= SINE_LUT(10);
            end case;
            is_special_case <= '1';
        else
            -- Regular case: needs interpolation
            case ANGLE(6 downto 3) is
                when "0000" => 
                    SINE1 <= SINE_LUT(0);
                    SINE2 <= SINE_LUT(1);
                when "0001" => 
                    SINE1 <= SINE_LUT(1);
                    SINE2 <= SINE_LUT(2);
                when "0010" => 
                    SINE1 <= SINE_LUT(2);
                    SINE2 <= SINE_LUT(3);
                when "0011" => 
                    SINE1 <= SINE_LUT(3);
                    SINE2 <= SINE_LUT(4);
                when "0100" => 
                    SINE1 <= SINE_LUT(4);
                    SINE2 <= SINE_LUT(5);
                when "0101" => 
                    SINE1 <= SINE_LUT(5);
                    SINE2 <= SINE_LUT(6);
                when "0110" => 
                    SINE1 <= SINE_LUT(6);
                    SINE2 <= SINE_LUT(7);
                when "0111" => 
                    SINE1 <= SINE_LUT(7);
                    SINE2 <= SINE_LUT(8);
                when "1000" => 
                    SINE1 <= SINE_LUT(8);
                    SINE2 <= SINE_LUT(9);
                when "1001" => 
                    SINE1 <= SINE_LUT(9);
                    SINE2 <= SINE_LUT(10);
                when others => 
                    SINE1 <= SINE_LUT(10);
                    SINE2 <= SINE_LUT(11);
            end case;
        end if;
    end process;

    SINE <= mux_out;

end architecture RTL;