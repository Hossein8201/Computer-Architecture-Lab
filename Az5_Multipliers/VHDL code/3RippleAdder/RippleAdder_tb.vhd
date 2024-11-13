LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RippleAdder_tb IS
END RippleAdder_tb;
 
ARCHITECTURE behavior OF RippleAdder_tb IS 
 
     	COMPONENT RippleAdder IS
    		Port(
			A, B : in std_logic_vector(3 downto 0);
			cin: in std_logic;
			s : out std_logic_vector(3 downto 0);
			cout : out std_logic
		);
     	END COMPONENT;
    
	signal A, B: std_logic_vector(3 downto 0);
    	signal Cin : std_logic;
    	signal S : std_logic_vector(3 downto 0);
    	signal Cout : std_logic;
 
	BEGIN
   		unit: RippleAdder port map(A => A, B => B, cin => Cin, s => S, cout => Cout);

      		process begin
			A <= "0110"; B <= "1100"; Cin <= '0';
        		wait for 100 ns;

        		A <= "1111"; B <= "1100"; Cin <= '0';
			wait for 100 ns;
        
        		A <= "0110"; B <= "0111"; Cin <= '1';
			wait for 100 ns;
        
        		A <= "0110"; B <= "1110"; Cin <= '1';
        		wait for 100 ns;

        		A <= "1111"; B <= "1111"; Cin <= '1';
			wait for 100 ns;
        		wait; 
		end process;
END behavior;


