library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
    Port ( 
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        wr : in STD_LOGIC;
        rd : in STD_LOGIC;
        addr : in STD_LOGIC_VECTOR(3 downto 0);
        data_in : in STD_LOGIC_VECTOR(7 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end RAM;

architecture Behavioral of RAM is

    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);

    signal memory : memory_array := (others => (others => '0'));
    signal data_reg : STD_LOGIC_VECTOR(7 downto 0);

begin
    process(clk, reset) begin
        if reset = '0' then
            memory <= (others => (others => '0'));
            data_reg <= (others => '0');
        elsif (clk' event and clk = '1') then
            if (wr = '1' and rd = '0') then
                memory(conv_integer(unsigned(addr))) <= data_in;
            elsif (rd = '1' and wr = '0') then
                data_reg <= memory(conv_integer(unsigned(addr)));
            end if;
        end if;
    end process;
    data_out <= data_reg;

end Behavioral;

