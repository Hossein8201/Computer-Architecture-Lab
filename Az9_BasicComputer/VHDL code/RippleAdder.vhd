library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleAdder16 is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           b : in STD_LOGIC_VECTOR(15 downto 0);
           cin : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end RippleAdder16;

architecture Behavioral of RippleAdder16 is

    component FullAdder
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;

    signal carry : STD_LOGIC_VECTOR(15 downto 0);

begin

    FA0: FullAdder port map (a(0), b(0), cin, sum(0), carry(0));
    FA1: FullAdder port map (a(1), b(1), carry(0), sum(1), carry(1));
    FA2: FullAdder port map (a(2), b(2), carry(1), sum(2), carry(2));
    FA3: FullAdder port map (a(3), b(3), carry(2), sum(3), carry(3));
    FA4: FullAdder port map (a(4), b(4), carry(3), sum(4), carry(4));
    FA5: FullAdder port map (a(5), b(5), carry(4), sum(5), carry(5));
    FA6: FullAdder port map (a(6), b(6), carry(5), sum(6), carry(6));
    FA7: FullAdder port map (a(7), b(7), carry(6), sum(7), carry(7));
    FA8: FullAdder port map (a(8), b(8), carry(7), sum(8), carry(8));
    FA9: FullAdder port map (a(9), b(9), carry(8), sum(9), carry(9));
    FA10: FullAdder port map (a(10), b(10), carry(9), sum(10), carry(10));
    FA11: FullAdder port map (a(11), b(11), carry(10), sum(11), carry(11));
    FA12: FullAdder port map (a(12), b(12), carry(11), sum(12), carry(12));
    FA13: FullAdder port map (a(13), b(13), carry(12), sum(13), carry(13));
    FA14: FullAdder port map (a(14), b(14), carry(13), sum(14), carry(14));
    FA15: FullAdder port map (a(15), b(15), carry(14), sum(15), carry(15));

    cout <= carry(15);

end Behavioral;

