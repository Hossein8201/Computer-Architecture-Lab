library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor2gate_tb is
end nor2gate_tb;

architecture testbench of nor2gate_tb is

    signal A : std_logic;
    signal B : std_logic;
    signal Y : std_logic;

    component nor2_gate is
        Port ( A : in std_logic;
               B : in std_logic;
               C : out std_logic
	);
    end component;
begin
    uut: nor2_gate port map (A => A, B => B, C => Y);

    stimulus: process
    begin
        A <= '0'; B <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;
        wait;
    end process;

end testbench;



