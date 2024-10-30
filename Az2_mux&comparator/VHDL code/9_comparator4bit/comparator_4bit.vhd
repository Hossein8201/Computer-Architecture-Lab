library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_4bit is
    	Port ( 
		A : in STD_LOGIC_VECTOR(3 downto 0);
           	B : in STD_LOGIC_VECTOR(3 downto 0);
		GT : out STD_LOGIC;
           	EQ : out STD_LOGIC;
		LT : out STD_LOGIC 
	);
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is
	component Comparator_1bit is
		Port ( 		
		 	A : in STD_LOGIC;
        	 	B : in STD_LOGIC;
		 	GT : out STD_LOGIC;
          	 	EQ : out STD_LOGIC;
		 	LT : out STD_LOGIC 
		);
	end component;
	signal G : std_logic_vector(3 downto 0);
	signal E : std_logic_vector(3 downto 0);
	signal L : std_logic_vector(3 downto 0);

	begin
    		unit1 : Comparator_1bit port map (A => A(0), B => B(0), GT => G(0), EQ => E(0), LT => L(0));
		unit2 : Comparator_1bit port map (A => A(1), B => B(1), GT => G(1), EQ => E(1), LT => L(1));
		unit3 : Comparator_1bit port map (A => A(2), B => B(2), GT => G(2), EQ => E(2), LT => L(2));
		unit4 : Comparator_1bit port map (A => A(3), B => B(3), GT => G(3), EQ => E(3), LT => L(3));
		
		GT <= G(3) OR ( (NOT L(3))AND G(2) ) OR ( (NOT L(3)) AND (NOT L(2)) AND G(1) ) OR ( (NOT L(3)) AND (NOT L(2)) AND (NOT L(1)) AND G(0) );
		LT <= L(3) OR ( (NOT G(3))AND L(2) ) OR ( (NOT G(3)) AND (NOT G(2)) AND L(1) ) OR ( (NOT G(3)) AND (NOT G(2)) AND (NOT G(1)) AND L(0) );
		EQ <= E(0) AND E(1) AND E(2) AND E(3);
end Behavioral;

