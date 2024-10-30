library ieee;
use ieee.std_logic_1164.all;
entity HalfAdder is
	Port(
		in1, in2: in std_logic;
		out1, out2 : out std_logic
	);
end entity HalfAdder;

architecture structure of HalfAdder is
	begin
		out1 <= in1 or in2;
		out2 <= in1 and in2;
	end structure;