library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister_tb is
end ShiftRegister_tb;

architecture Behavioral of ShiftRegister_tb is
    component ShiftRegister
        Port (
            Parallel_In : in std_logic_vector(3 downto 0); 
            L_R : in std_logic_vector(1 downto 0);        
            load : in std_logic;                           
            reset : in std_logic;                          
            clk : in std_logic;                            
            Q : out std_logic_vector(3 downto 0)   
        );
    end component;

    signal Parallel_In : std_logic_vector(3 downto 0) := "0000";
    signal L_R : std_logic_vector(1 downto 0) := "00";
    signal load : std_logic := '0';
    signal reset : std_logic := '0';
    signal clk : std_logic := '0';
    signal Q : std_logic_vector(3 downto 0);

begin
    unit : ShiftRegister
        Port map (
            Parallel_In => Parallel_In,
            L_R => L_R,
            load => load,
            reset => reset,
            clk => clk,
            Q => Q
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

        Parallel_In <= "1010";
        load <= '1';
        wait for 50 ns;
        load <= '0';

        L_R <= "00";
        wait for 100 ns;

        L_R <= "01";
        wait for 150 ns;

        L_R <= "10";
        wait for 150 ns;

        L_R <= "11";
        wait for 200 ns;
        wait;
    end process;
end Behavioral;
