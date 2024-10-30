library ieee;
use ieee.std_logic_1164.all;

entity TFF_tb is
end entity TFF_tb;

architecture test of TFF_tb is
	component TFF is
 		port(
			T : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			Q : out std_logic
		);
	end component;
	signal t :std_logic;
	signal r : std_logic := '0';
	signal c : std_logic;
	signal q : std_logic;
	begin
 		unit : TFF port map ( T => t, reset => r, clk => c, Q => q);
		process begin
			c <= '0';
			wait for 50 ns;
			c <= '1';
			wait for 50 ns;
		end process;
		process begin
			t <= '0';
			wait for 100 ns;
			t <= '1';
			wait for 100 ns;
			r <= '1';
			wait for 100 ns;
			t <= '0';
			wait for 100 ns;
			t <= '1';
			wait for 100 ns;
			wait;
		end process;
end test;
