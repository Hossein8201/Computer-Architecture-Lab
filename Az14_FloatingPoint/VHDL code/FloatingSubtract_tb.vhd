library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FP_Subtractor_TB is
end FP_Subtractor_TB;

architecture Behavioral of FP_Subtractor_TB is
    -- Signals to connect to the Unit Under Test (UUT)
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal start : std_logic := '0';
    signal A : std_logic_vector(31 downto 0) := (others => '0');
    signal B : std_logic_vector(31 downto 0) := (others => '0');
    signal Rout : std_logic_vector(31 downto 0);
    signal finish : std_logic;

    -- Component declaration
    component FP_Subtractor
        Port (
            clk : in std_logic;
            reset : in std_logic;
            start : in std_logic;
            A : in std_logic_vector(31 downto 0);
            B : in std_logic_vector(31 downto 0);
            Rout : out std_logic_vector(31 downto 0);
            finish : out std_logic
        );
    end component;

    -- Clock generation process
begin
    clk_process : process
    begin
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;

    -- Instantiate the Unit Under Test (UUT)
    UUT: FP_Subtractor
        port map (
            clk => clk,
            reset => reset,
            start => start,
            A => A,
            B => B,
            Rout => Rout,
            finish => finish
        );

    -- Test process
    stim_proc: process
    begin
        -- Reset the system
        reset <= '1';
        wait for 50 ns;
        reset <= '0';

        -- Test case: Subtract 1.5 by 0 (expected result: 1.5)
        -- A = 1.5 => 0 01111111 10000000000000000000000
        -- B = 0   => 0 00000000 00000000000000000000000
        start <= '1';
        A <= "00111111111000000000000000000000"; -- 1.5
        B <= "00000000000000000000000000000000"; -- 0
        wait for 100 ns;
        start <= '0';
        wait until finish = '1';
        wait for 50 ns;

	-- Test case 2: Subtract -2.75 + 1.5 (expected result: -4.25)
        -- A = -2.75 => 1 10000000 01100000000000000000000
        -- B = 1.5   => 0 01111111 10000000000000000000000
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        start <= '1';
        A <= "11000000000110000000000000000000";
        B <= "00111111111000000000000000000000";
        wait for 100 ns;
        start <= '0';
        wait until finish = '1';
        wait for 50 ns;

        wait;
    end process;
end Behavioral;

