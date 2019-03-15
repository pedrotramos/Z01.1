-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.
  signal c : STD_LOGIC_VECTOR(15 downto 0) := X"0000";
  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

begin
  -- Implementação vem aqui!


	ADDER0: FullAdder port map (a=>a(0), b=>b(0), c=>'0', soma=>q(0), vaium=>c(0));
	ADDER1: FullAdder port map (a=>a(1), b=>b(1), c=>c(0), soma=>q(1), vaium=>c(1));
	ADDER2: FullAdder port map (a=>a(2), b=>b(2), c=>c(1), soma=>q(2), vaium=>c(2));
	ADDER3: FullAdder port map (a=>a(3), b=>b(3), c=>c(2), soma=>q(3), vaium=>c(3));
	ADDER4: FullAdder port map (a=>a(4), b=>b(4), c=>c(3), soma=>q(4), vaium=>c(4));
	ADDER5: FullAdder port map (a=>a(5), b=>b(5), c=>c(4), soma=>q(5), vaium=>c(5));
	ADDER6: FullAdder port map (a=>a(6), b=>b(6), c=>c(5), soma=>q(6), vaium=>c(6));
	ADDER7: FullAdder port map (a=>a(7), b=>b(7), c=>c(6), soma=>q(7), vaium=>c(7));
	ADDER8: FullAdder port map (a=>a(8), b=>b(8), c=>c(7), soma=>q(8), vaium=>c(8));
	ADDER9: FullAdder port map (a=>a(9), b=>b(9), c=>c(8), soma=>q(9), vaium=>c(9));
	ADDER10: FullAdder port map (a=>a(10), b=>b(10), c=>c(9), soma=>q(10), vaium=>c(10));
	ADDER11: FullAdder port map (a=>a(11), b=>b(11), c=>c(10), soma=>q(11), vaium=>c(11));
	ADDER12: FullAdder port map (a=>a(12), b=>b(12), c=>c(11), soma=>q(12), vaium=>c(12));
	ADDER13: FullAdder port map (a=>a(13), b=>b(13), c=>c(12), soma=>q(13), vaium=>c(13));
	ADDER14: FullAdder port map (a=>a(14), b=>b(14), c=>c(13), soma=>q(14), vaium=>c(14));
	ADDER15: FullAdder port map (a=>a(15), b=>b(15), c=>c(14), soma=>q(15), vaium=>c(15));





end architecture;
