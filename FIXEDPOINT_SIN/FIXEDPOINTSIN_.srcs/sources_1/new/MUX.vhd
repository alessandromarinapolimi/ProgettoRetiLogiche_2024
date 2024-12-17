library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    generic (
        N : positive := 10; -- Numero di bit del valore della LUT
        M : positive := 4   -- Numero di selettori (2^M ingressi)
    );
    Port (
        SEL  : in  std_logic_vector(M-1 downto 0); -- Linee di selezione
        DATA : in  std_logic_vector((2**M)*N-1 downto 0); -- Valori concatenati della LUT
        OUTPUT : out std_logic_vector(N-1 downto 0) -- Uscita selezionata
    );
end entity MUX;

architecture RTL of MUX is
begin
    process(SEL, DATA)
        variable TEMP_OUTPUT : std_logic_vector(N-1 downto 0); -- Variabile per il risultato
    begin
        -- Inizializzazione
        TEMP_OUTPUT := (others => '0');
        
        -- Iterazione per selezionare il valore corretto
        for I in 0 to (2**M)-1 loop
            if SEL = std_logic_vector(to_unsigned(I, M)) then
                TEMP_OUTPUT := DATA((I+1)*N-1 downto I*N);
            end if;
        end loop;

        -- Assegna il risultato
        OUTPUT <= TEMP_OUTPUT;
    end process;
end architecture RTL;
