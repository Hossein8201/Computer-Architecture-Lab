library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FP_Subtractor is
    Port (
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(31 downto 0);
        Rout : out std_logic_vector(31 downto 0);
        finish : out std_logic
    );
end FP_Subtractor;

architecture Behavioral of FP_Subtractor is
    type state_type is (IDLE, CHECK_ZERO, UNPACK, ALIGN, SUBTRACT, NORMALIZE, PACK, DONE);
    signal current_state : state_type;

    signal R : std_logic_vector(31 downto 0);
    signal signA, signB, signR : std_logic;
    signal expA, expB, expR : std_logic_vector(7 downto 0);
    signal fracA, fracB, fracR : std_logic_vector(23 downto 0);
    signal alignedFracA, alignedFracB : std_logic_vector(24 downto 0);
    signal fracResult : std_logic_vector(24 downto 0);
    signal frac_tmp : std_logic_vector(24 downto 0);

begin
    process(clk, reset) 
    begin
        if reset = '1' then
            current_state <= IDLE;
            signA <= '0';
            signB <= '0';
            expA <= (others => '0');
            expB <= (others => '0');
            fracA <= (others => '0');
            fracB <= (others => '0');
            alignedFracA <= (others => '0');
            alignedFracB <= (others => '0');
            fracResult <= (others => '0');
            R <= (others => '0');
            finish <= '0';
        elsif rising_edge(clk) then
            case current_state is
                when IDLE =>
                    finish <= '0';
                    if start = '1' then
                        current_state <= CHECK_ZERO;
                    end if;

                when CHECK_ZERO =>
                    if (unsigned(A(30 downto 0)) = 0 and unsigned(B(30 downto 0)) = 0) then
                        R <= (others => '0');
                        current_state <= DONE;
                    elsif unsigned(B(30 downto 0)) = 0 then
                        R <= A;
                        current_state <= DONE;
                    elsif unsigned(A(30 downto 0)) = 0 then
                        R(31) <= not B(31);
                        R(30 downto 0) <= B(30 downto 0);
                        current_state <= DONE;
                    else
                        current_state <= UNPACK; 
                    end if;

                when UNPACK =>
                    signA <= A(31);
                    expA <= A(30 downto 23);
                    fracA <= "1" & A(22 downto 0);
                    signB <= B(31);
                    expB <= B(30 downto 23);
                    fracB <= "1" & B(22 downto 0);
                    current_state <= ALIGN;

                when ALIGN =>
                    if unsigned(expA) > unsigned(expB) then
                        alignedFracA <= "0" & fracA;
                        alignedFracB <= "0" & std_logic_vector(shift_right(unsigned(fracB), to_integer(unsigned(expA) - unsigned(expB))));
                        expR <= expA;
                    else
                        alignedFracA <= "0" & std_logic_vector(shift_right(unsigned(fracA), to_integer(unsigned(expB) - unsigned(expA))));
                        alignedFracB <= "0" & fracB;
                        expR <= expB;
                    end if;
                    current_state <= SUBTRACT;

                when SUBTRACT =>
                    if signA = signB then
                        if signA = '0'  then
                            fracResult <= std_logic_vector(unsigned(alignedFracA) - unsigned(alignedFracB));
                            if unsigned(alignedFracA) > unsigned(alignedFracB) then
                                signR <= signA;
                            else
                                signR <= not signB;
                            end if;
                        else
                            fracResult <= std_logic_vector(unsigned(alignedFracB) - unsigned(alignedFracA));
                            if unsigned(alignedFracB) > unsigned(alignedFracA) then
                                signR <= signB;
                            else
                                signR <= not signA;
                            end if;
                        end if;
                    else
                        fracResult <= std_logic_vector(unsigned(alignedFracA) + unsigned(alignedFracB));
                        signR <= signA;
                    end if;
                    frac_tmp <= fracResult;
                    current_state <= NORMALIZE;

                when NORMALIZE =>
                    if fracResult(24) = '1' then
                        fracR <= std_logic_vector(fracResult(23 downto 0));
                        expR <= std_logic_vector(unsigned(expR) + 1);
                    elsif unsigned(fracResult(23 downto 0)) = 0 then
                        fracR <= (others => '0');
                        expR <= (others => '0');
                    else
                        while frac_tmp(23) = '0' loop
                            frac_tmp(24 downto 1) <= frac_tmp(23 downto 0);
                            frac_tmp(0) <= '0';
                            expR <= std_logic_vector(unsigned(expR) - 1);
                        end loop;
                        fracR <= std_logic_vector(frac_tmp(23 downto 0));
                    end if;
                    current_state <= PACK;

                when PACK =>
                    R <= signR & expR & fracR(22 downto 0);
                    current_state <= DONE;

                when DONE =>
                    finish <= '1';
                    current_state <= IDLE;

                when others =>
                    current_state <= IDLE;
            end case;
        end if;
    end process;

    Rout <= R;

end Behavioral;