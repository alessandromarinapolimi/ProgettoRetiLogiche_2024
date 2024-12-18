library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity B2D_CONVERTER is
    Port (
        BINARY_IN : in  std_logic_vector(3 downto 0); -- 4-bit binary input
        DEC_OUT   : out std_logic_vector(3 downto 0)  -- 4-bit decimal output (index)
    );
end entity B2D_CONVERTER;

architecture RTL of B2D_CONVERTER is
begin
    process(BINARY_IN)
    begin
        -- Conversione manuale di binario a indice "decimale"
        case BINARY_IN is
            when "0000" => DEC_OUT <= "0000"; -- 0
            when "0001" => DEC_OUT <= "0001"; -- 1
            when "0010" => DEC_OUT <= "0010"; -- 2
            when "0011" => DEC_OUT <= "0011"; -- 3
            when "0100" => DEC_OUT <= "0100"; -- 4
            when "0101" => DEC_OUT <= "0101"; -- 5
            when "0110" => DEC_OUT <= "0110"; -- 6
            when "0111" => DEC_OUT <= "0111"; -- 7
            when "1000" => DEC_OUT <= "1000"; -- 8
            when "1001" => DEC_OUT <= "1001"; -- 9
            when others => DEC_OUT <= "1010"; -- Default per 10 (safety case)
        end case;
    end process;
end architecture RTL;
