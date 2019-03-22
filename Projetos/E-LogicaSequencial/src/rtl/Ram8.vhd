-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of ram8 is

component Mux8Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			e:   in  STD_LOGIC_VECTOR(15 downto 0);
			f:   in  STD_LOGIC_VECTOR(15 downto 0);
			g:   in  STD_LOGIC_VECTOR(15 downto 0);
			h:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;

component DMux8Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
end component;

component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal q0, q1, q2, q3, q4, q5, q6, q7: STD_LOGIC;
signal r0, r1, r2, r3, r4, r5, r6, r7: STD_LOGIC_VECTOR(15 downto 0);

begin

Dmux: DMux8Way port map (
	a => load,
	sel => address,
	q0 => q0,
	q1 => q1, 
	q2 => q2, 
	q3 => q3,
	q4 => q4,
	q5 => q5,
	q6 => q6,
	q7 => q7);

Reg0: Register16 port map(
	clock => clock,
	input => input,
	load => q0,
	output => r0);

Reg1: Register16 port map(
	clock => clock,
	input => input,
	load => q1,
	output => r1);
	
Reg2: Register16 port map(
	clock => clock,
	input => input,
	load => q2,
	output => r2);
	
Reg3: Register16 port map(
	clock => clock,
	input => input,
	load => q3,
	output => r3);
	
Reg4: Register16 port map(
	clock => clock,
	input => input,
	load => q4,
	output => r4);

Reg5: Register16 port map(
	clock => clock,
	input => input,
	load => q5,
	output => r5);
	
Reg6: Register16 port map(
	clock => clock,
	input => input,
	load => q6,
	output => r6);
	
Reg7: Register16 port map(
	clock => clock,
	input => input,
	load => q7,
	output => r7);
	
Mux: Mux8Way16 port map (
	a => r0,
	b => r1,
	c => r2,
	d => r3,
	e => r4,
	f => r5,
	g => r6,
	h => r7,
	sel => address,
	q => output);

end architecture;
