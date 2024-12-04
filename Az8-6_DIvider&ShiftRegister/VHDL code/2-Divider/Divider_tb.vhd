library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider4bit_tb is
end Divider4bit_tb;

architecture Behavioral of Divider4bit_tb is
    component Divider is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            start : in STD_LOGIC;
            dividend : in STD_LOGIC_VECTOR(7 downto 0);
            divisor : in STD_LOGIC_VECTOR(3 downto 0);
            quotient : out STD_LOGIC_VECTOR(3 downto 0);
            remainder : out STD_LOGIC_VECTOR(3 downto 0);
            overflow : out STD_LOGIC;
            finish : out STD_LOGIC
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal dividend : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal divisor : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal quotient : STD_LOGIC_VECTOR(3 downto 0);
    signal remainder : STD_LOGIC_VECTOR(3 downto 0);
    signal overflow : STD_LOGIC;
    signal finish : STD_LOGIC;

begin
    unit : Divider
        Port map (
            clk => clk,
            reset => reset,
            start => start,
            dividend => dividend,
            divisor => divisor,
            quotient => quotient,
            remainder => remainder,
            overflow => overflow,
            finish => finish
        );

    clk_process : process
    begin
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process clk_process;

    stim_proc: process
    begin
        reset <= '0';
        wait for 50 ns;
        reset <= '1';
        wait for 50 ns;

        dividend <= "00100011"; -- 35
        divisor <= "0011"; -- 3
        start <= '1';
        wait for 50 ns;
        start <= '0';
        wait for 1000 ns;

        dividend <= "10010000"; -- 144
        divisor <= "0000"; -- 0
        start <= '1';
        wait for 50 ns;
        start <= '0';
        wait for 1000 ns;

        dividend <= "00001010"; -- 10
        divisor <= "0010"; -- 2
        start <= '1';
        wait for 50 ns;
        start <= '0';
        wait for 1000 ns;

        wait;
    end process;
end Behavioral;
