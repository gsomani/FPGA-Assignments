library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dec4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : out STD_LOGIC_VECTOR (3 downto 0));
end dec4bit;

architecture dflow of dec4bit is

begin
	B <= std_logic_vector(unsigned(A) - 1); 
end dflow;
