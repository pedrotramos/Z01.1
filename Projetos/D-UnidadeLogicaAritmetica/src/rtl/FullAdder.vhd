-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  signal signal1, signal2, signal3 : STD_LOGIC;

begin
  -- Implementação vem aqui!

  signal1 <= a xor b;
  signal2 <= signal1 and c;
  signal3 <= a and b;

  soma <= signal1 xor c;
  vaium <= signal2 or signal3;

end architecture;
