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

    component SUB is
        generic (N,M : positive);
        Port (
            X    : in  std_logic_vector(N-1 downto 0);
            Y    : in  std_logic_vector(N-1 downto 0);
            DIFF : out std_logic_vector(M-1 downto 0)
        );
    end component;

    component RCA is
        generic (N,M : positive);
        Port (
            A, B : in  std_logic_vector(N-1 downto 0);
            CIN  : in  std_logic;
            SUM  : out std_logic_vector(N-1 downto 0);
            COUT : out std_logic
        );
    end component;

-- Update the process to use an intermediate signal
--signal SINE_RESULT : std_logic_vector(N-1 downto 0);

 -- Costanti
    constant ANGLE_90  : std_logic_vector(M-1 downto 0) := "001011010";  -- 90 gradi
    constant ANGLE_180 : std_logic_vector(M-1 downto 0) := "010110100";  -- 180 gradi
    constant ANGLE_270 : std_logic_vector(M-1 downto 0) := "100001110";  -- 270 gradi
    constant ANGLE_360 : std_logic_vector(M-1 downto 0) := "101101000";  -- 360 gradi

    -- Segnali
    signal ANGLE_ADJUSTED : std_logic_vector(6 downto 0);
    signal ANGLE_LUT : std_logic_vector(6 downto 0);
    signal SINE_TEMP : std_logic_vector(N-1 downto 0);
    signal SINE_NEG : std_logic;
    signal SUB_RESULT1, SUB_RESULT2,SUB_RESULT3 : std_logic_vector(6 downto 0);
    signal SINE_NEG_TEMP : std_logic_vector(N-1 downto 0);
    signal ONE_N : std_logic_vector(N-1 downto 0) := (0 => '1', others => '0');
    signal RCA_RESULT : std_logic_vector(N-1 downto 0);


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
        elsif rising_edge(CLK) then
            if not GREATER_THAN(ANGLE, ANGLE_90) then
                -- Primo quadrante: 0-90 gradi
                ANGLE_ADJUSTED <= ANGLE(6 downto 0);
                SINE_NEG <= '0';
            elsif not GREATER_THAN(ANGLE, ANGLE_180) then
                -- Secondo quadrante: 91-180 gradi
                -- sin(θ) = sin(180° - θ)
                ANGLE_ADJUSTED <= SUB_RESULT1(6 downto 0);
                SINE_NEG <= '0';
            elsif not GREATER_THAN(ANGLE, ANGLE_270) then
                -- Terzo quadrante: 181-270 gradi
                -- sin(θ) = -sin(θ - 180°)
                ANGLE_ADJUSTED <= SUB_RESULT2(6 downto 0);
                SINE_NEG <= '1';
            else
                -- Quarto quadrante: 271-359 gradi
                -- sin(θ) = -sin(360° - θ)
                ANGLE_ADJUSTED <= SUB_RESULT3(6 downto 0);
                SINE_NEG <= '1';
            end if;
        end if;
    end process;

    -- Sottrazione per il secondo quadrante (180° - θ)
    SUB_INST1: SUB
    generic map (N => M, M => M-2)
    port map (
        X    => ANGLE_180,
        Y    => ANGLE,
        DIFF => SUB_RESULT1
    );

    -- Sottrazione per il terzo quadrante (θ - 180°)
    SUB_INST2: SUB
    generic map (N => M, M => M-2)
    port map (
        X    => ANGLE,
        Y    => ANGLE_180,
        DIFF => SUB_RESULT2
    );

    -- Sottrazione per il quarto quadrante (360° - θ)
    SUB_INST3: SUB
    generic map (N => M, M => M-2)
    port map (
        X    => ANGLE_360,
        Y    => ANGLE,
        DIFF => SUB_RESULT3
    );

    -- Assegna i 7 bit meno significativi di ANGLE_ADJUSTED a ANGLE_LUT
    ANGLE_LUT <= ANGLE_ADJUSTED(6 downto 0);

    -- Istanza LUT
    LUT_INST: LUT
    generic map (N => N)
    port map (
        ANGLE => ANGLE_LUT,
        SINE => SINE_TEMP
    );

    -- Calcolo del complemento a due per valori negativi del seno
    SINE_NEG_TEMP <= not SINE_TEMP;
    

RCA_INST: RCA
generic map (N => N,M=>N)
port map (
    A    => SINE_NEG_TEMP,
    B    => ONE_N,
    CIN  => '0',
    SUM  => RCA_RESULT,
    COUT => open
);

process(SINE_NEG, SINE_TEMP, RCA_RESULT)
begin
    if SINE_NEG = '0' then
        SINE <= SINE_TEMP;
    else
        SINE <= RCA_RESULT;
    end if;
end process;


end structural;