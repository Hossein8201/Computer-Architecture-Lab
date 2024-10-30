library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DFF is
	port(
		D : in std_logic ;
		reset : in std_logic;
		Q : out std_logic;
		clk : in std_logic
	);
end DFF;
architecture Behavioral of DFF is
	begin
		process(clk, reset)
		begin
			if(reset = '0') then
			Q <= '0';
			elsif(clk'event and clk = '1') then
			Q <= D;
			end if;
		end process;
end Behavioral;
