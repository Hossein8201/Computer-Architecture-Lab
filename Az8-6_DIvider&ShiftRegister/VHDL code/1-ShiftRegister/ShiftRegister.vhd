library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister is
    Port (
        Parallel_In : in std_logic_vector(3 downto 0); 
        L_R : in std_logic_vector(1 downto 0);        
        load : in std_logic;                           
        reset : in std_logic;                          
        clk : in std_logic;                            
        Q : out std_logic_vector(3 downto 0)   
    );
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal shift_reg : std_logic_vector(3 downto 0) := "0000";

begin
    process(clk, reset) begin
        if reset = '0' then
            shift_reg <= (others => '0'); 
        elsif (clk' event and clk = '1') then
            if load = '1' then
                shift_reg <= Parallel_In;
            else
                case L_R is
                    when "00" =>	-- Logic Shift Left
                        shift_reg(3 downto 1) <= shift_reg(2 downto 0); 
                        shift_reg(0) <= '0'; 
                    when "01" =>	-- Logic Shift Right
                        shift_reg(2 downto 0) <= shift_reg(3 downto 1);
                        shift_reg(3) <= '0'; 
                    when "10" =>	-- Atith Shift Left
                        shift_reg(3 downto 1) <= shift_reg(2 downto 0); 
                        shift_reg(0) <= '0'; 
                    when "11" =>	-- Arith Shift Right
                        shift_reg(2 downto 0) <= shift_reg(3 downto 1);
                        shift_reg(3) <= shift_reg(3); 
		    when others =>
			shift_reg <= shift_reg;
                end case;
            end if;
        end if;
    end process;

    Q <= shift_reg;

end Behavioral;
