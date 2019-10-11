library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_multiplier is
end tb_multiplier;	

architecture behav of tb_multiplier is

component multiplier
port( a:in signed(7 downto 0);
      b:in signed(7 downto 0);	
      product: out signed(15 downto 0)
);
end component;

signal mul_1,mul_2:signed(7 downto 0);
signal prod: signed(15 downto 0);


constant period:time:= 10 ns;

begin
uut: multiplier port map (mul_1,mul_2,prod);
	
process

begin
wait for 100 ns;

for i in -128 to 127 loop
	for j in -128 to 127 loop		
		wait for period;
		mul_1<=to_signed(i,8);
		mul_2<=to_signed(j,8);
		wait for period;
	end loop;
end loop;   

wait;      

end process;

end behav;
