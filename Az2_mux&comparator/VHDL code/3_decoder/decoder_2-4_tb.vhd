library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2x4_tb is
end decoder_2x4_tb;

architecture Behavioral of decoder_2x4_tb is
	component decoder_2to4 is
		port(
			input: in std_logic_vector(1 downto 0);
 			output: out std_logic_vector(3 downto 0)
 		);
	end component;
    	signal s : STD_LOGIC_VECTOR(1 downto 0);
    	signal d : STD_LOGIC_VECTOR(3 downto 0);
begin
	unit : decoder_2to4 port map (input => s, output => d);
    	process begin
        	s <= "00"; wait for 100 ns;
        	s <= "01"; wait for 100 ns;
        	s <= "10"; wait for 100 ns;
        	s <= "11"; wait for 100 ns;
        	wait;
    	end process;
end Behavioral;

