library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate_tb is
end xor_gate_tb;

architecture testbench of xor_gate_tb is

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

    component xor_gate is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : out STD_LOGIC
	);
    end component;
begin
    uut: xor_gate port map (A => A, B => B, C => Y);

    stimulus: process
    begin
        A <= '0'; B <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;
        wait;
    end process;
end testbench;


