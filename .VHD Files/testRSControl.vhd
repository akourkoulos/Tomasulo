--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:51:31 04/13/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testRSControl.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RSControl
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
 
ENTITY testRSControl IS
END testRSControl;
 
ARCHITECTURE behavior OF testRSControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RSControl
    PORT(
         Busy : IN  std_logic_vector(4 downto 0);
         FU_type : IN  std_logic_vector(1 downto 0);
         available : IN  std_logic;
         rst : IN  std_logic;
         ready : IN  std_logic_vector(4 downto 0);
         Qj : IN  std_logic_vector(4 downto 0);
         Qk : IN  std_logic_vector(4 downto 0);
         Q : IN  std_logic_vector(4 downto 0);
         answertoAvailable : OUT  std_logic;
         RstFU : OUT  std_logic;
         WE1 : OUT  std_logic_vector(6 downto 0);
         Rst1 : OUT  std_logic_vector(6 downto 0);
         WE2 : OUT  std_logic_vector(6 downto 0);
         Rst2 : OUT  std_logic_vector(6 downto 0);
         WE3 : OUT  std_logic_vector(6 downto 0);
         Rst3 : OUT  std_logic_vector(6 downto 0);
         WE4 : OUT  std_logic_vector(6 downto 0);
         Rst4 : OUT  std_logic_vector(6 downto 0);
         WE5 : OUT  std_logic_vector(6 downto 0);
         Rst5 : OUT  std_logic_vector(6 downto 0);
			QiForIssue: OUT  std_logic_vector(4 downto 0);
         control1 : OUT  std_logic;
         control2 : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Busy : std_logic_vector(4 downto 0) := (others => '0');
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal available : std_logic := '0';
   signal rst : std_logic := '0';
   signal ready : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal Q : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal answertoAvailable : std_logic;
   signal RstFU : std_logic;
   signal WE1 : std_logic_vector( 6 downto 0);
   signal Rst1 : std_logic_vector(6 downto 0);
   signal WE2 : std_logic_vector(6 downto 0);
   signal Rst2 : std_logic_vector(6 downto 0);
   signal WE3 : std_logic_vector(6 downto 0);
   signal Rst3 : std_logic_vector(6 downto 0);
   signal WE4 : std_logic_vector(6 downto 0);
   signal Rst4 : std_logic_vector(6 downto 0);
   signal WE5 : std_logic_vector(6 downto 0);
   signal Rst5 : std_logic_vector(6 downto 0);
	signal QiForIssue: std_logic_vector(4 downto 0);
   signal control1 : std_logic;
   signal control2 : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RSControl PORT MAP (
          Busy => Busy,
          FU_type => FU_type,
          available => available,
          rst => rst,
          ready => ready,
          Qj => Qj,
          Qk => Qk,
          Q => Q,
          answertoAvailable => answertoAvailable,
          RstFU => RstFU,
          WE1 => WE1,
          Rst1 => Rst1,
          WE2 => WE2,
          Rst2 => Rst2,
          WE3 => WE3,
          Rst3 => Rst3,
          WE4 => WE4,
          Rst4 => Rst4,
          WE5 => WE5,
          Rst5 => Rst5,
			 QiForIssue=>QiForIssue,
          control1 => control1,
          control2 => control2
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;	
		Busy <="00000";
		FU_type <="00";
		available <='1';
		rst <='0';
		ready<="00000";
		Qj <="00001";
		Qk <="00000";
		Q <="00000";

wait for 100 ns;	
		Busy <="00011";
		FU_type <="00";
		available <='1';
		rst <='0';
		ready <="00001";
		Qj <="00001";
		Qk <="00001";
		Q <="00000";
wait for 100 ns;	
		Busy <="11100";
		FU_type <="01";
		available <='1';
		rst <='0';
		ready <="00001";
		Qj <="00001";
		Qk <="00001";
		Q <="00000";

wait for 100 ns;	
		Busy <="00011";
		FU_type <="01";
		available <='1';
		rst<='0';
		ready <="00010";
		Qj <="00001";
		Qk <="00001";
		Q <="01010";

      wait;
   end process;

END;
