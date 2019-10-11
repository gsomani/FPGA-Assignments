library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
port ( slow_clk,key: in std_logic;
key_pressed : out std_logic);
end debouncer;

architecture arch of debouncer is

signal last_key_debounce,cur_key_debounce:std_logic;

begin

last_key_debounce<=cur_key_debounce when rising_edge(slow_clk);
cur_key_debounce<=key when rising_edge(slow_clk);

key_pressed<='1' when (last_key_debounce='0' and cur_key_debounce='1') else 
             '0';

end arch;
