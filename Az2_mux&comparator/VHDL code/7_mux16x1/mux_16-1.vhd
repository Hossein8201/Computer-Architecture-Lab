library ieee;
use ieee.std_logic_1164.all;

entity mux_16to1 is
 port(
	input: in std_logic_vector(15 downto 0);
	selector: in std_logic_vector(3 downto 0);
 	output: out std_logic
 );
end entity mux_16to1;

architecture behav of mux_16to1 is
	component mux_4to1_selection is
		 port(
			input: in std_logic_vector(3 downto 0);
			selector: in std_logic_vector(1 downto 0);
 			output: out std_logic
 		 );
	end component mux_4to1_selection;

	signal m: std_logic_vector(3 downto 0);

 begin
	uut1 : mux_4to1_selection port map(input => input(3 downto 0), selector => selector(1 downto 0), output => m(0));
	uut2 : mux_4to1_selection port map(input => input(7 downto 4), selector => selector(1 downto 0), output => m(1));
	uut3 : mux_4to1_selection port map(input => input(11 downto 8), selector => selector(1 downto 0), output => m(2));	
	uut4 : mux_4to1_selection port map(input => input(15 downto 12), selector => selector(1 downto 0), output => m(3));
	uut_main : mux_4to1_selection port map(input => m(3 downto 0), selector => selector(3 downto 2), output => output);
 end behav;

