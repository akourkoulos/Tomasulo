--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:11:53 04/04/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testregi32.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: regi32
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testregi32 IS
END testregi32;
 
ARCHITECTURE behavior OF testregi32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT regi32
    PORT(
         Clock : IN  std_logic;
         RST : IN  std_logic;
         WE : IN  std_logic;
         DataIn : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal RST : std_logic := '0';
   signal WE : std_logic := '0';
   signal DataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: regi32 PORT MAP (
          Clock => Clock,
          RST => RST,
          WE => WE,
          DataIn => DataIn,
          DataOut => DataOut
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	begin
    wait for 100 ns;	
		WE<='0';
		RST<='1';
		DataIn<="10101101011010110101101011010111";

      wait for Clock_period;

		WE<='0';
		RST<='0';
		DataIn<="10101101011010110101101011010111";

      wait for Clock_period*3.0001/2;
		
		WE<='1';
		RST<='0';
		DataIn<="10101101011010110101101011010111";

      wait for Clock_period/2;
		WE<='0';
		RST<='0';
		DataIn<="00000000000000000000000000000011";

      wait for Clock_period;

      WE<='1';
		RST<='0';
		DataIn<="00000000000000000000000000000011";
      wait for Clock_period;

      WE<='1';
		RST<='1';
		DataIn<="00000000000000000000000000000011";


      wait for Clock_period;
      -- insert stimulus here 

      wait;
   end process;

END;
