library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

--------------------------------------
-- INTERPOLATOR (INTERP)
--------------------------------------
entity INTERP is
    generic (
        N : positive            -- Number of bits for sine values
    );
    port (
        ANGLE_DIFF      : in  std_logic_vector(2 downto 0);            -- 3-bit angle difference input
        SINE1                 : in  std_logic_vector(N-1 downto 0);        -- First sine value
        SINE2                 : in  std_logic_vector(N-1 downto 0);        -- Second sine value
        RESULT              : out std_logic_vector(N-1 downto 0)       -- Interpolated result
    );
end entity INTERP;

architecture RTL of INTERP is
    -- SUB Component Declaration
    component SUB is
        generic (
            N : positive   -- Number of bits for the operands
        );
        Port (
            X            : in  std_logic_vector(N-1 downto 0);       -- Input: Minuend (X)
            Y            : in  std_logic_vector(N-1 downto 0);       -- Input: Subtrahend (Y)
            DIFF       : out std_logic_vector(N-1 downto 0)      -- Output: Difference (X - Y)
        );
    end component;

    -- Signal for SUB component
    signal SINE_DIFF : std_logic_vector(N-1 downto 0);

    begin
        -- Instantiate SUB component for subtraction
        SUB_INST: SUB
        generic map (
            N => N
        )
        port map (
            X => SINE2,
            Y => SINE1,
            DIFF => SINE_DIFF
        );

        --------
        -- interpolation process
        --------
        interpolation_process: process(ANGLE_DIFF, SINE1, SINE2, SINE_DIFF)
            variable SCALED_DIFF     : std_logic_vector(N-1 downto 0); -- scaled difference
            variable TEMP_SUM        : std_logic_vector(N-1 downto 0); -- temporary sum for scaling
            
            begin
            -- Use SINE_DIFF from SUB component
            
            case ANGLE_DIFF is                                                                       -- scale difference based on ANGLE_DIFF
                when "000" => 
                    SCALED_DIFF := (others => '0');                                             -- no scaling
                
                when "001" => 
                    SCALED_DIFF := SINE_DIFF;                                                  -- scale by 1
                
                when "010" => 
                    SCALED_DIFF := SINE_DIFF(N-2 downto 0) & '0';                -- scale by 2 (left shift)
                
                when "011" => 
                    ----------
                    -- Scale by 3 (1 + 2)
                    ----------
                    SCALED_DIFF := SINE_DIFF(N-2 downto 0) & '0';
                    TEMP_SUM := conv_std_logic_vector(
                        conv_integer(unsigned(SINE_DIFF)) + 
                        conv_integer(unsigned(SCALED_DIFF)), 
                        N
                    );
                    SCALED_DIFF := TEMP_SUM;
                
                when "100" => 
                    ----------
                    -- Scale by 4 (left shift twice)
                    ----------
                    SCALED_DIFF := SINE_DIFF(N-3 downto 0) & "00";
                
                when "101" => 
                    ----------
                    -- Scale by 5 (1 + 4)
                    ----------
                    SCALED_DIFF := SINE_DIFF(N-3 downto 0) & "00";
                    TEMP_SUM := conv_std_logic_vector(
                        conv_integer(unsigned(SINE_DIFF)) + 
                        conv_integer(unsigned(SCALED_DIFF)), 
                        N
                    );
                    SCALED_DIFF := TEMP_SUM;
                
                when "110" => 
                    ----------
                    -- Scale by 6 (2 + 4)
                    ----------
                    SCALED_DIFF := SINE_DIFF(N-2 downto 0) & '0';
                    TEMP_SUM := conv_std_logic_vector(
                        conv_integer(unsigned(SCALED_DIFF)) + 
                        conv_integer(unsigned(SINE_DIFF(N-3 downto 0) & "00")), 
                        N
                    );
                    SCALED_DIFF := TEMP_SUM;
                
                when "111" => 
                    ----------
                    -- Scale by 7 (1 + 2 + 4)
                    ----------
                    SCALED_DIFF := SINE_DIFF(N-2 downto 0) & '0';
                    TEMP_SUM := conv_std_logic_vector(
                        conv_integer(unsigned(SINE_DIFF)) + 
                        conv_integer(unsigned(SCALED_DIFF)), 
                        N
                    );
                    SCALED_DIFF := TEMP_SUM;
                    TEMP_SUM := conv_std_logic_vector(
                        conv_integer(unsigned(SCALED_DIFF)) + 
                        conv_integer(unsigned(SINE_DIFF(N-3 downto 0) & "00")), 
                        N
                    );
                    SCALED_DIFF := TEMP_SUM;
                
                when others => 
                    SCALED_DIFF := (others => '0');                         -- default case
            end case;
            
            ----------
            -- Divide by 8 (right shift by 3) and add to SINE1
            ----------
            TEMP_SUM := conv_std_logic_vector(
                conv_integer(unsigned(SINE1)) + 
                conv_integer(unsigned('0' & '0' & '0' & SCALED_DIFF(N-1 downto 3))), 
                N
            );
            
            RESULT <= TEMP_SUM;                                            -- assign result to output
        end process;
end architecture RTL;