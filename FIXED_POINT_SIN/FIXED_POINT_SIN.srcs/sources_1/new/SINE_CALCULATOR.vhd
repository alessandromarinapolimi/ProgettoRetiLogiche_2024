library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SINE_CALCULATOR is
    generic (
        N : positive := 10;  -- Numero di bit per i valori del seno
        M : positive := 9    -- Numero di bit per l'angolo di input
    );
    Port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        ANGLE : in  std_logic_vector(M-1 downto 0);
        SINE  : out std_logic_vector(N-1 downto 0)
    );
end SINE_CALCULATOR;

architecture structural of SINE_CALCULATOR is
    component LUT is
        generic (N : positive);
        Port (
            ANGLE : in  std_logic_vector(6 downto 0);
            SINE  : out std_logic_vector(N-1 downto 0)
        );
    end component;

    -- Costanti
    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := "001011010";  -- 90 gradi
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := "010110100";  -- 180 gradi
    constant ANGLE_270 : std_logic_vector(M-1 downto 0) := "100001110";  -- 270 gradi
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := "101101000";  -- 360 gradi

    -- Segnali
    signal ANGLE_ADJUSTED : std_logic_vector(M-1 downto 0);
    signal ANGLE_LUT : std_logic_vector(6 downto 0);
    signal SINE_TEMP : std_logic_vector(N-1 downto 0);
    signal SINE_NEG : std_logic;
    signal QUADRANT : std_logic_vector(1 downto 0);
    

    -- Funzione per confrontare due std_logic_vector
    function GREATER_THAN(A, B: std_logic_vector) return boolean is
    begin
        for I in A'range loop
            if A(I) = '1' and B(I) = '0' then
                return true;
            elsif A(I) = '0' and B(I) = '1' then
                return false;
            end if;
        end loop;
        return false;
    end function;

begin
    process(CLK, RESET)
    begin
        if RESET = '1' then
            ANGLE_ADJUSTED <= (others => '0');
            SINE_NEG <= '0';
            QUADRANT <= "00";
        elsif rising_edge(CLK) then
            if not GREATER_THAN(ANGLE, ANGLE_90) then
                -- Primo quadrante: 0-90 gradi
                ANGLE_ADJUSTED <= ANGLE;
                SINE_NEG <= '0';
                QUADRANT <= "00";
            elsif not GREATER_THAN(ANGLE, ANGLE_180) then
                -- Secondo quadrante: 91-180 gradi
                ANGLE_ADJUSTED <= ANGLE_180 - ANGLE;
                SINE_NEG <= '0';
                QUADRANT <= "01";
            elsif not GREATER_THAN(ANGLE, ANGLE_270) then
                -- Terzo quadrante: 181-270 gradi
                ANGLE_ADJUSTED <= ANGLE - ANGLE_180;
                SINE_NEG <= '1';
                QUADRANT <= "10";
            else
                -- Quarto quadrante: 271-359 gradi
                ANGLE_ADJUSTED <= ANGLE_360 - ANGLE;  -- Correzione qui
                SINE_NEG <= '1';
                QUADRANT <= "11";
            end if;
        end if;
    end process;

    -- Assegna i 7 bit meno significativi di ANGLE_ADJUSTED a ANGLE_LUT
    ANGLE_LUT <= ANGLE_ADJUSTED(6 downto 0);

    -- Istanza LUT
    LUT_INST: LUT
    generic map (N => N)
    port map (
        ANGLE => ANGLE_LUT,
        SINE => SINE_TEMP
    );

    -- Gestione corretta del segno
    process(SINE_NEG, SINE_TEMP)
    begin
        if SINE_NEG = '1' then
            -- Invertiamo tutti i bit e aggiungiamo 1 per ottenere il complemento a due negativo
            SINE <= (not SINE_TEMP) + 1;
        else
            SINE <= SINE_TEMP;
        end if;
    end process;

end structural;