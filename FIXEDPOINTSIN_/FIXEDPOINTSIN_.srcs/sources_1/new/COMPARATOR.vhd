library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--------------------------------------
-- N-bit Comparator (COMPARATOR)
--------------------------------------
entity COMPARATOR is
    generic (
        N : positive                                                                  -- Number of bits for comparison
    );
    Port (
        A              : in  std_logic_vector(N-1 downto 0);        -- First input operand
        B              : in  std_logic_vector(N-1 downto 0);        -- Second input operand
        GT            : out boolean                                               -- Output true if A > B, false otherwise
    );
end entity COMPARATOR;

architecture RTL of COMPARATOR is
begin
    process(A, B)
    begin
        GT <= false;  
        
        for i in N-1 downto 0 loop
            if A(i) = '1' and B(i) = '0' then
                GT <= true;
                exit;
            elsif A(i) = '0' and B(i) = '1' then
                GT <= false;
                exit;
            end if;
        end loop;
    end process;
    
end architecture RTL;