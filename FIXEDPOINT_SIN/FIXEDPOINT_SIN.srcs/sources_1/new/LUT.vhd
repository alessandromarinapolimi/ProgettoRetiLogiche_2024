library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

------------------------------
-- LookUp Table (LUT)
------------------------------
entity LUT is
    generic (
        N : positive := 10  -- Number of bits for sine values
    );
    Port (
        ANGLE : in std_logic_vector(6 downto 0);        -- Input: 7-bit angle
        SINE  : out std_logic_vector(N-1 downto 0)     -- Output: N-bit sine value
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
            ANGLE_DIFF       : in std_logic_vector(2 downto 0);
            SINE1, SINE2      : in std_logic_vector(N-1 downto 0);
            RESULT               : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal SINE1, SINE2                        : std_logic_vector(N-1 downto 0);
    signal ANGLE_DIFF                         : std_logic_vector(2 downto 0);
    signal INTERPOLATED_SINE          : std_logic_vector(N-1 downto 0);
    signal LUT_OUT                              : std_logic_vector(N-1 downto 0);
    signal USE_INTERPOLATION         : std_logic;

    begin
        INTERPOLATOR: INTERP       
            generic map (N => N)  
            port map (
                ANGLE_DIFF => ANGLE_DIFF,
                SINE1      => SINE1,
                SINE2      => SINE2,
                RESULT   => INTERPOLATED_SINE
            );
    
        ----------
        -- Process for angle input handling
        ----------
        process(ANGLE)
        begin
            USE_INTERPOLATION <= '0';
            LUT_OUT <= (others => '0');
            SINE1 <= (others => '0');
            SINE2 <= (others => '0');
            ANGLE_DIFF <= "000";  
        
            -----------
            -- Special cases for specific angles
            -----------
            if ANGLE = "1011010" then                              -- 90°
                USE_INTERPOLATION <= '0';
                LUT_OUT <= SINE_LUT(12);
            elsif ANGLE(6 downto 1) = "101100" then      -- 88° or 89°
                USE_INTERPOLATION <= '0';
                LUT_OUT <= SINE_LUT(11);
            else
            
                if ANGLE(2 downto 0) = "000" then
                    USE_INTERPOLATION <= '0';
                    
                    ------------
                    -- Selection of sine values from the lookup table
                    ------------      
                    LUT_OUT <= SINE_LUT(conv_integer(unsigned('0' & ANGLE(6 downto 3))));      
                                                      
                else
                
                    USE_INTERPOLATION <= '1';
                    ANGLE_DIFF <= ANGLE(2 downto 0);
                    
                    -----------
                    -- Selection of sine values for interpolation
                    -----------
                    SINE1 <= SINE_LUT(conv_integer(unsigned('0' & ANGLE(6 downto 3))));
                    SINE2 <= SINE_LUT(conv_integer(unsigned('0' & ANGLE(6 downto 3))) + 1);
                    
                    LUT_OUT <= INTERPOLATED_SINE;
                end if;
            end if;
        end process;
    
        SINE <=INTERPOLATED_SINE when USE_INTERPOLATION = '1' else LUT_OUT;        -- Output selection: either interpolated result or LUT output
    
end architecture RTL;