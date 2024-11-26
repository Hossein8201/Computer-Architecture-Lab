library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAM_tb is
end CAM_tb;

architecture Behavioral of CAM_tb is

    component CAM is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            wr : in STD_LOGIC;
	    rd : in STD_LOGIC;
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            match : out STD_LOGIC;
            match_addr : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal wr : STD_LOGIC := '0';
    signal rd : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal match : STD_LOGIC;
    signal match_addr : STD_LOGIC_VECTOR(3 downto 0);

begin
    unit : CAM
        Port map (
            clk => clk,
            reset => reset,
            wr => wr,
	    rd => rd,
            data_in => data_in,
            match => match,
            match_addr => match_addr
        );

    process begin
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;

    process begin
        reset <= '0';
        wait for 50 ns;
        reset <= '1';
        wait for 50 ns;

        data_in <= "10101010";
        wr <= '1';
        wait for 50 ns;
        wr <= '0';
        wait for 50 ns;

        data_in <= "11110000";
        wr <= '1';
        wait for 50 ns;
        wr <= '0';
        wait for 50 ns;
	
	data_in <= "11001101";
        wr <= '1';
        wait for 50 ns;
        wr <= '0';
        wait for 50 ns; 

	data_in <= "11001101";
        rd <= '1';
        wait for 50 ns;
        rd <= '0';
        wait for 50 ns; 

        data_in <= "10101010";
        rd <= '1';
        wait for 50 ns;
        rd <= '0';
        wait for 50 ns;

        data_in <= "11110000";
        rd <= '1';
        wait for 50 ns;
        rd <= '0';
        wait for 50 ns;

        wait;
    end process;

end Behavioral;

