library ieee;
use ieee.std_logic_1164.all;

entity mealy_two_tb is
end entity mealy_two_tb;

architecture test of mealy_two_tb is
	component mealy_two is
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
 		unit : mealy_two port map ( input => i, output => o, clk => c);
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
			i <= '1';
			wait for 100 ns;
			wait;
		end process;
end test;
