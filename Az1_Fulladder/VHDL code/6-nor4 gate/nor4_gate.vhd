library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity nor4_gate is
    Port ( A : in std_logic;
           B : in std_logic;
           C : in std_logic;
           D : in std_logic;
           Y : out std_logic
    );
end nor4_gate;

architecture Behavioral of nor4_gate is

   	signal N1, N2 : std_logic;

	component nor2_gate is
    		Port (  A : in std_logic;
           		B : in std_logic;
           		Y : out std_logic);
	end component nor2_gate;
	
	begin
    		U1: nor2_gate port map (A => A, B => B, Y => N1);
    		U2: nor2_gate port map (A => C, B => D, Y => N2);
    		U3: nor2_gate port map (A => N1, B => N2, Y => Y);
end Behavioral;


