library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CPU_tb is
end CPU_tb;

architecture Behavioral of CPU_tb is

    component CPU
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               instruction : in STD_LOGIC_VECTOR (15 downto 0);
               io_data_input : in STD_LOGIC_VECTOR (15 downto 0);
               io_data_output : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal instruction : STD_LOGIC_VECTOR (15 downto 0);
    signal io_data_input : STD_LOGIC_VECTOR (15 downto 0);
    signal io_data_output : STD_LOGIC_VECTOR (15 downto 0);

    constant clk_period : time := 50 ns;

begin
    unit : CPU
        Port map (
            clk => clk,
            reset => reset,
            instruction => instruction,
            io_data_input => io_data_input,
            io_data_output => io_data_output
        );

    process begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    process begin
        reset <= '0';
        wait for clk_period;
        reset <= '1';
        
        -- Test CPU and ALU Operations
        instruction <= "1001000000000001";  	-- STORE 1
        io_data_input <= "0000000000000010";  	-- Data to STORE
        wait for clk_period * 5;
        
        instruction <= "0000000000000001";  	-- ADD 1
        io_data_input <= "0000000000000011";  	-- Data to add
        wait for clk_period * 5;

        instruction <= "1100000000000001";  	-- Show 1 (Should show result of ADD) 
        wait for clk_period * 5;

        instruction <= "0001000000000001";  	-- SUB
        io_data_input <= "0000000000000001";	-- Data to subtract
        wait for clk_period * 5;

        instruction <= "1100000000000001";  	-- Show 1 (Should show result of SUB)
        wait for clk_period * 5;

        instruction <= "1001000000000011";  	-- STORE 3
        io_data_input <= "0000000000001000";  	-- Data to store
        wait for clk_period * 5;

        instruction <= "1100000000000011";  	-- Show 3 (Should show result of STORE)
        wait for clk_period * 5;

        wait;
    end process;

end Behavioral;

