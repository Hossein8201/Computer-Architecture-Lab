library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM_tb is
end ROM_tb;

architecture Behavioral of ROM_tb is
    component ROM is
        Port (
            addr : in STD_LOGIC_VECTOR(3 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);

begin
    unit : ROM
        Port map (
            addr => addr,
            data_out => data_out
        );
    
    process begin
        addr <= "0000";
        wait for 50 ns;

        addr <= "0001";
        wait for 50 ns;

        addr <= "0010";
        wait for 50 ns;

        addr <= "0011";
        wait for 50 ns;

        addr <= "0111";
        wait for 50 ns;

        addr <= "1010";
        wait for 50 ns;

        addr <= "1111";
        wait for 50 ns;

        wait;
    end process;

end Behavioral;

