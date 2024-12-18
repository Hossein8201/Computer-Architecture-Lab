library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           alu_control : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (15 downto 0)
    );
end ALU;

architecture Behavioral of ALU is

    component RippleAdder16 is
        Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
               b : in STD_LOGIC_VECTOR(15 downto 0);
               cin : in STD_LOGIC;
               sum : out STD_LOGIC_VECTOR(15 downto 0);
               cout : out STD_LOGIC);
    end component;

    signal sum, diff : STD_LOGIC_VECTOR(15 downto 0);
    signal carry_out_sum, carry_out_diff : STD_LOGIC;
    signal b_inverted : STD_LOGIC_VECTOR(15 downto 0);

begin

    Add: RippleAdder16 port map (a, b, '0', sum, carry_out_sum);
    b_inverted <= not b;
    Sub: RippleAdder16 port map (a, b_inverted, '1', diff, carry_out_diff);

    process(a, b, alu_control) begin
        case alu_control is
            when "0000" => result <= sum; 	-- ADD using ripple adder
            when "0001" => result <= diff;      -- SUB using ripple adder
            when "0010" => result <= a and b;  	-- AND
            when "0011" => result <= a or b;   	-- OR
            when "0100" => result <= a xor b;  	-- XOR
            when "0101" => result <= not a;    	-- NOT
            when "0110" =>  			-- SHR
                result(15) <= '0';
                result(14 downto 0) <= a(15 downto 1);
            when "1110" =>  			-- SHL
                result(0) <= '0';
                result(15 downto 1) <= b(14 downto 0);
            when "0111" =>  			-- RoR
                result(15) <= a(0);
                result(14 downto 0) <= a(15 downto 1);
            when "1111" =>  			-- RoL
                result(0) <= b(15);
                result(15 downto 1) <= b(14 downto 0);
            when others => result <= (others => '0');  -- Default
        end case;
    end process;

end Behavioral;

