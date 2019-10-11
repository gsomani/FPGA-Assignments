library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dec4bit_tb is
end dec4bit_tb;

architecture Behavioral of dec4bit_tb is

component dec4bit 
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B:STD_LOGIC_VECTOR (3 downto 0);
CONSTANT period : time := 50 ns;
CONSTANT input_bit_width : integer := 4 ;
CONSTANT max_input : integer := 15;

begin

uut: dec4bit port map(A,B);
process

begin

for i in 1 to max_input loop
	wait for period;
	A <= std_logic_vector(to_unsigned(i, input_bit_width));
	wait for period;
end loop;

wait;

end process;
end Behavioral;



