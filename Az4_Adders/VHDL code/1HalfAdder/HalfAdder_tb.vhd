library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder_tb is
end HalfAdder_tb;

architecture testbench of HalfAdder_tb is

    signal A : STD_LOGIC;
    signal B : STD_LOGIC;
    signal Sum : STD_LOGIC;
    signal Carry : STD_LOGIC;

    component HalfAdder is
        Port (
		in1, in2: in std_logic;
		sum, carry: out std_logic
	);
    end component;
begin
    unit: HalfAdder port map (in1 => A, in2 => B, sum => Sum, carry => Carry);

    process begin
        A <= '0'; B <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;
        wait;
    end process;
end testbench;



