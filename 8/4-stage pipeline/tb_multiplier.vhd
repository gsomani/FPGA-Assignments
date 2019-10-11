library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_multiplier is
end tb_multiplier;	

architecture behav of tb_multiplier is

component multiplier
port( input1:in signed(7 downto 0);
      input2:in signed(7 downto 0);	
      product: out signed(15 downto 0);
      clk: in std_logic	
);
end component;

signal mul_1,mul_2:signed(7 downto 0);
signal prod: signed(15 downto 0);
signal clk: std_logic;


constant period:time:= 20 ns;

begin
uut: multiplier port map (mul_1,mul_2,prod,clk);

process

begin

wait for 100 ns;

cloop: loop

clk <= '0';
wait for (period/2);
clk <= '1';
wait for (period/2);

end loop;

end process;
	
process

begin
wait for 100 ns;
for i in -128 to 127 loop
	for j in -128 to 127 loop		
		wait for period/2;
		mul_1<=to_signed(i,8);
		mul_2<=to_signed(j,8);
		wait for period/2;
	end loop;
end loop;   

wait;      

end process;

end behav;
