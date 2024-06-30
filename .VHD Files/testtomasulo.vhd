--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:36 04/16/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testtomasulo.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tomasuloFinal
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
 
ENTITY testtomasulo IS
END testtomasulo;
 
ARCHITECTURE behavior OF testtomasulo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tomasuloFinal
    PORT(
         Clock : IN  std_logic;
         Rst : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         FU_type : IN  std_logic_vector(1 downto 0);
         Ri : IN  std_logic_vector(4 downto 0);
         Rj : IN  std_logic_vector(4 downto 0);
         Rk : IN  std_logic_vector(4 downto 0);
         Issueask : IN  std_logic;
         accepted : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Rst : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal Ri : std_logic_vector(4 downto 0) := (others => '0');
   signal Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal Issueask : std_logic := '0';

 	--Outputs
   signal accepted : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tomasuloFinal PORT MAP (
          Clock => Clock,
          Rst => Rst,
          op => op,
          FU_type => FU_type,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
          Issueask => Issueask,
          accepted => accepted
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

Rst <='1';
         op <="10";
         FU_type <="00";
         Ri <="00001";
         Rj <="00010";
         Rk <="00011";
         Issueask<='1';
			 wait for Clock_period*1;

Rst <='0';
         op <="10";
         FU_type <="00";
         Ri <="00001";
         Rj <="00010";
         Rk <="00011";
         Issueask<='1';
			wait for Clock_period*1;

Rst <='0';
         op <="10";
         FU_type <="00";
         Ri <="00010";
         Rj <="00011";
         Rk <="00011";
         Issueask<='1';
			wait for Clock_period*1;

Rst <='0';
         op <="00";
         FU_type <="01";
         Ri <="00011";
         Rj <="00010";
         Rk <="00001";
         Issueask<='1';
			wait for Clock_period*1;

Rst <='0';
         op <="10";
         FU_type <="00";
         Ri <="00100";
         Rj <="00011";
         Rk <="00011";
         Issueask<='1';
			wait for Clock_period*1;

Rst <='0';
         op <="00";
         FU_type <="00";
         Ri <="01111";
         Rj <="00001";
         Rk <="00100";
         Issueask<='1';
			
			
      wait;
   end process;

END;
