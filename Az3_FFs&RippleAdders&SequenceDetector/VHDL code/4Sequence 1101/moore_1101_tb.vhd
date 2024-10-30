library ieee;
use ieee.std_logic_1164.all;

entity moore_1101_tb is
end entity moore_1101_tb;

architecture test of moore_1101_tb is
	component moore_1101 is
 		port(
			input : in std_logic ;
			output : out std_logic;
			clk : in std_logic
		);	
	end component;
	signal i :std_logic;
	signal o : std_logic;
	signal c : std_logic;
	begin
 		unit : moore_1101 port map ( input => i, output => o, clk => c);
		process begin
			c <= '0';
			wait for 50 ns;
			c <= '1';
			wait for 50 ns;
		end process;
		process begin
			i <= '1';
			wait for 100 ns;
			i <= '0';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '0';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '0';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '0';
			wait for 100 ns;
			i <= '1';
			wait for 100 ns;
			i <= '0';
			wait for 100 ns;
			wait;
		end process;
end test;