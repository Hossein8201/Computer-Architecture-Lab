library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider is
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
end Divider;

architecture Behavioral of Divider is

    type state_type is (RESTART, INIT, CHECK_OVERFLOW, SHIFT, SUBTRACT, CHECK_COUNT, DONE);
    signal state : state_type := RESTART;
    signal count : INTEGER := 0;
    signal counter : INTEGER := 0;
    signal E : STD_LOGIC := '0';
    signal R : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal over : STD_LOGIC := '0';

    signal add_sub_result : STD_LOGIC_VECTOR(3 downto 0);
    signal carry_out : STD_LOGIC;

    component RippleCarryAdder5Bit is
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Cin : in STD_LOGIC;
            Sum : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

begin

    B(3 downto 0) <= not(divisor);
    unit : RippleCarryAdder5Bit Port map(A => R, B => B, Cin => '1', Sum => add_sub_result, Cout => carry_out);

    process(clk, reset) begin
        if reset = '0' then
            state <= RESTART;
            count <= 0;
	    counter <= 0;
            R <= (others => '0');
            A <= (others => '0');
            over <= '0';
            quotient <= (others => '0');
            remainder <= (others => '0');
            finish <= '0';
        elsif (clk' event and clk = '1') then
            case state is
                when RESTART =>
                    if start = '1' then
                        state <= INIT;
                        R <= (dividend(7 downto 4)); 
                        A <= (dividend(3 downto 0)); 
			count <= 4;
			counter <= 4;
			finish <= '0';
                    	over <= '0';
                    end if;
                when INIT =>
                    if (carry_out = '1') then
                        state <= CHECK_OVERFLOW;
                    else
                        state <= SHIFT;
                    end if;
                when CHECK_OVERFLOW =>
                    over <= '1';
                    finish <= '1';
                    state <= DONE;
                when SHIFT =>
		    E <= R(3);
                    R(3 downto 1) <= R(2 downto 0);
                    R(0) <= A(3);
                    A(3 downto 1) <= A(2 downto 0);
                    A(0) <= '0';
		    counter <= count;
                    state <= SUBTRACT;
                when SUBTRACT =>
                    if (E = '1' or carry_out = '1') then
                        R <= add_sub_result;
                        A(0) <= '1';
                    else
                        A(0) <= '0';
                    end if;
		    count <= counter - 1;
		    state <= CHECK_COUNT;
		when CHECK_COUNT =>
                    if count = 0 then
                        state <= DONE;
                    else
                        state <= SHIFT;
                    end if;
                when DONE =>
                    quotient <= A;
                    remainder <= R;
                    finish <= '1';
                    state <= RESTART;
            end case;
        end if;
    end process;

    overflow <= over;
end Behavioral;
