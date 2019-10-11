library ieee;
use ieee.std_logic_1164.all;

entity prior_enc is
port (  input: in std_logic_vector(15 downto 0);	
	output : out std_logic_vector(3 downto 0)  
      );
end prior_enc;

architecture struct of prior_enc is

signal H,cur:std_logic_vector(0 to 15);

begin
	cur(15)<=input(15); H(15)<=input(15); 
	g1:for i in 14 downto 0 generate
		H(i) <= not cur(i+1) and input(i);
		cur(i) <= cur(i+1) or input(i);
	end generate;
	output(0) <= H(14) or H(12) or H(10) or H(8) or H(6) or H(4) or H(2) or H(0);
	output(1) <= H(13) or H(12) or H(9) or H(8) or H(5) or H(4) or H(1) or H(0); 
	output(2) <= H(11) or H(10) or H(9) or H(8) or H(3) or H(2) or H(1) or H(0); 
	output(3) <= H(7) or H(6) or H(5) or H(4) or H(3) or H(2) or H(1) or H(0); 
end struct;



