--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		SW      : in  std_logic_vector(9 downto 0);
		HEX0    : out std_logic_vector(6 downto 0); -- 7seg0
		HEX1    : out std_logic_vector(6 downto 0); -- 7seg1
		HEX2    : out std_logic_vector(6 downto 0); -- 7seg2
		LEDR    : out std_logic_vector(9 downto 0)
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is

--------------
-- signals
--------------

---------------
-- implementacao
---------------
begin
 
	HEX0 <= "0111111" when TO_INTEGER(unsigned(SW)) >= 1000 else
			  "1000000" when TO_INTEGER(unsigned(SW)) rem 10 = 0 else
			  "1111001" when TO_INTEGER(unsigned(SW)) rem 10 = 1 else
			  "0100100" when TO_INTEGER(unsigned(SW)) rem 10 = 2 else
			  "0110000" when TO_INTEGER(unsigned(SW)) rem 10 = 3 else
			  "0011001" when TO_INTEGER(unsigned(SW)) rem 10 = 4 else
			  "0010010" when TO_INTEGER(unsigned(SW)) rem 10 = 5 else
			  "0000010" when TO_INTEGER(unsigned(SW)) rem 10 = 6 else
			  "1111000" when TO_INTEGER(unsigned(SW)) rem 10 = 7 else
			  "0000000" when TO_INTEGER(unsigned(SW)) rem 10 = 8 else
			  "0011000";
			  		  
			  
	HEX1 <= "0111111" when TO_INTEGER(unsigned(SW)) >= 1000 else
			  "1000000" when TO_INTEGER(unsigned(SW)) rem 100 < 10 else
			  "1111001" when TO_INTEGER(unsigned(SW)) rem 100 < 20 else
			  "0100100" when TO_INTEGER(unsigned(SW)) rem 100 < 30 else
			  "0110000" when TO_INTEGER(unsigned(SW)) rem 100 < 40 else
			  "0011001" when TO_INTEGER(unsigned(SW)) rem 100 < 50 else
			  "0010010" when TO_INTEGER(unsigned(SW)) rem 100 < 60 else
			  "0000010" when TO_INTEGER(unsigned(SW)) rem 100 < 70 else
			  "1111000" when TO_INTEGER(unsigned(SW)) rem 100 < 80 else
			  "0000000" when TO_INTEGER(unsigned(SW)) rem 100 < 90 else
			  "0011000";
			  
	HEX2 <= "1000000" when TO_INTEGER(unsigned(SW)) < 100 else
			  "1111001" when TO_INTEGER(unsigned(SW)) < 200 else
			  "0100100" when TO_INTEGER(unsigned(SW)) < 300 else
			  "0110000" when TO_INTEGER(unsigned(SW)) < 400 else
			  "0011001" when TO_INTEGER(unsigned(SW)) < 500 else
			  "0010010" when TO_INTEGER(unsigned(SW)) < 600 else
			  "0000010" when TO_INTEGER(unsigned(SW)) < 700 else
			  "1111000" when TO_INTEGER(unsigned(SW)) < 800 else
			  "0000000" when TO_INTEGER(unsigned(SW)) < 900 else
			  "0011000" when TO_INTEGER(unsigned(SW)) < 1000 else
			  "0111111";

end rtl;
