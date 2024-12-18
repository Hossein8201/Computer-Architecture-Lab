library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
begin
    process(a, b, cin)
    begin
        sum <= (a xor b) xor cin;
        cout <= (a and b) or (cin and (a xor b));
    end process;
end Behavioral;

