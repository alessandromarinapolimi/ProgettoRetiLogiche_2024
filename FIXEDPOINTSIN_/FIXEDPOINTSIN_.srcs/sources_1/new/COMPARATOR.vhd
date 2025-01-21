library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- N-bit Comparator (COMPARATOR)
--------------------------------------
entity COMPARATOR is
    generic (
        N : positive                                                -- Number of bits for comparison
    );
    Port (
        A              : in  std_logic_vector(N-1 downto 0);        -- First input operand
        B              : in  std_logic_vector(N-1 downto 0);        -- Second input operand
        GT             : out std_logic                              -- Output true if A > B, false otherwise
    );
end entity COMPARATOR;

architecture RTL of COMPARATOR is
begin
    process(A, B)
    begin
        GT <= '0';  
        
        for i in N-1 downto 0 loop
            if A(i) = '1' and B(i) = '0' then
                GT <= '1';
                exit;
            elsif A(i) = '0' and B(i) = '1' then
                GT <= '0';
                exit;
            end if;
        end loop;
    end process;
    
end architecture RTL;