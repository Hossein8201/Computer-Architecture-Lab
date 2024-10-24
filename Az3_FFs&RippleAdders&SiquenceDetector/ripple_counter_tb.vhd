library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter_tb is
end entity ripple_counter_tb;

architecture test of ripple_counter_tb is
	component ripple_counter is
 		port(
			T : in std_logic;
			reset : in std_logic;
			clk : in std_logic;
			Q : out std_logic_vector(3 downto 0)
		);
	end component;
	signal t :std_logic;
	signal r : std_logic := '0';
	signal c : std_logic;
	signal q : std_logic_vector(3 downto 0);
	begin
 		unit : ripple_counter port map ( T => t, reset => r, clk => c, Q => q);
		process begin
			c <= '0';
			wait for 100 ns;
			c <= '1';
			wait for 100 ns;
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
			wait for 600 ns;
		end process;
end test;
