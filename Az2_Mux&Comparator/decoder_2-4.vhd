library ieee;
use ieee.std_logic_1164.all;
entity decoder_2to4 is
 port(
	input: in std_logic_vector(1 downto 0);
 	output: out std_logic_vector(3 downto 0)
 );
end entity decoder_2to4;

architecture behav of decoder_2to4 is
 begin
	output(0) <= '1' when input="00" else '0';
	output(1) <= '1' when input="01" else '0';
	output(2) <= '1' when input="10" else '0';
	output(3) <= '1' when input="11" else '0';
 end behav;
