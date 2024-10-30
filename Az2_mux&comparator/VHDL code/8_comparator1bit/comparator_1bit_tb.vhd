library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_1bit_tb is
end comparator_1bit_tb;

architecture Behavioral of comparator_1bit_tb is
    	signal A : STD_LOGIC;
        signal B : STD_LOGIC;
	signal GT : STD_LOGIC;
        signal EQ : STD_LOGIC;
 	signal LT : STD_LOGIC;
	component Comparator_1bit is
    		Port ( 
			A : in STD_LOGIC;
           		B : in STD_LOGIC;
			GT : out STD_LOGIC;
           		EQ : out STD_LOGIC;
			LT : out STD_LOGIC 
		);
	end component;
	begin
    		UUT: Comparator_1bit port map(A => A, B => B, EQ => EQ, GT => GT, LT => LT);

    		process begin
        		A <= '0'; B <= '0'; wait for 100 ns;
        		A <= '0'; B <= '1'; wait for 100 ns;
			A <= '1'; B <= '0'; wait for 100 ns;
        		wait;
    		end process;
end Behavioral;
