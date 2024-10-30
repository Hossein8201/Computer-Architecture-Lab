library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_1bit is
    	Port ( 		
		 A : in STD_LOGIC;
        	 B : in STD_LOGIC;
		 GT : out STD_LOGIC;
          	 EQ : out STD_LOGIC;
		 LT : out STD_LOGIC 
	);
end Comparator_1bit;

architecture Behavioral of Comparator_1bit is
	begin
    		GT <= A and (not B);
		EQ <= not(A xor B);
		LT <= B and (not A);
end Behavioral;
