library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity normalise is
port (  din : in std_logic_vector(15 downto 0);
        clk: in std_logic;
	   dout: out std_logic_vector(15 downto 0);
	   exp : out std_logic_vector(3 downto 0);
	   reset : in std_logic     	   
	);
end normalise;

architecture behav of normalise is

signal D_denormal,D_normal:std_logic_vector(0 to 15);
signal z : std_logic_vector (3 downto 0);

begin

p1:process(clk)
begin
    if(reset = '1') then
        D_denormal <= (others => '0');
	elsif(rising_edge(clk)) then
		D_denormal<=din;	
	end if;
end process;



p2:process(D_denormal)
begin

D_normal<=D_denormal;z<=(others=>'0');
if(D_denormal(0)='0') then
    for i in 1 to 15 loop
	   if(D_denormal(i)='1') 
	   then z<= std_logic_vector(to_unsigned(i,4));
	   D_normal<= D_denormal(i to 15) & D_denormal(0 to i-1);
	   exit;
	end if;
end loop; 
end if;

end process;

p3:process(clk)
begin
    if(reset = '1') then
        dout <= (others => '0');
        exp <= (others => '0');
	elsif(rising_edge(clk)) then
		dout<=D_normal;
		exp<=z;
	end if;
end process;


end behav;

