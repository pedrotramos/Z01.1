-- Elementos de Sistemas
-- by Luciano Soares
-- comparador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity comparador16 is
   port(
	     a    : in STD_LOGIC_VECTOR(15 downto 0);
       zr   : out STD_LOGIC;
       ng   : out STD_LOGIC
   );
end comparador16;

architecture rtl of comparador16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin

  -- Implementação vem aqui!
  zr <= '1' when TO_INTEGER(signed(a)) = 0 else
  		'0';
  ng <= '1' when TO_INTEGER(signed(a)) < 0 else
  		'0';

end architecture;