library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Ripple Carry Adder (RCA)
entity RCA is
    generic (
        N : positive;   -- N-bit width of the inputs 
        M : positive    -- M-bit width of the output
    );
    
    Port (
        A, B      : in  std_logic_vector(N-1 downto 0);     -- Inputs: N-bit vectors A and B
        CIN       : in  std_logic;                                           -- Input: Carry-in (CIN)
        SUM      : out std_logic_vector(M-1 downto 0);  -- Output: M-bit sum vector
        COUT    : out std_logic                                          -- Output: Final carry-out
    );
end RCA;

architecture RTL of RCA is
    signal C : std_logic_vector(M downto 0);                     -- Internal signal per i carry bits
    signal A_int, B_int : std_logic_vector(M-1 downto 0);
    signal dummy : std_logic;
    signal dummy_out : std_logic;                                         -- Segnale per l'output del secondo processo
    
begin
    process(A, B)
        variable temp : std_logic;
    begin
        temp := '0';
        for i in M to N-1 loop
            temp := temp or A(i) or B(i);
        end loop;
        dummy <= temp;
    end process;

    -- Process per "leggere" il segnale dummy
    process(dummy)
    begin
        dummy_out <= dummy;
    end process;

    -- Inizializza A_int e B_int
    A_int <= A(M-1 downto 0);
    B_int <= B(M-1 downto 0);
    
    -- Inizializza il primo carry con il carry-in (CIN)
    C(0) <= CIN;
    
    gen: for i in 0 to M-1 generate
        FA_inst: entity work.FA
            port map(
                X     => A_int(i),
                Y     => B_int(i),
                CIN   => C(i),
                SUM   => SUM(i),
                COUT  => C(i + 1)
            );
    end generate;
    
    -- Il carry-out finale viene assegnato a COUT
    COUT <= C(M) or dummy_out;  -- Usiamo dummy_out nell'assegnazione di COUT
end RTL;