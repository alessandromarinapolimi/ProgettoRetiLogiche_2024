library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT is
    generic (
        N : positive 
    );
    Port (
        ANGLE : in std_logic_vector(6 downto 0);
        SINE : out std_logic_vector(N-1 downto 0)
    );
end LUT;

architecture RTL of LUT is
    type lut_type is array (0 to 13) of std_logic_vector(N-1 downto 0);
    constant SINE_LUT : lut_type := (
        "0000000000", -- sin(0)
        "0000100100", -- sin(8)
        "0001000111", -- sin(16)
        "0001101001", -- sin(24)
        "0010001011", -- sin(32)
        "0010101101", -- sin(40)
        "0011001111", -- sin(48)
        "0011101111", -- sin(56)
        "0100001111", -- sin(64)
        "0100101110", -- sin(72)
        "0101001101", -- sin(80)
        "0101101010", -- sin(88)
        "0101101011", -- sin(89)
        "0101101100"  -- sin(90)
    );

    component INTERP is
        generic (N : positive);
        Port(
            ANGLE : in std_logic_vector(6 downto 0);
            SINE1, SINE2 : in std_logic_vector(N-1 downto 0);
            INTERPOLATED_SINE : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal SINE1, SINE2 : std_logic_vector(N-1 downto 0);
    signal INTERPOLATED_SINE : std_logic_vector(N-1 downto 0);

    component SUB is
        generic (N : positive);
        Port(
            X, Y : in std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(N-1 downto 0)
        );
    end component;

    signal DIFF_89, DIFF_90 : std_logic_vector(6 downto 0);
    signal LUT_INDEX : std_logic_vector(3 downto 0);

begin
    INTERPOLATOR: INTERP
    generic map (N => N)
    port map (
        ANGLE => ANGLE,
        SINE1 => SINE1,
        SINE2 => SINE2,
        INTERPOLATED_SINE => INTERPOLATED_SINE
    );

    SUB_89: SUB
    generic map (N => 7)
    port map (
        X => ANGLE,
        Y => "1011001",  -- 89 in binario
        DIFF => DIFF_89
    );

    SUB_90: SUB
    generic map (N => 7)
    port map (
        X => ANGLE,
        Y => "1011010",  -- 90 in binario
        DIFF => DIFF_90
    );

    LUT_INDEX <= '0' & ANGLE(6 downto 4);

    process(ANGLE, DIFF_89, DIFF_90, LUT_INDEX, INTERPOLATED_SINE)
begin
    if DIFF_90(6) = '0' then  -- ANGLE >= 90
        SINE <= SINE_LUT(13);
    elsif DIFF_89(6) = '0' then  -- ANGLE >= 89
        SINE <= SINE_LUT(12);
    else
        -- Verifica se l'angolo è divisibile per 8
        if ANGLE(2 downto 0) = "000" then
            -- Se divisibile per 8, prendi il valore direttamente dalla LUT
            case LUT_INDEX is
                when "0000" => SINE <= SINE_LUT(0);
                when "0001" => SINE <= SINE_LUT(1);
                when "0010" => SINE <= SINE_LUT(2);
                when "0011" => SINE <= SINE_LUT(3);
                when "0100" => SINE <= SINE_LUT(4);
                when "0101" => SINE <= SINE_LUT(5);
                when "0110" => SINE <= SINE_LUT(6);
                when "0111" => SINE <= SINE_LUT(7);
                when "1000" => SINE <= SINE_LUT(8);
                when "1001" => SINE <= SINE_LUT(9);
                when "1010" => SINE <= SINE_LUT(10);
                when others => SINE <= SINE_LUT(11);
            end case;
        else
            -- Seleziona i valori di SINE1 e SINE2 dalla LUT usando un case statement
            case LUT_INDEX is
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
                when "1010" => 
                    SINE1 <= SINE_LUT(10); 
                    SINE2 <= SINE_LUT(11);
                when others => 
                    SINE1 <= SINE_LUT(11); 
                    SINE2 <= SINE_LUT(12);
            end case;
            
            -- Usa il risultato dell'interpolazione
            SINE <= INTERPOLATED_SINE;
        end if;
    end if;
end process;

end RTL;
