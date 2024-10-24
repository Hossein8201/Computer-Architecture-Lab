library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_condition is
 port(
	input: in std_logic_vector(3 downto 0);
	selector: in std_logic_vector(1 downto 0);
 	output: out std_logic
 );
end entity mux_4to1_condition;

architecture behav of mux_4to1_condition is
begin
	output <= input(0) when selector="00" else
	 input(1) when selector="01" else
	 input(2) when selector="10" else
	 input(3);
end behav;
