library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySaveAdderMultiplier_tb is
end CarrySaveAdderMultiplier_tb;

architecture Behavioral of CarrySaveAdderMultiplier_tb is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Product : STD_LOGIC_VECTOR(7 downto 0);

component CarrySaveAdderMultiplier is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Product : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

begin
    unit : CarrySaveAdderMultiplier port map (A => A, B => B, Product => Product);

    process begin
        A <= "0011"; -- 3
        B <= "0010"; -- 2
        wait for 100 ns;

        A <= "1111"; -- 15
        B <= "0001"; -- 1
        wait for 100 ns;

        A <= "1010"; -- 10
        B <= "0101"; -- 5
        wait for 100 ns;
        wait;
    end process;

end Behavioral;

