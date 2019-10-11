library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comp2bit_tb is
end comp2bit_tb;

architecture Behavioral of comp2bit_tb is

component comp2bit 
Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           EQ : out STD_LOGIC;
           GT : out STD_LOGIC;
           LT : out STD_LOGIC);
end component;

signal A,B:STD_LOGIC_VECTOR (1 downto 0);
signal EQ,GT,LT:STD_LOGIC;
CONSTANT period : time := 50 ns;
CONSTANT input_bit_width : integer := 2 ;
CONSTANT max_input : integer := 3;

begin

uut: comp2bit port map(A,B,EQ,GT,LT);
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
