library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_1101 is
	port(
		input : in std_logic ;
		output : out std_logic;
		clk : in std_logic
	);
end mealy_1101;

architecture Behavioral of mealy_1101 is
	type state_t is (s0 , s1 , s2, s3);
	signal state : state_t := s0;
	signal next_state : state_t := s0;
	begin
	process(state , input) begin
		case state is
			when s0=>
				if(input = '1') then
					next_state <= s1;
				else
					next_state <= state;
				end if;
			when s1=>
				if(input = '1') then
					next_state <= s2;
				else
					next_state <= s0;
				end if;
			when s2=>
				if(input = '0') then
					next_state <= s3;
				else
					next_state <= state;
				end if;
			when s3=>
				if(input = '1') then
					next_state <= s1;
				else
					next_state <= s0;
				end if;
			when others=>
				next_state <= s0;
		end case;
	end process;
	process(clk) begin
		if(clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;
	output <= '1' when (state = s3 and input = '1') else '0';
end Behavioral;
