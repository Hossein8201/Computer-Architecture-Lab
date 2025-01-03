library ieee;
use ieee.std_logic_1164.all;

entity RippleAdder is
	Port(
		A, B : in std_logic_vector(3 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end entity RippleAdder;

architecture structure of RippleAdder is
	component FullAdder is
		Port(
			i0, i1, cin: in std_logic;
			s, cout : out std_logic
		);
	end component;

	signal c0, c1, c2 : std_logic;
	
	begin
		unit1: FullAdder port map (i0 => A(0), i1 => B(0), cin => cin, s => s(0), cout => c0);
		unit2: FullAdder port map (i0 => A(1), i1 => B(1), cin => c0 , s => s(1), cout => c1);
		unit3: FullAdder port map (i0 => A(2), i1 => B(2), cin => c1 , s => s(2), cout => c2);
		unit4: FullAdder port map (i0 => A(3), i1 => B(3), cin => c2 , s => s(3), cout => cout);
end structure;
