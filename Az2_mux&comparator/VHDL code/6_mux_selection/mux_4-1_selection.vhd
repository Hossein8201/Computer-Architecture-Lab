library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_selection is
 port(
	input: in std_logic_vector(3 downto 0);
	selector: in std_logic_vector(1 downto 0);
 	output: out std_logic
 );
end entity mux_4to1_selection;

architecture behav of mux_4to1_selection is
begin
	with selector select
	output <= input(0) when "00",
	 input(1) when "01",
	 input(2) when "10",
	 input(3) when "11",
	 '0' when others;
end behav;
