library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity normalise is
port (  din : in std_logic_vector(15 downto 0);
        clk:in std_logic;
	   dout: out std_logic_vector(15 downto 0);
	   exp : out std_logic_vector (3 downto 0);
	   reset: in std_logic	   
	);
end normalise;

architecture behav of normalise is

signal D_denormal,D_normal:std_logic_vector(15 downto 0);
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
    if(D_denormal(15)='1')    then D_normal<=D_denormal(15 downto 0); z<="0000";
    elsif(D_denormal(14)='1') then D_normal<=D_denormal(14 downto 0) & "0";  z<="0001";
    elsif(D_denormal(13)='1') then D_normal<=D_denormal(13 downto 0) & "00";  z<="0010";
    elsif(D_denormal(12)='1') then D_normal<=D_denormal(12 downto 0) & "000";  z<="0011";
    elsif(D_denormal(11)='1') then D_normal<=D_denormal(11 downto 0) & "0000";  z<="0100";
    elsif(D_denormal(10)='1') then D_normal<=D_denormal(10 downto 0) & "00000";  z<="0101";
    elsif(D_denormal(9)='1')  then D_normal<=D_denormal(9 downto 0)  & "000000";  z<="0110";
    elsif(D_denormal(8)='1')  then D_normal<=D_denormal(8 downto 0)  & "0000000";  z<="0111";
    elsif(D_denormal(7)='1')  then D_normal<=D_denormal(7 downto 0)  & "00000000";  z<="1000";
    elsif(D_denormal(6)='1')  then D_normal<=D_denormal(6 downto 0)  & "000000000";  z<="1001";
    elsif(D_denormal(5)='1')  then D_normal<=D_denormal(5 downto 0)  & "0000000000";  z<="1010";
    elsif(D_denormal(4)='1')  then D_normal<=D_denormal(4 downto 0)  & "00000000000"; z<="1011";
    elsif(D_denormal(3)='1')  then D_normal<=D_denormal(3 downto 0)  & "000000000000"; z<="1100";
    elsif(D_denormal(2)='1')  then D_normal<=D_denormal(2 downto 0)  & "0000000000000"; z<="1101";
    elsif(D_denormal(1)='1')  then D_normal<=D_denormal(1 downto 0)  & "00000000000000"; z<="1110";
    elsif(D_denormal(0)='1')  then D_normal<=D_denormal(0)           & "000000000000000"; z<="1111";	
    else D_normal<=D_denormal;z<=(others=>'0');
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
