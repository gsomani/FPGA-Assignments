library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
port( a:in signed(7 downto 0);
      b:in signed(7 downto 0);	
      product: out signed(15 downto 0)
);
end multiplier;	

architecture struct of multiplier is

signal a_10bit,neg_a10bit,two_a10bit,neg2a_10bit,p1,p2,p3,p4:signed(9 downto 0);
signal c:signed(8 downto 0);

component booth_recoder
port(   b:in signed(2 downto 0);
	a:in signed(9 downto 0);
	neg_a : in signed(9 downto 0);
	two_a:in signed(9 downto 0);
	neg_2a : in signed(9 downto 0);
	partial_product:out signed (9 downto 0)
);
end component;

begin
	a_10bit <= a(7) & a(7) & a(7 downto 0);
	neg_a10bit <= -a_10bit;
	two_a10bit <= a(7) & a(7 downto 0) & '0';
	neg2a_10bit <= neg_a10bit(8 downto 0) & '0';
	c<=b(7 downto 0) & '0';
	r1:booth_recoder port map( c( 2 downto 0 ) , a_10bit,neg_a10bit,two_a10bit,neg2a_10bit,p1);
	r2:booth_recoder port map( c( 4 downto 2 ), a_10bit,neg_a10bit,two_a10bit,neg2a_10bit,p2);
	r3:booth_recoder port map( c( 6 downto 4 ), a_10bit,neg_a10bit,two_a10bit,neg2a_10bit,p3);
	r4:booth_recoder port map( c( 8 downto 6 ), a_10bit,neg_a10bit,two_a10bit,neg2a_10bit,p4);
	
	product <= p1 + (p2 & "00") + (p3 & "0000") + (p4 & "000000");

end struct;
