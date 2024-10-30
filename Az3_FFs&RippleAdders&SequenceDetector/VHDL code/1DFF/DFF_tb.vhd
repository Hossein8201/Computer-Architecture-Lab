library ieee;
use ieee.std_logic_1164.all;

entity DFF_tb is
end entity DFF_tb;

architecture test of DFF_tb is
	component DFF is
 		port(
			D : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			Q : out std_logic
		);
	end component;
	signal d :std_logic;
	signal r : std_logic := '0';
	signal c : std_logic;
	signal q : std_logic;
	begin
 		unit : DFF port map ( D => d, reset => r, clk => c, Q => q);
		process begin
			c <= '0';
			wait for 50 ns;
			c <= '1';
			wait for 50 ns;
		end process;

		process begin
			d <= '0';
			wait for 100 ns;
			d <= '1';
			wait for 100 ns;
			r <= '1';
			wait for 100 ns;
			d <= '0';
			wait for 100 ns;
			d <= '1';
			wait for 100 ns;
			wait;
		end process;
end test;
