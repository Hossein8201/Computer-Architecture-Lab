library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator_4bit_tb is
end comparator_4bit_tb;

architecture Behavioral of comparator_4bit_tb is
    	signal A : STD_LOGIC_VECTOR(3 downto 0);
        signal B : STD_LOGIC_VECTOR(3 downto 0);
	signal GT : STD_LOGIC;
        signal EQ : STD_LOGIC;
 	signal LT : STD_LOGIC;
	component Comparator_4bit is
    		Port ( 
			A : in STD_LOGIC_VECTOR(3 downto 0);
           		B : in STD_LOGIC_VECTOR(3 downto 0);
			GT : out STD_LOGIC;
           		EQ : out STD_LOGIC;
			LT : out STD_LOGIC 
		);
	end component;
	begin
    		UUT: Comparator_4bit port map(A => A, B => B, EQ => EQ, GT => GT, LT => LT);

    		process begin
        		A <= "1010"; B <= "1010"; wait for 100 ns;
        		A <= "1010"; B <= "1001"; wait for 100 ns;
			A <= "1010"; B <= "1100"; wait for 100 ns;
        		wait;
    		end process;
end Behavioral;

