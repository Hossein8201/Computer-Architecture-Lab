library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BoothMultiplier is
    Port ( A       : in STD_LOGIC_VECTOR (3 downto 0);
           B       : in STD_LOGIC_VECTOR (3 downto 0);
           clk     : in std_logic;
           start   : in std_logic;
           Product : out STD_LOGIC_VECTOR (7 downto 0);
           finish  : out std_logic
    );
end BoothMultiplier;

architecture Behavioral of BoothMultiplier is

    signal Q     : std_logic_vector (3 downto 0) := "0000";
    signal A_reg : std_logic_vector (4 downto 0);
    signal M     : std_logic_vector (3 downto 0); -- Changed B_reg to M for clarity
    signal Q_1   : std_logic := '0'; -- Tracks previous LSB of Q for Booth
    signal count : std_logic_vector (2 downto 0) := "100";
    signal B_ch  : std_logic_vector(1 downto 0);
    signal state : std_logic := '0';
    signal output:std_logic_vector (7 downto 0);

begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
            if (start = '1') then
                Q <= "0000";
                A_reg <= (others => '0'); -- Initialize A register to 0
                M <= A; -- Multiplicand
                Q <= B; -- Multiplier
                Q_1 <= '0';
                count <= "100";
                finish <= '0';
                state <= '1';

		output <= "00000000";

            elsif (state = '1') then
                -- Determine operation based on Booth encoding
                B_ch <= Q(0) & Q_1;
                case B_ch is
                    when "01" =>
                        A_reg <= A_reg + M;
                    when "10" =>
                        A_reg <= A_reg - M;
                    when others =>
                        A_reg <= A_reg;
                end case;

                -- Arithmetic Shift Right: A_reg, Q, Q_1
                Q_1 <= Q(0);
                Q(2 downto 0) <= Q(3 downto 1);
                Q(3) <= A_reg(0);
                A_reg(2 downto 0) <= A_reg(3 downto 1);
                -- Sign extend for arithmetic shift
                A_reg(3) <= A_reg(4);
		A_reg(4) <= '0';

                -- Decrement count
                count <= count - "001";

		output <= A_reg(3 downto 0) & Q;

                -- Check if count is zero to finish
                if (count = "000") then 
                     -- Concatenate final A_reg and Q
                    state <= '0';
                    finish <= '1';
                end if;
            end if;
        end if;
    end process;
    
	Product <= output;

end Behavioral;

