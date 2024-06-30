--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:01:02 04/15/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testRF.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
 
ENTITY testRF IS
END testRF;
 
ARCHITECTURE behavior OF testRF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         AwrIns : IN  std_logic_vector(4 downto 0);
         Din_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Din_Q_Ins : IN  std_logic_vector(4 downto 0);
         WrEn : IN  std_logic;
         InsWrEn : IN  std_logic;
         Clock : IN  std_logic;
         RST : IN  std_logic;
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         DoutQ1 : OUT  std_logic_vector(4 downto 0);
         DoutQ2 : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal AwrIns : std_logic_vector(4 downto 0) := (others => '0');
   signal Din_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Din_Q_Ins : std_logic_vector(4 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal InsWrEn : std_logic := '0';
   signal Clock : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);
   signal DoutQ1 : std_logic_vector(4 downto 0);
   signal DoutQ2 : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          AwrIns => AwrIns,
          Din_V => Din_V,
          CDB_Q => CDB_Q,
          Din_Q_Ins => Din_Q_Ins,
          WrEn => WrEn,
          InsWrEn => InsWrEn,
          Clock => Clock,
          RST => RST,
          Dout1 => Dout1,
          Dout2 => Dout2,
          DoutQ1 => DoutQ1,
          DoutQ2 => DoutQ2
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

		   Ard1 <="00001";
         Ard2 <="00010";
         Awr <="00011";
         AwrIns <="00100";
         Din_V <="00000000000000000000000000000011";
         CDB_Q <="01000";
         Din_Q_Ins <="00001";
         WrEn <='1';
         InsWrEn <='1';
         RST <='1';
			 wait for Clock_period*1;

		   Ard1 <="00001";
         Ard2 <="00100";
         Awr <="00001";
         AwrIns <="00100";
         Din_V <="00000000000000000000000000000011";
         CDB_Q <="01000";
         Din_Q_Ins <="00001";
         WrEn <='1';
         InsWrEn <='1';
         RST <='0';
			wait for Clock_period*1;

		   Ard1 <="00001";
         Ard2 <="00100";
         Awr <="00100";
         AwrIns <="00011";
         Din_V <="00000000000000000000000000000111";
         CDB_Q <="00001";
         Din_Q_Ins <="00101";
         WrEn <='1';
         InsWrEn <='1';
         RST <='0';
			
			wait for Clock_period*1;

		   Ard1 <="00011";
         Ard2 <="00100";
         Awr <="00011";
         AwrIns <="00000";
         Din_V <="00000000000000000000000000001111";
         CDB_Q <="00101";
         Din_Q_Ins <="00001";
         WrEn <='1';
         InsWrEn <='1';
         RST <='0';
			
      wait;
   end process;

END;
