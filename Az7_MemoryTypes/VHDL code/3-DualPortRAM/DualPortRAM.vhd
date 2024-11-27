library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DualPortRAM is
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
end DualPortRAM;

architecture Behavioral of DualPortRAM is

    type memory_arr is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);

    signal memory : memory_arr := (others => (others => '0'));
    signal data1, data2 : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(clk, reset) begin
        if reset = '0' then
            memory <= (others => (others => '0'));
	    data1 <= (others => '0'); 
	    data2 <= (others => '0');
        elsif (clk' event and clk = '1') then
            if (WR1 = '1' and RD1 = '0') then
                memory(conv_integer(unsigned(Addr1))) <= data_in1;
            elsif (RD1 = '1' and WR1 = '0') then
                data1 <= memory(conv_integer(unsigned(Addr1)));
            end if;

            if (WR2 = '1' and RD2 = '0') then
                memory(conv_integer(unsigned(Addr2))) <= data_in2;
            elsif (RD2 = '1' and WR2 = '0') then
                data2 <= memory(conv_integer(unsigned(Addr2)));
            end if;
        end if;
    end process;
    data_out1 <= data1; 
    data_out2 <= data2;
    
end Behavioral;

