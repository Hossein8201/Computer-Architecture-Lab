library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TFF is
	port(
		T : in std_logic ;
		reset : in std_logic;
		Q : out std_logic;
		clk : in std_logic
	);
end TFF;
architecture Behavioral of TFF is
	signal temp : std_logic;
	begin
		process(clk, reset) begin
			if(reset = '0') then
			temp <= '0';
			elsif(clk'event and clk = '1') then
			temp <= Q xor T;
			end if;
		end process;
	Q <= temp;
end Behavioral;
