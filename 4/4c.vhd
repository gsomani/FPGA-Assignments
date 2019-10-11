library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC);
end comp4bit;

architecture Behavioral of comp4bit is

begin
process(A,B)
	begin
        GT <= '0';
    	if A(3) = B(3) then
			if A(2) = B(2) then
            		if A(1) = B(1) then
                		if A(0) = B(0) then GT <= '0';
                		elsif A(0) > B(0) then GT <= '1';end if;
            		elsif A(1) > B(1) then GT <= '1';end if;
          	elsif A(2) > B(2) then GT <= '1';end if;
        elsif A(3) > B(3) then GT <= '1';end if;                  
    end process;  
end Behavioral;
