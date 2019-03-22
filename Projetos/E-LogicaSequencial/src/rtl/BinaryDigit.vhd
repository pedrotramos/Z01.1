-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture rtl of BinaryDigit is

component FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic);
end component;

component Mux2Way is
	port(
		a:   in  STD_LOGIC;
		b:   in  STD_LOGIC;
		sel: in  STD_LOGIC;
		q:   out STD_LOGIC);
end component;

signal muxout, outd, clear, preset: std_logic;

begin

Mux: Mux2Way port map (
		a => outd,
		b => input,
		sel => load,
		q => muxout);
			
FlipFlop: FlipFlopD port map (
		clock => clock,
		d => muxout,
		clear => clear,
		preset => preset,
		q => outd);
					
output <= outd;

end architecture;
