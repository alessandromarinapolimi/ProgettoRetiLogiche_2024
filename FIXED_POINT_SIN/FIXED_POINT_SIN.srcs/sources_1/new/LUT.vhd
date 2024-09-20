library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Lookup Table (LUT)
entity LUT is
    generic (
        N : positive := 10  
    );
    
    Port (
        ANGLE       : in std_logic_vector(6 downto 0);         -- Input: 7-bit angle
        SINE           : out std_logic_vector(N-1 downto 0)   -- Output: N-bit sine value
    );
end LUT;

architecture RTL of LUT is

    type lut_type is array (0 to 10) of std_logic_vector(N-1 downto 0);

    -- Precomputed sine values for specific angles in the range of 0 to 90 degrees
    constant SINE_LUT : lut_type := (
        "0000000000", -- sin(0)    (0.00000000)
        "0000100011", -- sin(8)    (0.13671875)
        "0001000110", -- sin(16)  (0.27343750)
        "0001101000", -- sin(24)  (0.40625000)
        "0010000111", -- sin(32)  (0.52734375)
        "0010100100", -- sin(40)  (0.64062500)
        "0010111110", -- sin(48)  (0.74218750)
        "0011010100", -- sin(56)  (0.82812500)
        "0011100110", -- sin(64)  (0.89843750)
        "0011110011", -- sin(72)  (0.94921875)
        "0011111100", -- sin(80)  (0.98437500)
        "0011111111", -- sin(88)  (0.99609375)
        "0100000000"  -- sin(90)  (1.00000000)
    );

    -- Component declaration for the SUB
    component SUB is
        generic (N : positive);
        Port(
            X, Y     : in std_logic_vector(N-1 downto 0);     -- Inputs: X and Y
            DIFF   : out std_logic_vector(N-1 downto 0)    -- Output: Difference (X - Y)
        );
    end component;

    -- Component declaration for the INTERP
    component INTERP is 
        generic (N : positive);
        
        Port(
            ANGLE_DIFF     : in std_logic_vector(2 downto 0);            -- Input: 3-bit angle difference for interpolation
            SINE1, SINE2    : in std_logic_vector(N-1 downto 0);        -- Inputs: Two adjacent sine values
            RESULT             : out std_logic_vector(N-1 downto 0)      -- Output: Interpolated sine value
        );
    end component;

    -- Signal declarations
    signal ANGLE_89, ANGLE_90            : std_logic_vector(6 downto 0);           -- Angles 89 and 90 in binary
    signal DIFF_89, DIFF_90                    : std_logic_vector(6 downto 0);           -- Difference from 89 and 90 degrees
    signal SINE1, SINE2                           : std_logic_vector(N-1 downto 0);       -- Sine values from the LUT
    signal ANGLE_DIFF                            : std_logic_vector(2 downto 0);           -- Angle difference for interpolation
    signal INTERPOLATED_SINE             : std_logic_vector(N-1 downto 0);       -- Final interpolated sine value

begin

    -- Assign constants for angle 89 and 90 in binary
    ANGLE_89 <= "1011001";  
    ANGLE_90 <= "1011010";  

    -- Subtract the input angle from 89 degrees
    SUB_89: SUB
    generic map (N => 7)  -- Using 7 bits for the angle subtraction
    port map (
        X        => ANGLE,              -- Input angle
        Y        => ANGLE_89,        -- Subtract 89 degrees
        DIFF  => DIFF_89             -- Output the difference
    );

    -- Subtract the input angle from 90 degrees
    SUB_90: SUB
    generic map (N => 7)  -- Using 7 bits for the angle subtraction
    port map (
        X        => ANGLE,             -- Input angle
        Y        => ANGLE_90,       -- Subtract 90 degrees
        DIFF  => DIFF_90            -- Output the difference
    );

    -- Interpolator to calculate sine value between two adjacent values in the LUT
    INTERPOLATOR: INTERP
    generic map (N => N)  
    port map (
        ANGLE_DIFF               => ANGLE_DIFF,                    -- Difference between angle and next LUT step
        SINE1                          => SINE1,                               -- Lower sine value
        SINE2                          => SINE2,                               -- Higher sine value
        RESULT                       => INTERPOLATED_SINE      -- Output: interpolated sine value
    );

    -- Process to determine the sine value or interpolate between two LUT values
    process(ANGLE, DIFF_89, DIFF_90)
    begin
        -- If the input angle is greater than or equal to 90 degrees
        if DIFF_90(6) = '0' then              -- Checking if the MSB (sign) is '0', meaning ANGLE >= 90
            SINE <= SINE_LUT(13);          -- Output sine value for 90 degrees
        elsif DIFF_89(6) = '0' then         -- If the input angle is greater than or equal to 89 degrees
            SINE <= SINE_LUT(12);          -- Output sine value for 89 degrees
        else
        
            -- For angles less than 89 degrees, select adjacent values from the LUT
            case ANGLE(6 downto 3) is
                when "0000" => 
                    SINE1 <= SINE_LUT(0);  -- sin(0)
                    SINE2 <= SINE_LUT(1);  -- sin(8)
                when "0001" => 
                    SINE1 <= SINE_LUT(1);  -- sin(8)
                    SINE2 <= SINE_LUT(2);  -- sin(16)
                when "0010" => 
                    SINE1 <= SINE_LUT(2);  -- sin(16)
                    SINE2 <= SINE_LUT(3);  -- sin(24)
                when "0011" => 
                    SINE1 <= SINE_LUT(3);  -- sin(24)
                    SINE2 <= SINE_LUT(4);  -- sin(32)
                when "0100" => 
                    SINE1 <= SINE_LUT(4);  -- sin(32)
                    SINE2 <= SINE_LUT(5);  -- sin(40)
                when "0101" => 
                    SINE1 <= SINE_LUT(5);  -- sin(40)
                    SINE2 <= SINE_LUT(6);  -- sin(48)
                when "0110" => 
                    SINE1 <= SINE_LUT(6);  -- sin(48)
                    SINE2 <= SINE_LUT(7);  -- sin(56)
                when "0111" => 
                    SINE1 <= SINE_LUT(7);  -- sin(56)
                    SINE2 <= SINE_LUT(8);  -- sin(64)
                when "1000" => 
                    SINE1 <= SINE_LUT(8);  -- sin(64)
                    SINE2 <= SINE_LUT(9);  -- sin(72)
                when "1001" => 
                    SINE1 <= SINE_LUT(9);  -- sin(72)
                    SINE2 <= SINE_LUT(10); -- sin(80)
                when "1010" => 
                    SINE1 <= SINE_LUT(10); -- sin(80)
                    SINE2 <= SINE_LUT(11); -- sin(88)
                when others => 
                    SINE1 <= SINE_LUT(11); -- sin(88)
                    SINE2 <= SINE_LUT(12); -- sin(89)
            end case;

            -- If the angle is a multiple of 8, no interpolation is needed
            if ANGLE(2 downto 0) = "000" then
                SINE <= SINE1;  -- Output the exact LUT value (SINE1)
            else
                -- Otherwise, perform interpolation between SINE1 and SINE2
                ANGLE_DIFF <= ANGLE(2 downto 0);  -- Extract the angle difference for interpolation
                SINE <= INTERPOLATED_SINE;  -- Output the interpolated sine value
            end if;
        end if;
    end process;

end RTL;
