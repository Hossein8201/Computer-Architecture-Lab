library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAM is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        wr : in STD_LOGIC;
	rd : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(7 downto 0);
        match : out STD_LOGIC;
        match_addr : out STD_LOGIC_VECTOR(3 downto 0)
    );
end CAM;

architecture Behavioral of CAM is

    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);

    signal memory : memory_array := (others => (others => '0'));
    signal match_found : STD_LOGIC := '0';
    signal match_address : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin
    process(clk, reset) begin
        if reset = '0' then
            memory <= (others => (others => '0'));
            match_found <= '0';
            match_address <= (others => '0');
        elsif (clk' event and clk = '1') then
            if wr = '1' then
                for i in 0 to 15 loop
                    if memory(i) = "00000000" then
                        memory(i) <= data_in;
                        exit;
                    end if;
                end loop;
            elsif rd = '1' then
                match_found <= '0';
                for i in 0 to 15 loop
                    if memory(i) = data_in then
                        match_found <= '1';
                        match_address <= conv_std_logic_vector(i, 4);
                    end if;
                end loop;
            end if;
        end if;
    end process;
    match <= match_found;
    match_addr <= match_address;

end Behavioral;

