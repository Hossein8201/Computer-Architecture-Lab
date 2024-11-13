library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArrayMultipier is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Product : out STD_LOGIC_VECTOR (7 downto 0)
    );
end ArrayMultipier;

architecture Behavioral of ArrayMultipier is

    signal P : STD_LOGIC_VECTOR (15 downto 0);
    signal S1 : STD_LOGIC_VECTOR (3 downto 0);
    signal S2 : STD_LOGIC_VECTOR (3 downto 0);
    signal S3 : STD_LOGIC_VECTOR (3 downto 0);
    signal C : STD_LOGIC_VECTOR (2 downto 0);

    COMPONENT RippleAdder IS
    	Port(
		A, B : in std_logic_vector(3 downto 0);
		cin: in std_logic;
		s : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
     END COMPONENT;

begin
    -- Row 0
    P(0) <= A(0) AND B(0);
	Product(0) <= P(0);

    -- Row 1
    P(1) <= A(1) AND B(0);
    P(2) <= A(2) AND B(0);
    P(3) <= A(3) AND B(0);
    P(4) <= A(0) AND B(1);
    P(5) <= A(1) AND B(1);
    P(6) <= A(2) AND B(1);
    P(7) <= A(3) AND B(1);
    unit1 : RippleAdder port map(A(0) => P(1), A(1) => P(2), A(2) => P(3), A(3) => '0', B(0) => P(4), B(1) => P(5), B(2) => P(6), B(3) => P(7), cin => '0', s => S1, cout => C(0));
   	Product(1) <= S1(0);

    -- Row 2
    P(8) <= A(0) AND B(2);
    P(9) <= A(1) AND B(2);
    P(10) <= A(2) AND B(2);
    P(11) <= A(3) AND B(2);
    unit2 : RippleAdder port map(A(0) => P(8), A(1) => P(9), A(2) => P(10), A(3) => P(11), B(0) => S1(1), B(1) => S1(2), B(2) => S1(3), B(3) => '0', cin => C(0), s => S2, cout => C(1));
   	Product(2) <= S2(0);

    -- Row 3
    P(12) <= A(0) AND B(3);
    P(13) <= A(1) AND B(3);
    P(14) <= A(2) AND B(3);
    P(15) <= A(3) AND B(3);
    unit3 : RippleAdder port map(A(0) => P(12), A(1) => P(13), A(2) => P(14), A(3) => P(15), B(0) => S2(1), B(1) => S2(2), B(2) => S2(3), B(3) => '0', cin => C(1), s => S3, cout => C(2));
   	Product(3) <= S3(0);
	Product(4) <= S3(1);
	Product(5) <= S3(2);
	Product(6) <= S3(3);
	Product(7) <= C(2);

end Behavioral;
