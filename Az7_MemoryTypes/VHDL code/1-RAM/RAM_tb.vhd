library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM_tb is
end RAM_tb;

architecture Behavioral of RAM_tb is
    component RAM is
        Port ( 
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            wr : in STD_LOGIC;
            rd : in STD_LOGIC;
            addr : in STD_LOGIC_VECTOR(3 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal wr : STD_LOGIC := '0';
    signal rd : STD_LOGIC := '0';
    signal addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_in : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);

begin
    unit: RAM
        Port map (
            clk => clk,
            reset => reset,
            wr => wr,
            rd => rd,
            addr => addr,
            data_in => data_in,
            data_out => data_out
        );

    process begin
        clk <= '0';
        wait for 50 ns;
        clk <= '1';
        wait for 50 ns;
    end process;

    process begin
        reset <= '0';
        wait for 100 ns;
        reset <= '1';
        wait for 100 ns;

        addr <= "0001";
        data_in <= "10101010";
        wr <= '1';
        wait for 100 ns;
        wr <= '0';
        wait for 100 ns;

        rd <= '1';
        wait for 100 ns;
        rd <= '0';
        wait for 100 ns;

        addr <= "0010";
        data_in <= "11110000";
        wr <= '1';
        wait for 100 ns;
        wr <= '0';
        wait for 100 ns;

        rd <= '1';
        wait for 100 ns;
        rd <= '0';
        wait for 100 ns;

        wait;
    end process;

end Behavioral;

