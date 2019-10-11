library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comp4bit_tb is
end comp4bit_tb;

architecture Behavioral of comp4bit_tb is

component comp4bit 
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           GT : out STD_LOGIC);
end component;

signal A,B:STD_LOGIC_VECTOR (3 downto 0);
signal GT:STD_LOGIC;
CONSTANT period : time := 50 ns;
CONSTANT input_bit_width : integer := 4 ;
CONSTANT max_input : integer := 15;

begin

uut: comp4bit port map(A,B,GT);
process

begin

for i in 0 to max_input loop
	for j in 0 to max_input loop
		wait for period;
		A <= std_logic_vector(to_unsigned(i, input_bit_width));
		B <= std_logic_vector(to_unsigned(j, input_bit_width));
		wait for period;
	end loop;
end loop;

wait;

end process;
end Behavioral;
