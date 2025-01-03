library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_16to1_tb is
end mux_16to1_tb;

architecture Behavioral of mux_16to1_tb is
    	signal I : STD_LOGIC_VECTOR(15 downto 0);
    	signal S : STD_LOGIC_VECTOR(3 downto 0);
    	signal Y : STD_LOGIC;
	
	component mux_16to1 is
		port(
			input: in std_logic_vector(15 downto 0);
			selector: in std_logic_vector(3 downto 0);
 			output: out std_logic
		);
	end component;
begin
    unit : mux_16to1 port map(input => I, selector => S, output => Y);

    process begin
        I <= "1010101010101010"; S <= "0000"; wait for 100 ns;
        I <= "1010101010101010"; S <= "0011"; wait for 100 ns;
        I <= "1010101010101010"; S <= "0100"; wait for 100 ns;
        I <= "1010101010101010"; S <= "0111"; wait for 100 ns;
        I <= "1010101010101010"; S <= "1000"; wait for 100 ns;
        I <= "1010101010101010"; S <= "1111"; wait for 100 ns;
        wait;
    end process;
end Behavioral;

