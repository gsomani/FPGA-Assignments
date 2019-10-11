library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slow_clk is
port ( clk: in std_logic;
clk_slow: out std_logic);
end slow_clk;

architecture arch of slow_clk is

constant counter_width:integer:= 21;
signal counter:unsigned(counter_width-1 downto 0):=(others=>'0');

begin

clk_slow<=counter(counter_width-1);

counter<=counter+1 when rising_edge(clk);

end arch;
