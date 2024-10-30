library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	Port(
		in1, in2: in std_logic;
		sum, carry: out std_logic
	);
end entity HalfAdder;

architecture structure of HalfAdder is
	begin
		sum <= in1 xor in2;
		carry <= in1 and in2;
	end structure;
