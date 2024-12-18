library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelectAdder_tb is
end CarrySelectAdder_tb;

architecture behavior of CarrySelectAdder_tb is
        component CarrySelectAdder is
        	Port (
  	     		A : in std_logic_vector(3 downto 0);
        		B : in std_logic_vector(3 downto 0);
  		      	C_in : in std_logic;
      			S : out std_logic_vector(3 downto 0);
  		      	C_out : out std_logic
    		);
  	end component;

  	signal A, B, S : std_logic_vector(3 downto 0);
    	signal C_in, C_out : std_logic;

    	begin
    		unit: CarrySelectAdder port map(A => A, B => B, C_in => C_in, S => S, C_out => C_out);
    		process begin
        		A <= "0001"; B <= "0011"; C_in <= '0'; wait for 100 ns;
        		A <= "0101"; B <= "0111"; C_in <= '1'; wait for 100 ns;
			A <= "1111"; B <= "0001"; C_in <= '0'; wait for 100 ns;
        		A <= "1010"; B <= "0101"; C_in <= '1'; wait for 100 ns;
			wait;
    		end process;

end behavior;
