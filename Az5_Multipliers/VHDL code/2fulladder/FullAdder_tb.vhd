LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FullAdder_tb IS
END FullAdder_tb;
 
ARCHITECTURE behavior OF FullAdder_tb IS 
 
    COMPONENT FullAdder IS
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';
   signal s : std_logic;
   signal cout : std_logic;
 
BEGIN
   unit: FullAdder PORT MAP (i0 => i0, i1 => i1, cin => cin, s => s, cout => cout);

      process begin
		i0 <= '0';
		i1 <= '1';
		cin <= '0';
		wait for 100 ns;

		i0 <= '1';
		i1 <= '1';
		cin <= '0';
		wait for 100 ns;
		
		i0 <= '0';
		i1 <= '1';
		cin <= '1';
		
		wait for 100 ns;
		i0 <= '1';
		i1 <= '1';
		cin <= '1';
		
		wait for 100 ns;
		i0 <= '0';
		i1 <= '0';
		cin <= '0';
		wait;
	end process;
END behavior;
