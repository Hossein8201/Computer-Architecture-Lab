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
            WR1 : in STD_LOGIC;
            RD1 : in STD_LOGIC;
            Addr1 : in STD_LOGIC_VECTOR(3 downto 0);
            data_in1 : in STD_LOGIC_VECTOR(7 downto 0);
            data_out1 : out STD_LOGIC_VECTOR(7 downto 0);
            
            WR2 : in STD_LOGIC;
            RD2 : in STD_LOGIC;
            Addr2 : in STD_LOGIC_VECTOR(3 downto 0);
            data_in2 : in STD_LOGIC_VECTOR(7 downto 0);
            data_out2 : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal WR1 : STD_LOGIC := '0';
    signal RD1 : STD_LOGIC := '0';
    signal Addr1 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_in1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out1 : STD_LOGIC_VECTOR(7 downto 0);
    
    signal WR2 : STD_LOGIC := '0';
    signal RD2 : STD_LOGIC := '0';
    signal Addr2 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_in2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_out2 : STD_LOGIC_VECTOR(7 downto 0);

begin

    unit : DualPortRAM
        Port map (
            clk => clk,
            reset => reset,
            WR1 => WR1,
            RD1 => RD1,
            Addr1 => Addr1,
            data_in1 => data_in1,
            data_out1 => data_out1,
            WR2 => WR2,
            RD2 => RD2,
            Addr2 => Addr2,
            data_in2 => data_in2,
            data_out2 => data_out2
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

        Addr1 <= "0001";
        data_in1 <= "10101010";
        WR1 <= '1';
        Addr2 <= "0010";
        data_in2 <= "11110000";
        WR2 <= '1';
        wait for 50 ns;
        WR1 <= '0';
        WR2 <= '0';
        wait for 50 ns;

        Addr1 <= "0001";
        RD1 <= '1';
        Addr2 <= "0011";
        data_in2 <= "01010101";
        WR2 <= '1';
        wait for 50 ns;
        RD1 <= '0';
        WR2 <= '0';
        wait for 50 ns;

        Addr1 <= "0010";
        RD1 <= '1';
        Addr2 <= "0011";
        RD2 <= '1';
        wait for 50 ns;
        RD1 <= '0';
        RD2 <= '0';
        wait for 50 ns;

        wait;
    end process;

end Behavioral;

