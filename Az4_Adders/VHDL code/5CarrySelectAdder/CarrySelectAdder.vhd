library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelectAdder is
    	Port (
      		A : in std_logic_vector(3 downto 0);
        	B : in std_logic_vector(3 downto 0);
        	C_in : in std_logic;
        	S : out std_logic_vector(3 downto 0);
        	C_out : out std_logic
    	);
end CarrySelectAdder;

architecture Behavioral of CarrySelectAdder is

    	component FullAdder is
        	Port(
			i0, i1, cin: in std_logic;
			s, cout : out std_logic
		);
    	end component;

    	signal sum0, sum1 : std_logic_vector(3 downto 0);
    	signal carry0, carry1 : std_logic_vector(2 downto 0);
    	signal cout0, cout1 : std_logic;

	begin
   		unit1: FullAdder port map (i0 => A(0), i1 => B(0), cin => '0'      , s => sum0(0), cout => carry0(0));
   		unit2: FullAdder port map (i0 => A(1), i1 => B(1), cin => carry0(0), s => sum0(1), cout => carry0(1));
  		unit3: FullAdder port map (i0 => A(2), i1 => B(2), cin => carry0(1), s => sum0(2), cout => carry0(2));
    		unit4: FullAdder port map (i0 => A(3), i1 => B(3), cin => carry0(2), s => sum0(3), cout => cout0);

    		unit5: FullAdder port map (i0 => A(0), i1 => B(0), cin => '1'      , s => sum1(0), cout => carry1(0));
    		unit6: FullAdder port map (i0 => A(1), i1 => B(1), cin => carry1(0), s => sum1(1), cout => carry1(1));
    		unit7: FullAdder port map (i0 => A(2), i1 => B(2), cin => carry1(1), s => sum1(2), cout => carry1(2));
    		unit8: FullAdder port map (i0 => A(3), i1 => B(3), cin => carry1(2), s => sum1(3), cout => cout1);

    		process(C_in, sum0, sum1, cout0, cout1) begin
        		if C_in = '0' then
            			S <= sum0;
	    			C_out <= cout0;
        		else
            			S <= sum1;
	    			C_out <= cout1;
        		end if;
    		end process;
end Behavioral;
