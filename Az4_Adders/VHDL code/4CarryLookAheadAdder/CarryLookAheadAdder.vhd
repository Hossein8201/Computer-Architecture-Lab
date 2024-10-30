library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarryLookAheadAdder is
    	Port ( 
		A : in std_logic_vector(3 downto 0);
           	B : in std_logic_vector(3 downto 0);
           	Cin : in std_logic;
           	S : out std_logic_vector(3 downto 0);
           	Cout : out std_logic
	);
end CarryLookAheadAdder;

architecture Behavioral of CarryLookAheadAdder is

    	signal P, G: std_logic_vector(3 downto 0);
   	signal C : std_logic_vector(3 downto 0);

	begin
    		P <= A or B;
    		G <= A and B;

    		C(0) <= Cin;
    		C(1) <= G(0) or (P(0) and Cin);
    		C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
    		C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
    		Cout <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);

    		S <= (A xor B) xor C;
end Behavioral;
