library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ripple_counter is
	port(
		T : in std_logic ;
		reset : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		clk : in std_logic
	);
end ripple_counter;
architecture Behavioral of ripple_counter is
	component TFF is
		port(
			T : in std_logic ;
			reset : in std_logic;
			Q : out std_logic;
			clk : in std_logic
		);
	end component;
	begin
		unit1 : TFF port map (T => T, reset => reset, clk => not clk , Q => Q(0));
		unit2 : TFF port map (T => T, reset => reset, clk => not Q(0), Q => Q(1));
		unit3 : TFF port map (T => T, reset => reset, clk => not Q(1), Q => Q(2));
		unit4 : TFF port map (T => T, reset => reset, clk => not Q(2), Q => Q(3));
end Behavioral;