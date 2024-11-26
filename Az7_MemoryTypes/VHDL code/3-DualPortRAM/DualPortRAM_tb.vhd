library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DualPortRAM_tb is
end DualPortRAM_tb;

architecture Behavioral of DualPortRAM_tb is

    component DualPortRAM is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            wr : in STD_LOGIC;
            rd : in STD_LOGIC;
            addr_wr : in STD_LOGIC_VECTOR(3 downto 0);
            addr_rd : in STD_LOGIC_VECTOR(3 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal wr : STD_LOGIC := '0';
    signal rd : STD_LOGIC := '0';
    signal addr_wr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal addr_rd : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_in : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    unit : DualPortRAM
        Port map (
            clk => clk,
            reset => reset,
            wr => wr,
            rd => rd,
            addr_wr => addr_wr,
            addr_rd => addr_rd,
            data_in => data_in,
            data_out => data_out
        );

    clk_process : process
    begin
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process clk_process;

    stim_proc: process
    begin
        reset <= '0';
        wait for 50 ns;
        reset <= '1';
        wait for 50 ns;

        addr_wr <= "0001";
        data_in <= "10101010";
        wr <= '1';
        addr_rd <= "0000";
        rd <= '1';
        wait for 50 ns;
        wr <= '0';
        rd <= '0';
        wait for 50 ns;

        addr_wr <= "0010";
        data_in <= "11110000";
        wr <= '1';
        addr_rd <= "0001";
        rd <= '1';
        wait for 50 ns;
        wr <= '0';
        rd <= '0';
        wait for 50 ns;

	addr_wr <= "0100";
        data_in <= "10101111";
        wr <= '1';
        addr_rd <= "0010";
        rd <= '1';
        wait for 50 ns;
        wr <= '0';
        rd <= '0';
        wait for 50 ns;

        wait;
    end process;

end Behavioral;

