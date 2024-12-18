library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CPU is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           instruction : in STD_LOGIC_VECTOR (15 downto 0);
           io_data_input : in STD_LOGIC_VECTOR (15 downto 0);
	   io_data_output : out STD_LOGIC_VECTOR (15 downto 0)
	);
end CPU;

architecture Behavioral of CPU is

    type state_type is (FETCH, DECODE, EXECUTE, WRITE_BACK, NEXT_PC);
    signal state : state_type := FETCH;

    signal AR : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal PC : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal DR : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal AC : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal IR : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal control : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal opcode : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal address : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal data_output : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

    signal alu_result : STD_LOGIC_VECTOR (15 downto 0);
    component ALU is 
        Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
               b : in STD_LOGIC_VECTOR (15 downto 0);
               alu_control : in STD_LOGIC_VECTOR (3 downto 0);
               result : out STD_LOGIC_VECTOR (15 downto 0)
	);
    end component;

    signal memory_data_in : STD_LOGIC_VECTOR (15 downto 0);
    signal memory_data_out : STD_LOGIC_VECTOR (15 downto 0);
    component Memory is
    	Port ( clk : in std_logic;
               control : in STD_LOGIC_VECTOR (1 downto 0);
               address : in STD_LOGIC_VECTOR (11 downto 0);
               data_in : in STD_LOGIC_VECTOR (15 downto 0);
               data_out : out STD_LOGIC_VECTOR (15 downto 0)
	    );
    end component;

begin
    ALU_unit : ALU port map (
        a => memory_data_out,
        b => io_data_input,
        alu_control => opcode,
        result => alu_result
    );
    Memory_unit : Memory port map (
        clk => clk,
        control => control,
        address => address,
        data_in => memory_data_in,
        data_out => memory_data_out
    );
    process (clk, reset) begin
        if reset = '0' then
            state <= FETCH;
            PC <= (others => '0');
            AC <= (others => '0');
        elsif (clk' event and clk = '1') then
            case state is
                when FETCH =>
		    AR <= PC;
                    IR <= instruction;
		    AC <= (others => '0');
                    state <= DECODE;
                when DECODE =>
			opcode <= IR(15 downto 12);
			address <= IR(11 downto 0);
			DR <= memory_data_out;
			state <= EXECUTE;
		when EXECUTE =>
                    case opcode is
                        when "1000" => 			-- Load
                            state <= WRITE_BACK;
			when "1001" => 			-- STORE
			    memory_data_in <= io_data_input;
                            state <= WRITE_BACK;
                        when "1010" => 			-- Brz
			    if (AC = "0000000000000000") then
                            	PC <= address;
				state <= FETCH;
           		    end if;
                        when "1011" => 			-- Brnz
                            if (AC /= "0000000000000000") then
                            	PC <= address;
				state <= FETCH;
           		    end if;
                        when "1100" =>			-- Show
			    data_output <= DR;
			    state <= WRITE_BACK;
			when "1101" => 			-- Halt
			    state <= EXECUTE;
			when others =>			-- ALU Instructions
			    memory_data_in <= alu_result;
			    state <= WRITE_BACK;
                    end case;
                when WRITE_BACK =>
		    control <= "11";
		    state <= NEXT_PC;
                when NEXT_PC =>
		    control <= "00";
                    PC <= AR + '1';
                    state <= FETCH;
            end case;
        end if;
    end process;
	io_data_output <= data_output;
end Behavioral;

