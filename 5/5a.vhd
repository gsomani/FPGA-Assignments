library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : out STD_LOGIC_VECTOR (3 downto 0));
end dec4bit;

architecture struct of dec4bit is

signal carry:STD_LOGIC_VECTOR (0 to 3);

begin
    B(0)<= not A(0);
    carry(0)<= '1';
    dec: for i in 1 to 3 generate
         carry(i)<= not A(i-1)  and  carry(i-1);
         B(i)<= A(i) xor carry(i);   
    end generate;    
end struct;

