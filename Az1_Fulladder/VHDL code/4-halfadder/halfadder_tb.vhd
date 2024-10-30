library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture testbench of half_adder_tb is

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Sum : STD_LOGIC;
    signal Carry : STD_LOGIC;

    component half_adder is
        Port (
		in1, in2: in std_logic;
		out1, out2 : out std_logic
	);
    end component;
begin
    uut: half_adder port map (in1 => A, in2 => B, out1 => Sum, out2 => Carry);

    stimulus: process
    begin
        A <= '0'; B <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;
        wait;
    end process;
end testbench;


