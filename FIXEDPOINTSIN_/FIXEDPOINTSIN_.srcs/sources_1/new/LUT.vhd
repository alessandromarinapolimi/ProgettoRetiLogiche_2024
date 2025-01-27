library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- Lookup Table (LUT)
--------------------------------------
entity LUT is
    generic (
        N : positive := 10;                                                        
        M: positive := 6
    );
    Port (
        ANGLE   : in  std_logic_vector(M downto 0);             -- Input: 7-bit angle
        SINE       : out std_logic_vector(N-1 downto 0)        -- Output: N-bit sine value
    );
end entity LUT;

architecture RTL of LUT is

    --------
    -- LUT array values' declaration
    --------
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
        generic (
            N : positive
        );
        Port (
            ANGLE_DIFF                             : in  std_logic_vector(2 downto 0);                    -- Input: Fine angle difference
            SINE1, SINE2                            : in  std_logic_vector(N-1 downto 0);                -- Input: Two sine values for interpolation
            INTERPOLATED_SINE              : out std_logic_vector(N-1 downto 0)                -- Output: Interpolated sine value
        );
    end component;

    --------
    -- Internal signals for sine interpolation
    --------
    signal SINE1, SINE2, INTERPOLATED_SINE : std_logic_vector(N-1 downto 0);

begin
    --------
    -- Interpolation logic
    --------
    INTERPOLATOR: INTERP
        generic map (
            N => N
        )
        port map (
            ANGLE_DIFF                           => ANGLE(2 downto 0),                                
            SINE1                                      => SINE1,
            SINE2                                      => SINE2,
            INTERPOLATED_SINE             => INTERPOLATED_SINE
        );

    --------
    -- Assign sine values based on the most significant angle bits
    --------
    process(ANGLE)
    begin
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
    end process;

    --------
    -- Output logic: Use lookup table values or interpolation as needed
    --------
    process(ANGLE, INTERPOLATED_SINE)
    begin
        case ANGLE is
            when "0000000" => SINE <= SINE_LUT(0);                              -- 0° 
            when "0001000" => SINE <= SINE_LUT(1);                              -- 8°
            when "0010000" => SINE <= SINE_LUT(2);                              -- 16°
            when "0011000" => SINE <= SINE_LUT(3);                              -- 24°
            when "0100000" => SINE <= SINE_LUT(4);                              -- 32°
            when "0101000" => SINE <= SINE_LUT(5);                              -- 40°
            when "0110000" => SINE <= SINE_LUT(6);                              -- 48°
            when "0111000" => SINE <= SINE_LUT(7);                              -- 56°
            when "1000000" => SINE <= SINE_LUT(8);                              -- 64°
            when "1001000" => SINE <= SINE_LUT(9);                              -- 72°
            when "1010000" => SINE <= SINE_LUT(10);                             -- 80°
            when "1011000" | "1011001" => SINE <= SINE_LUT(11);        -- 88° or 89°
            when "1011010" => SINE <= SINE_LUT(12);                             -- 90°
            when others => SINE <= INTERPOLATED_SINE;                      -- Interpolated values
        end case;
    end process;

end architecture RTL;