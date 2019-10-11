library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           EQ : out STD_LOGIC;
           GT : out STD_LOGIC;
           LT : out STD_LOGIC);
end comp2bit;

architecture dflow of comp2bit is

signal output:std_logic_vector(0 to 2);

begin    
    with (A & B) select
        output <= "100" when "0000" | "0101" | "1010" | "1111",
                  "010" when "1100" | "1101" | "1110" | "1000" | "1001" | "0100",
                  "001" when "0011" | "0111" | "1011" | "0010" | "0110" | "0001",
                  "---" when others;        
    EQ <= output(0);
    GT <= output(1);
    LT <= output(2);                      
end dflow;

