library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor4_gate_tb is
end nor4_gate_tb;

architecture Behavioral of nor4_gate_tb is

    signal A, B, C, D : STD_LOGIC;
    signal Y : STD_LOGIC;
    
    component nor4_gate is 
	Port ( A : in std_logic;
           B : in std_logic;
           C : in std_logic;
           D : in std_logic;
           Y : out std_logic
    	); 
    end component;
    
begin
    uut: nor4_gate port map(A => A, B => B, C => C, D => D, Y => Y);

    stimulus: process
    begin
        A <= '0'; B <= '0'; C <= '0'; D <= '0';
        wait for 100 ns;

        A <= '0'; B <= '0'; C <= '0'; D <= '1';
        wait for 100 ns;

        A <= '0'; B <= '0'; C <= '1'; D <= '0';
        wait for 100 ns;

        A <= '0'; B <= '0'; C <= '1'; D <= '1';
        wait for 100 ns;

        A <= '0'; B <= '1'; C <= '0'; D <= '0';
        wait for 100 ns;

        A <= '0'; B <= '1'; C <= '0'; D <= '1';
        wait for 100 ns;

        A <= '1'; B <= '0'; C <= '0'; D <= '0';
        wait for 100 ns;

        A <= '1'; B <= '1'; C <= '1'; D <= '1';
        wait for 100 ns;
        wait;
    end process;

end Behavioral;


