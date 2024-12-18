library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    generic (
        N : positive := 4   -- Numero di bit per input, valore predefinito 4
    );
    Port (
        DATA_IN   : in  std_logic_vector((2**N)-1 downto 0);  -- Input data bus
        SEL       : in  std_logic_vector(N-1 downto 0);       -- Selezione dell'input
        DATA_OUT  : out std_logic                             -- Output selezionato
    );
end entity MUX;

architecture RTL of MUX is
begin
    -- Processo per la selezione dell'output basato sui bit di selezione
    selection_process: process(DATA_IN, SEL)
        variable index : integer range 0 to (2**N)-1;
    begin
        -- Conversione manuale dei bit di selezione in un indice
        index := 0;
        for i in 0 to N-1 loop
            if SEL(i) = '1' then
                index := index + (2**i);
            end if;
        end loop;
        
        -- Selezione dell'output corrispondente
        DATA_OUT <= DATA_IN(index);
    end process selection_process;
end architecture RTL;