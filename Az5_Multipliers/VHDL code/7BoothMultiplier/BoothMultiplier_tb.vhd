library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BoothMultiplier_tb is
-- Testbench does not have ports
end BoothMultiplier_tb;

architecture Behavioral of BoothMultiplier_tb is
    -- Component declaration of BoothMultiplier
    component BoothMultiplier
        Port ( A       : in  STD_LOGIC_VECTOR (3 downto 0);
               B       : in  STD_LOGIC_VECTOR (3 downto 0);
               clk     : in  std_logic;
               start   : in  std_logic;
               Product : out STD_LOGIC_VECTOR (7 downto 0);
               finish  : out std_logic
        );
    end component;

    -- Signals for connecting to the BoothMultiplier
    signal A       : std_logic_vector(3 downto 0) := (others => '0');
    signal B       : std_logic_vector(3 downto 0) := (others => '0');
    signal clk     : std_logic := '0';
    signal start   : std_logic := '0';
    signal Product : std_logic_vector(7 downto 0);
    signal finish  : std_logic;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the BoothMultiplier component
    uut: BoothMultiplier
        Port map (
            A       => A,
            B       => B,
            clk     => clk,
            start   => start,
            Product => Product,
            finish  => finish
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: 3 * 2
        A <= "0011";       -- 3 in binary
        B <= "0010";       -- 2 in binary
        start <= '1';      -- Start the multiplication
        wait for clk_period;
        start <= '0';      -- Release start signal
        wait until finish = '1';
        wait for clk_period;

        -- Test Case 2: -3 * 2
        A <= "1101";       -- -3 in binary (2's complement)
        B <= "0010";       -- 2 in binary
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until finish = '1';
        wait for clk_period;

        -- Test Case 3: -2 * -2
        A <= "1110";       -- -2 in binary (2's complement)
        B <= "1110";       -- -2 in binary (2's complement)
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until finish = '1';
        wait for clk_period;

        -- Test Case 4: 4 * -3
        A <= "0100";       -- 4 in binary
        B <= "1101";       -- -3 in binary (2's complement)
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until finish = '1';
        wait for clk_period;

        wait;
    end process;

end Behavioral;

