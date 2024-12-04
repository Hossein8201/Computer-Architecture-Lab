library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder5Bit is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Cin : in STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end RippleCarryAdder5Bit;

architecture Behavioral of RippleCarryAdder5Bit is

    component FullAdder is Port ( A : in STD_LOGIC; B : in STD_LOGIC; Cin : in STD_LOGIC; Sum : out STD_LOGIC; Cout : out STD_LOGIC ); end component;
    signal carry : STD_LOGIC_VECTOR(3 downto 0);
begin

    FA0: FullAdder Port map(A => A(0), B => B(0), Cin => Cin, Sum => Sum(0), Cout => carry(0));
    FA1: FullAdder Port map(A => A(1), B => B(1), Cin => carry(0), Sum => Sum(1), Cout => carry(1));
    FA2: FullAdder Port map(A => A(2), B => B(2), Cin => carry(1), Sum => Sum(2), Cout => carry(2));
    FA3: FullAdder Port map(A => A(3), B => B(3), Cin => carry(2), Sum => Sum(3), Cout => carry(3));

    Cout <= carry(3);
end Behavioral;

