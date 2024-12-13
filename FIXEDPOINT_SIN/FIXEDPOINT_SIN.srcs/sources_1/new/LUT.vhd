library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

--------------------------------
-- Lookup Table (LUT) 
--------------------------------
entity LUT is
    generic (
        N : positive := 10      -- Number of bits for sine values
    );
    Port (
        ANGLE : in std_logic_vector(6 downto 0);        -- Input: 7-bit angle
        SINE  : out std_logic_vector(N-1 downto 0)     -- Output: N-bit sine value
    );
end entity LUT;

architecture RTL of LUT is

    ----------
    -- Definition of the sine LUT type and values
    ----------
    type LUT_TYPE is array (0 to 12) of std_logic_vector(N-1 downto 0);
    constant SINE_LUT_VALUES : LUT_TYPE := (
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
            ANGLE_DIFF        : in std_logic_vector(2 downto 0);         -- Angle difference for interpolation
            SINE1, SINE2       : in std_logic_vector(N-1 downto 0);     -- Adjacent LUT values
            RESULT                : out std_logic_vector(N-1 downto 0)   -- Interpolated sine value
        );
    end component;
    
    --------
    -- Internal signals
    --------
    signal FINAL_SINE                 : std_logic_vector(N-1 downto 0);      -- Final sine value 
    signal LUT_SINE                     : std_logic_vector(N-1 downto 0);      -- Selected sine value from LUT
    signal NEXT_SINE                  : std_logic_vector(N-1 downto 0);      -- Next sine value for interpolation
    signal ANGLE_REMAINDER  : std_logic_vector(2 downto 0);          -- Fractional part of the angle
    signal INDEX                          : integer range 0 to 12 := 0;                -- Index for the LUT

begin

    INTERPOLATOR: INTERP       
        generic map (N => N)  
        port map (
            ANGLE_DIFF              => ANGLE_REMAINDER,      -- Fractional part of the angle
            SINE1                         => LUT_SINE,                         -- Current sine value from LUT
            SINE2                         => NEXT_SINE,                      -- Next sine value from LUT
            RESULT                      => FINAL_SINE                      -- Interpolated result
        );

    ---------
    -- Process to calculate the sine value based on the input angle
    ---------
    process(ANGLE)
    begin

        INDEX   <= 0;
        LUT_SINE <= (others => '0');
        NEXT_SINE <= (others => '0');
        ANGLE_REMAINDER <= "000";
        
        ---------
        -- Handling special cases
        ---------
        case ANGLE is
            when "1011010" =>                                                      -- 90°
                LUT_SINE <= SINE_LUT_VALUES(12);                      -- Directly select sine value from LUT
                
            when "1011001" | "1011000" =>                                 -- 88° or 89°
                LUT_SINE <= SINE_LUT_VALUES(11);                      -- Directly select sine value from LUT
                
            when "0000000" =>                                                      -- 0°
                LUT_SINE <= SINE_LUT_VALUES(0);                      -- Directly select sine value from LUT
                
                
            when others =>
                ---------
                -- Compute the base index for the LUT
                ---------
                INDEX <= conv_integer(unsigned('0' & ANGLE(6 downto 3)));
                LUT_SINE <= SINE_LUT_VALUES(INDEX);                         
                
                 ----------
                -- Sine calculation without interpolation
                ----------
                if ANGLE(2 downto 0) = "000" then
                    LUT_SINE <= SINE_LUT_VALUES(INDEX+1);                         
                    NEXT_SINE <= LUT_SINE;                                             -- Get next sine value for interpolation
                    ANGLE_REMAINDER <= ANGLE(2 downto 0);            
                end if;
                
                ----------
                -- Check if interpolation is needed
                ----------
                if ANGLE(2 downto 0) /= "000" then
                    NEXT_SINE <= SINE_LUT_VALUES(INDEX + 1);           -- Get next sine value for interpolation
                    ANGLE_REMAINDER <= ANGLE(2 downto 0);            -- Extract fractional angle part
                end if;
        end case;
    end process;

    SINE <= FINAL_SINE;

end architecture RTL;