library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port (
        addr : in STD_LOGIC_VECTOR(3 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
    type rom_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal memory : rom_array := (
        0 => "00011100", 1 => "01110001", 2 => "00000010", 3 => "00000011",
        4 => "00000111", 5 => "00000101", 6 => "00011110", 7 => "11000111",
        8 => "00101000", 9 => "00001001", 10 => "00011010", 11 => "11001011",
        12 => "01001100", 13 => "00101101", 14 => "11001110", 15 => "01001111"
    );
begin
    process(addr) begin
        data_out <= memory(conv_integer(unsigned(addr)));
    end process;
end Behavioral;

