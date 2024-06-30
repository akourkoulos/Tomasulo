--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:17:15 04/15/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testIssue.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Issue
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
 
ENTITY testIssue IS
END testIssue;
 
ARCHITECTURE behavior OF testIssue IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Issue
    PORT(
         available : IN  std_logic;
			issueask: IN  std_logic;
			QiIn : IN  std_logic_vector(4 downto 0);
         FU_type : IN  std_logic_vector(1 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         Ri : IN  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         Accepted : OUT  std_logic;
			availableout : out  STD_LOGIC;
         FU_type_out : OUT  std_logic_vector(1 downto 0);
         opOut : OUT  std_logic_vector(1 downto 0);
         RiOut : OUT  std_logic_vector(4 downto 0);
			QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
         RjOut : OUT  std_logic_vector(4 downto 0);
         RkOut : OUT  std_logic_vector(4 downto 0);
         WERF : OUT  std_logic
			
        );
    END COMPONENT;
    

   --Inputs
   signal available : std_logic := '0';
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
	signal QiIn : std_logic_vector(4 downto 0) := (others => '0');
   signal issueask: std_logic := '0';
 	--Outputs
	signal availableout :   STD_LOGIC;
   signal Accepted : std_logic;
   signal FU_type_out : std_logic_vector(1 downto 0);
   signal opOut : std_logic_vector(1 downto 0);
   signal RiOut : std_logic_vector(4 downto 0);
   signal RjOut : std_logic_vector(4 downto 0);
   signal RkOut : std_logic_vector(4 downto 0);
	signal QiOut : std_logic_vector(4 downto 0);
   signal WERF : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Issue PORT MAP (
			 issueask=>issueask,	
          available => available,
          FU_type => FU_type,
          op => op,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
			 QiIn=>QiIn,
          Accepted => Accepted,
          FU_type_out => FU_type_out,
          opOut => opOut,
          RiOut => RiOut,
          RjOut => RjOut,
          RkOut => RkOut,
          WERF => WERF,
			 QiOut=>QiOut,
			 availableout=>availableout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		   issueask<='1';
			QiIn<="11111";
         available <='0';
         FU_type <="00";
         op <="00";
         Ri <="00011";
         Rj <="10011";
         Rk <="00111";
  wait for 100 ns;	
			 issueask<='1';
         available <='1';
         FU_type <="00";
         op <="00";
				QiIn<="11011";
         Ri <="00011";
         Rj <="10011";
         Rk <="00111";
  wait for 100 ns;	
			 issueask<='1';
         available <='1';
         FU_type <="01";
         op <="00";
				QiIn<="11110";
         Ri <="00000";
         Rj <="11011";
         Rk <="00101";

      -- insert stimulus here 

      wait;
   end process;

END;
