library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySaveAdderMultiplier is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Product : out STD_LOGIC_VECTOR (7 downto 0)
    );
end CarrySaveAdderMultiplier;

architecture Behavioral of CarrySaveAdderMultiplier is

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
    unit2 : HalfAdder port map (in1 => P(2), in2 => P(5), sum => S(1), carry => C(1));
    unit3 : HalfAdder port map (in1 => P(3), in2 => P(6), sum => S(2), carry => C(2));
   	Product(1) <= S(0);

    -- Row 2
    P(8) <= A(0) AND B(2);
    P(9) <= A(1) AND B(2);
    P(10) <= A(2) AND B(2);
    P(11) <= A(3) AND B(2); 
    unit4 : FullAdder PORT MAP (i0 => S(1), i1 => P(8), cin => C(0), s => S(3), cout => C(3));
    unit5 : FullAdder PORT MAP (i0 => S(2), i1 => P(9), cin => C(1), s => S(4), cout => C(4));
    unit6 : FullAdder PORT MAP (i0 => P(7), i1 => P(10), cin => C(2), s => S(5), cout => C(5));
   	Product(2) <= S(3);

    -- Row 3
    P(12) <= A(0) AND B(3);
    P(13) <= A(1) AND B(3);
    P(14) <= A(2) AND B(3);
    P(15) <= A(3) AND B(3);
    unit7: FullAdder PORT MAP (i0 => S(4), i1 => P(12), cin => C(3), s => S(6), cout => C(6));
    unit8: FullAdder PORT MAP (i0 => S(5), i1 => P(13), cin => C(4), s => S(7), cout => C(7));
    unit9: FullAdder PORT MAP (i0 => P(11), i1 => P(14), cin => C(5), s => S(8), cout => C(8));
   	Product(3) <= S(6);
    
    -- Row 4
    unit10 : HalfAdder port map (in1 => S(7), in2 => C(6), sum => S(9), carry => C(9));
    unit11 : FullAdder PORT MAP (i0 => S(8), i1 => C(7), cin => C(9), s => S(10), cout => C(10));
    unit12 : FullAdder PORT MAP (i0 => P(15), i1 => C(8), cin => C(10), s => S(11), cout => C(11));
	Product(4) <= S(9);
	Product(5) <= S(10);
	Product(6) <= S(11);
	Product(7) <= C(11);

end Behavioral;
