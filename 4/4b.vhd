library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC);
end comp4bit;

architecture dflow of comp4bit is

signal S:STD_LOGIC_VECTOR (0 to 3);       

begin
    S(0) <= (not B(3) and A(3));
    S(1) <= not (A(3) xor B(3))     and     (A(2)  and   not B(2));
    S(2) <= not (A(3) xor B(3))     and     not (A(2) xor B(2))     and     (A(1)  and   not B(1));
    S(3) <= not (A(3) xor B(3))     and     not (A(2) xor B(2))     and     not (A(1) xor B(1))     and     (A(0)  and   not B(0));
    GT <= S(0) or S(1) or S(2) or S(3);  
end dflow;
