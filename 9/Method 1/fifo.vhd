library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fifo is
Port ( 
     clk,srst_key,write_key,read_key : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    count_odd,read_index_odd: out STD_LOGIC;
    full,empty,srst_led,write_led,read_led: out std_logic
     );
end fifo;

architecture Behavioral of fifo is

constant data_even:std_logic_vector(7 downto 0):=X"55";
constant data_odd:std_logic_vector(7 downto 0):=X"AA";
signal wr_en,rd_en,slow_clock,srst,full_fifo,empty_fifo: STD_LOGIC;
signal count_fifo_odd_parity:std_logic:='0';
signal read_index_odd_parity:std_logic:='0';
signal din : STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT fifo_generator_0
  PORT (
    clk,srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en,rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full,empty : OUT STD_LOGIC
  );
END COMPONENT;

component debouncer is
port ( clk,key: in std_logic;
key_pressed : out std_logic);
end component;

begin

wr_key : debouncer
  PORT MAP (
    clk => clk,
    key => write_key,
    key_pressed => wr_en
  );
  
rd_key : debouncer
  PORT MAP (
    clk => clk,
    key => read_key,
    key_pressed => rd_en
  );
  
rst_key : debouncer
  PORT MAP (
    clk => clk,
    key => srst_key,
    key_pressed => srst
  );

fifo_gen : fifo_generator_0
  PORT MAP (
    clk => clk,
    srst => srst,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full_fifo,
    empty => empty_fifo
  );

srst_led<=srst;read_led<=rd_en;write_led<=wr_en;
    
full<=full_fifo;
empty<=empty_fifo;
count_odd<=count_fifo_odd_parity;
read_index_odd<=read_index_odd_parity;

process(clk)

begin
    if(rising_edge(clk)) then
        if(wr_en='1' and full_fifo='0') then
            count_fifo_odd_parity<=not(count_fifo_odd_parity);
        elsif (rd_en='1'and empty_fifo='0') then
            read_index_odd_parity<=not(read_index_odd_parity);
            count_fifo_odd_parity<=not(count_fifo_odd_parity);
        elsif (srst='1') then
             count_fifo_odd_parity<='0';
             read_index_odd_parity<='0';
        end if;
    end if;      
end process;

process(clk)

begin
    if(rising_edge(clk)) then
        if(count_fifo_odd_parity='1') then
            din<=data_odd;
        else
            din<=data_even;
        end if;        
    end if;
end process;

end Behavioral;
