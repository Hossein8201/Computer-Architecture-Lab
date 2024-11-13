library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	Port(
		i0, i1, cin: in std_logic;
		s, cout : out std_logic
	);
end entity FullAdder;

architecture structure of FullAdder is
	component HalfAdder is
		Port(
			in1, in2: in std_logic;
			sum, carry: out std_logic
		);
	end component HalfAdder;

	signal internal_signal0, internal_signal1, internal_signal2: std_logic;
	
	begin
		unit1: HalfAdder port map ( in1 => i0, in2 => i1, sum => internal_signal0, carry => internal_signal1);
		unit2: HalfAdder port map ( in1 => internal_signal0, in2 => cin, sum => s, carry => internal_signal2);
		cout <= internal_signal1 or internal_signal2;
	end structure;
