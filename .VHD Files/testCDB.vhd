--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:48:57 04/14/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testCDB.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CDB
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
 
ENTITY testCDB IS
END testCDB;
 
ARCHITECTURE behavior OF testCDB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB
    PORT(
         wannaWrite1 : IN  std_logic;
         rst : IN  std_logic;
         Clock : IN  std_logic;
         V1 : IN  std_logic_vector(31 downto 0);
         V2 : IN  std_logic_vector(31 downto 0);
         V3 : IN  std_logic_vector(31 downto 0);
         Q1 : IN  std_logic_vector(4 downto 0);
         Q2 : IN  std_logic_vector(4 downto 0);
         Q3 : IN  std_logic_vector(4 downto 0);
         wannaWrite2 : IN  std_logic;
         wannaWrite3 : IN  std_logic;
         answer : OUT  std_logic_vector(2 downto 0);
         Vout : OUT  std_logic_vector(31 downto 0);
         Qout : OUT  std_logic_vector(4 downto 0);
         ControlOut : OUT  std_logic_vector(1 downto 0);
         WE_RF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal wannaWrite1 : std_logic := '0';
   signal rst : std_logic := '0';
   signal Clock : std_logic := '0';
   signal V1 : std_logic_vector(31 downto 0) := (others => '0');
   signal V2 : std_logic_vector(31 downto 0) := (others => '0');
   signal V3 : std_logic_vector(31 downto 0) := (others => '0');
   signal Q1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Q2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Q3 : std_logic_vector(4 downto 0) := (others => '0');
   signal wannaWrite2 : std_logic := '0';
   signal wannaWrite3 : std_logic := '0';

 	--Outputs
   signal answer : std_logic_vector(2 downto 0);
   signal Vout : std_logic_vector(31 downto 0);
   signal Qout : std_logic_vector(4 downto 0);
   signal ControlOut : std_logic_vector(1 downto 0);
   signal WE_RF : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB PORT MAP (
          wannaWrite1 => wannaWrite1,
          rst => rst,
          Clock => Clock,
          V1 => V1,
          V2 => V2,
          V3 => V3,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3,
          wannaWrite2 => wannaWrite2,
          wannaWrite3 => wannaWrite3,
          answer => answer,
          Vout => Vout,
          Qout => Qout,
          ControlOut => ControlOut,
          WE_RF => WE_RF
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
      -- hold reset state for 100 ns.

      wait for Clock_period*1;

wannaWrite1 <='1';
rst <='1';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='0';
wannaWrite3 <='0';

  wait for Clock_period*1;

wannaWrite1 <='1';
rst <='0';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='0';
wannaWrite3 <='0';

  wait for Clock_period*1;

wannaWrite1 <='1';
rst <='0';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='1';
wannaWrite3 <='0';

  wait for Clock_period*2;

wannaWrite1 <='1';
rst <='0';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='1';
wannaWrite3 <='1';

wait for Clock_period*3;

wannaWrite1 <='0';
rst <='0';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='1';
wannaWrite3 <='1';

wait for Clock_period*2;

wannaWrite1 <='1';
rst <='0';
V1 <="11111111111111111111111111111111";
V2 <="00000000000000000000000000000010";
V3 <="00000000000000000000000000000011";
Q1 <="00011";
Q2 <="00010";
Q3 <="00001";
wannaWrite2 <='0';
wannaWrite3 <='0';
wait;
   end process;

END;
