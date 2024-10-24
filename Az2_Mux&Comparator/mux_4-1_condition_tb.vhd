library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_condition_tb is
end entity mux_4to1_condition_tb;

architecture test of mux_4to1_condition_tb is
	component mux_4to1_condition is
		port(
			input: in std_logic_vector(3 downto 0);
			selector: in std_logic_vector(1 downto 0);
 			output: out std_logic
 		);
	end component;

	signal i :std_logic_vector(3 downto 0);
	signal s : std_logic_vector(1 downto 0);
	signal o : std_logic;
begin
 	mux : mux_4to1_condition port map ( input => i, selector => s, output => o);
	process begin
        	i <= "1010"; s <= "00"; 
		wait for 100 ns;
        	i <= "1010"; s <= "01"; 
		wait for 100 ns;
        	i <= "1010"; s <= "10"; 
		wait for 100 ns;
        	i <= "1010"; s <= "11"; 
		wait for 100 ns;
        	wait;
   	end process;
end test;
