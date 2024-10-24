library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is
 port(
	input: in std_logic_vector(3 downto 0);
	selector: in std_logic_vector(1 downto 0);
 	output: out std_logic
 );
end entity mux_4to1;

architecture behav of mux_4to1 is
	component decoder_2to4 is
		port(
			input: in std_logic_vector(1 downto 0);
 			output: out std_logic_vector(3 downto 0)
 		);
	end component decoder_2to4;

	component and_gate is
		 Port(
 			A, B: in std_logic;
 			C : out std_logic
 		);
	end component and_gate;

	signal s0, s1, s2, s3: std_logic;
	signal d0, d1, d2, d3: std_logic;

 begin
	uut1 : decoder_2to4 port map(input => selector, output(0) => s0, output(1) => s1, output(2) => s2, output(3) => s3);
	uut2 : and_gate port map(A => s0, B => input(0), C => d0);
	uut3 : and_gate port map(A => s1, B => input(1), C => d1);
	uut4 : and_gate port map(A => s2, B => input(2), C => d2);
	uut5 : and_gate port map(A => s3, B => input(3), C => d3);
	output <= d0 or d1 or d2 or d3;
 end behav;

