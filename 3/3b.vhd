library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2bit is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           EQ : out STD_LOGIC;
           GT : out STD_LOGIC;
           LT : out STD_LOGIC);
end comp2bit;

architecture Behavioral of comp2bit is

begin  

process(A,B)    

begin   
    case (A & B) is
             when "0000" | "0101" | "1010" | "1111" => EQ <='1';GT <='0';LT <='0';
             when "1100" | "1101" | "1110" | "1000" | "1001" | "0100" => EQ <='0';GT <='1';LT <='0';
             when "0011" | "0111" | "1011" | "0010" | "0110" | "0001" => EQ <='0';GT <='0';LT <='1';
             when others => EQ <='-';GT <='-';LT <='-';
    end case;
end process;                       

end Behavioral;

