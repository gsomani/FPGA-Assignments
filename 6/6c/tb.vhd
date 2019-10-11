library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_normalise is
end tb_normalise;

architecture Behavioral of tb_normalise is

constant period: time := 20 ns;
constant setup: time :=  3 ns;

component normalise is
port ( 	din : in std_logic_vector(15 downto 0);
	clk: in std_logic;
	dout: out std_logic_vector(15 downto 0);
	exp : out std_logic_vector (3 downto 0);
	reset : in std_logic
	);
end component;

signal tb_data_inp : STD_LOGIC_VECTOR (15 downto 0);
signal data_out : STD_LOGIC_VECTOR (15 downto 0);
signal exp : std_logic_vector (3 downto 0);
signal clk,reset:std_logic;

begin

uut: normalise port map  (tb_data_inp,clk,data_out,exp,reset);

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
reset<='1';
wait for 100 ns;
reset<='0';
wait for period/2-setup;
tb_data_inp <= "1011010010000111";
wait for period;
tb_data_inp <= "0111010010000111";
wait for period;
tb_data_inp <= "0011010010000111";
wait for period;
tb_data_inp <= "0001010010000111";
wait for period;

tb_data_inp <= "0000110010000111";
wait for period;
tb_data_inp <= "0000010010000111";
wait for period;
tb_data_inp <= "0000001010000111";
wait for period;
tb_data_inp <= "0000000110000111";
wait for period;

tb_data_inp <= "0000000010000111";
wait for period;
tb_data_inp <= "0000000001000111";
wait for period;
tb_data_inp <= "0000000000100111";
wait for period;
tb_data_inp <= "0000000000010111";
wait for period;
 
tb_data_inp <= "0000000000001111";
wait for period;
tb_data_inp <= "0000000000000111";
wait for period;
tb_data_inp <= "0000000000000011";
wait for period;
tb_data_inp <= "0000000000000001";
wait for period;

tb_data_inp <= "0000000000000000";
wait for period;
    
wait;

end process;

end Behavioral;
