library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

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
    -- Definition of the sine LUT type and values
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
            ANGLE_DIFF        : in std_logic_vector(2 downto 0);
            SINE1, SINE2       : in std_logic_vector(N-1 downto 0);
            RESULT                : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    -- Internal signals
    signal FINAL_SINE                 : std_logic_vector(N-1 downto 0);
    signal LUT_SINE                   : std_logic_vector(N-1 downto 0);
    signal NEXT_SINE                  : std_logic_vector(N-1 downto 0);
    signal ANGLE_REMAINDER            : std_logic_vector(2 downto 0);
    signal INDEX                       : integer range 0 to 12 := 0;
    signal SAFE_INDEX                 : integer range 0 to 12 := 0;

begin
    INTERPOLATOR: INTERP       
        generic map (N => N)  
        port map (
            ANGLE_DIFF   => ANGLE_REMAINDER,
            SINE1        => LUT_SINE,
            SINE2        => NEXT_SINE,
            RESULT       => FINAL_SINE
        );

    process(ANGLE)
        variable TEMP_INDEX : integer range 0 to 15;
    begin
        -- Safe index calculation using conv_integer
        TEMP_INDEX := conv_integer(unsigned('0' & ANGLE(6 downto 3)));
        
        -- Bound checking
        if TEMP_INDEX > 12 then
            SAFE_INDEX <= 12;
        else
            SAFE_INDEX <= TEMP_INDEX;
        end if;

        -- Reset default values
        LUT_SINE <= (others => '0');
        NEXT_SINE <= (others => '0');
        ANGLE_REMAINDER <= "000";
        
        -- Special cases handling
        case ANGLE is
            when "1011010" =>  -- 90°
                LUT_SINE <= SINE_LUT_VALUES(12);
                
            when "1011001" | "1011000" =>  -- 88° or 89°
                LUT_SINE <= SINE_LUT_VALUES(11);
                
            when "0000000" =>  -- 0°
                LUT_SINE <= SINE_LUT_VALUES(0);
                
            when others =>
                -- Use SAFE_INDEX for LUT access
                LUT_SINE <= SINE_LUT_VALUES(SAFE_INDEX);
                
                -- Interpolation logic
                if ANGLE(2 downto 0) = "000" then
                    if SAFE_INDEX < 12 then
                        LUT_SINE <= SINE_LUT_VALUES(SAFE_INDEX + 1);
                        NEXT_SINE <= LUT_SINE;
                    else
                        LUT_SINE <= SINE_LUT_VALUES(12);
                    end if;
                    ANGLE_REMAINDER <= ANGLE(2 downto 0);
                else
                    if SAFE_INDEX < 12 then
                        NEXT_SINE <= SINE_LUT_VALUES(SAFE_INDEX + 1);
                    else
                        NEXT_SINE <= SINE_LUT_VALUES(12);
                    end if;
                    ANGLE_REMAINDER <= ANGLE(2 downto 0);
                end if;
        end case;
    end process;

    SINE <= FINAL_SINE;
end architecture RTL;