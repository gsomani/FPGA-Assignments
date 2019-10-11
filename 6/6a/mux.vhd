library ieee;
use ieee.std_logic_1164.all;

entity mux is
port (  sel : in std_logic;
        input: in std_logic_vector(1 downto 0);
	output : out std_logic  
      );
end mux;

architecture struct of mux is

begin
	output<=(input(1) and sel) or (input(0) and not(sel)); 
end struct;

