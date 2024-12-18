library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
    Port ( clk : in std_logic;
	   control : in STD_LOGIC_VECTOR (1 downto 0);
           address : in STD_LOGIC_VECTOR (11 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0)
	);
end Memory;

architecture Behavioral of Memory is

    type memory_array is array (0 to 4095) of STD_LOGIC_VECTOR(15 downto 0);
    signal memory : memory_array := (others => (others => '0'));

begin
    process(clk) begin
        if (clk' event and clk = '1') then						
            if control = "11" then				     -- Write
		memory(conv_integer(unsigned(address))) <= data_in;
	    end if;
	    data_out <= memory(conv_integer(unsigned(address)));     -- Read
        end if;
    end process;
end Behavioral;

