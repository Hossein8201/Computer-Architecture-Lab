library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor2_gate is
    Port ( A : in std_logic;
           B : in std_logic;
           Y : out std_logic);
end nor2_gate;

architecture Behavioral of nor2_gate is
	begin
    		Y <= not (A or B);
end Behavioral;

