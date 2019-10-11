library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity normalise is
port (  din : in std_logic_vector(15 downto 0);
        clk:in std_logic;
	   dout: out std_logic_vector(15 downto 0);
	   exp : out std_logic_vector (3 downto 0);
	   reset : in std_logic  	   
	);
end normalise;

architecture behav of normalise is

signal D_denormal,D_normal,d1,d2,d3:std_logic_vector(0 to 15);
signal z:std_logic_vector(3 downto 0);

component mux is
port (  sel : in std_logic;
        input: in std_logic_vector(1 downto 0);
	output : out std_logic  
      );
end component;

component prior_enc is
port (  input: in std_logic_vector(15 downto 0);
	output : out std_logic_vector(3 downto 0)  
      );
end component;


begin

e1: prior_enc port map(D_denormal, z);

a1:for i in 0 to 15 generate
	m1:mux port map(sel=>z(0),input(0)=>D_denormal(i),input(1)=>D_denormal((i+1)mod 16),output=>d1(i));
end generate;

a2:for i in 0 to 15 generate
	m2:mux port map(sel=>z(1),input(0)=>d1(i),input(1)=>d1((i+2) mod 16),output=>d2(i));
end generate;

a3:for i in 0 to 15 generate
	m3:mux port map(sel=>z(2),input(0)=>d2(i),input(1)=>d2((i+4) mod 16),output=>d3(i));
end generate;

a4:for i in 0 to 15 generate
	m4:mux port map(sel=>z(3),input(0)=>d3(i),input(1)=>d3((i+8)mod 16),output=>D_normal(i));
end generate;


p1:process(clk)
begin
    if(reset = '1') then
        D_denormal <= (others => '0');
	elsif(rising_edge(clk)) then
		D_denormal<=din;	
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
