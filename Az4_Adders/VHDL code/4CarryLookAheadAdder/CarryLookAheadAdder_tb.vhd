library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarryLookAheadAdder_tb is
end CarryLookAheadAdder_tb;

architecture behavior of CarryLookAheadAdder_tb is

    	component CarryLookAheadAdder is
        	Port ( 
			A : in std_logic_vector (3 downto 0);
   	        	B : in std_logic_vector (3 downto 0);
        	   	Cin : in std_logic;
  	         	S : out std_logic_vector (3 downto 0);
        	   	Cout : out std_logic
		);
	end component;

    	signal A, B: std_logic_vector(3 downto 0);
    	signal Cin: std_logic;
    	signal S: std_logic_vector(3 downto 0);
    	signal Cout: std_logic;

	begin
    		uut: CarryLookAheadAdder port map(A => A, B => B, Cin => Cin, S => S, Cout => Cout);
		
		process begin
        		A <= "0001"; B <= "0011"; Cin <= '0'; wait for 100 ns;
        		A <= "1111"; B <= "1111"; Cin <= '1'; wait for 100 ns;
        		A <= "1010"; B <= "0111"; Cin <= '0'; wait for 100 ns;
        		wait;
    		end process;
end behavior;
