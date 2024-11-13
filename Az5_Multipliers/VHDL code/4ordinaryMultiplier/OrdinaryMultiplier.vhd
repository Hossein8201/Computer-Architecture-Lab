library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrdinaryMultiplier is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Product : out STD_LOGIC_VECTOR (7 downto 0)
    );
end OrdinaryMultiplier;

architecture Behavioral of OrdinaryMultiplier is

    signal P : STD_LOGIC_VECTOR (15 downto 0);
    signal S : STD_LOGIC_VECTOR (11 downto 0);
    signal C : STD_LOGIC_VECTOR (11 downto 0);

    component HalfAdder is
        Port (
		in1, in2: in std_logic;
		sum, carry: out std_logic
	);
    end component;

    component FullAdder is
    	Port(
         	i0 : IN  std_logic;
         	i1 : IN  std_logic;
         	cin : IN  std_logic;
         	s : OUT  std_logic;
         	cout : OUT  std_logic
        );
    end component;    

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
    unit1 : HalfAdder port map (in1 => P(1), in2 => P(4), sum => S(0), carry => C(0));
    unit2 : FullAdder PORT MAP (i0 => P(2), i1 => P(5), cin => C(0), s => S(1), cout => C(1));
    unit3 : FullAdder PORT MAP (i0 => P(3), i1 => P(6), cin => C(1), s => S(2), cout => C(2));
    unit4 : HalfAdder port map (in1 => P(7), in2 => C(2), sum => S(3), carry => C(3));
   	Product(1) <= S(0);

    -- Row 2
    P(8) <= A(0) AND B(2);
    P(9) <= A(1) AND B(2);
    P(10) <= A(2) AND B(2);
    P(11) <= A(3) AND B(2);
    unit5 : HalfAdder port map (in1 => S(1), in2 => P(8), sum => S(4), carry => C(4));
    unit6 : FullAdder PORT MAP (i0 => S(2), i1 => P(9), cin => C(4), s => S(5), cout => C(5));
    unit7 : FullAdder PORT MAP (i0 => S(3), i1 => P(10), cin => C(5), s => S(6), cout => C(6));
    unit8 : FullAdder PORT MAP (i0 => C(3), i1 => P(11), cin => C(6), s => S(7), cout => C(7));
   	Product(2) <= S(4);

    -- Row 3
    P(12) <= A(0) AND B(3);
    P(13) <= A(1) AND B(3);
    P(14) <= A(2) AND B(3);
    P(15) <= A(3) AND B(3);
    unit9 : HalfAdder port map (in1 => S(5), in2 => P(12), sum => S(8), carry => C(8));
    unit10: FullAdder PORT MAP (i0 => S(6), i1 => P(13), cin => C(8), s => S(9), cout => C(9));
    unit11: FullAdder PORT MAP (i0 => S(7), i1 => P(14), cin => C(9), s => S(10), cout => C(10));
    unit12: FullAdder PORT MAP (i0 => C(7), i1 => P(15), cin => C(10), s => S(11), cout => C(11));
   	Product(3) <= S(8);
	Product(4) <= S(9);
	Product(5) <= S(10);
	Product(6) <= S(11);
	Product(7) <= C(11);

end Behavioral;
