library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC);
end comp4bit;

architecture dflow of comp4bit is

begin
    GT <= '1' when A(3) > B(3) else
          '0' when A(3) < B(3) else 
          '1' when A(2) > B(2) else
          '0' when A(2) < B(2) else 
          '1' when A(1) > B(1) else          
          '0' when A(1) < B(1) else 
          '1' when A(0) > B(0) else   
          '0' when (A(0) < B(0)) or (A(0) = B(0)) else
	  '-';				
end dflow;
