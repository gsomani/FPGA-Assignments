library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity booth_recoder is
port(   b:in signed(2 downto 0);
	a:in signed(9 downto 0);
	neg_a : in signed(9 downto 0);
	two_a:in signed(9 downto 0);
	neg_2a : in signed(9 downto 0);
	partial_product:out signed (9 downto 0)
);
end booth_recoder;	

architecture struct of booth_recoder is

begin
	with b select
		partial_product<=a when "001" | "010",
				two_a when "011",
				neg_a when "101" | "110", 
				neg_2a when "100",
				(others=>'0') when others;  
end struct;
