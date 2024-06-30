--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:06 04/12/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/chackLogicCalculation.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LogicCalculation
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
 
ENTITY chackLogicCalculation IS
END chackLogicCalculation;
 
ARCHITECTURE behavior OF chackLogicCalculation IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LogicCalculation
    PORT(
         Vj : IN  std_logic_vector(31 downto 0);
         Vk : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         Vout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Vout : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LogicCalculation PORT MAP (
          Vj => Vj,
          Vk => Vk,
          op => op,
          Vout => Vout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     op<="00";
     Vj<="00000000000000000000000000000001";
	  Vk<="00000000000000000000000000000011";
	  wait for 100 ns;	

     op<="01";
     Vj<="00000000000000000000000000000001";
	  Vk<="00000000000000000000000000000011";
	  wait for 100 ns;	

     op<="10";
     Vj<="00000000000000000000000000000001";
	  Vk<="00000000000000000000000000000011";

      -- insert stimulus here 

   end process;

END;
