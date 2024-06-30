--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:00:25 04/12/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testLogicFU.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LogicFU
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
 
ENTITY testLogicFU IS
END testLogicFU;
 
ARCHITECTURE behavior OF testLogicFU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LogicFU
    PORT(
         Clock : IN  std_logic;
         ready : IN  std_logic;
         Rst : IN  std_logic;
         canIwrite : IN  std_logic;
         op : IN  std_logic_vector(1 downto 0);
         Vj : IN  std_logic_vector(31 downto 0);
         Vk : IN  std_logic_vector(31 downto 0);
         ViAddressIn : IN  std_logic_vector(4 downto 0);
         Qi : IN  std_logic_vector(4 downto 0);
         ViAddressOut : OUT  std_logic_vector(4 downto 0);
         QiOut : OUT  std_logic_vector(4 downto 0);
         Vout : OUT  std_logic_vector(31 downto 0);
         wannaWrite : OUT  std_logic;
         finish : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal ready : std_logic := '0';
   signal Rst : std_logic := '0';
   signal canIwrite : std_logic := '0';
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal ViAddressIn : std_logic_vector(4 downto 0) := (others => '0');
   signal Qi : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ViAddressOut : std_logic_vector(4 downto 0);
   signal QiOut : std_logic_vector(4 downto 0);
   signal Vout : std_logic_vector(31 downto 0);
   signal wannaWrite : std_logic;
   signal finish : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LogicFU PORT MAP (
          Clock => Clock,
          ready => ready,
          Rst => Rst,
          canIwrite => canIwrite,
          op => op,
          Vj => Vj,
          Vk => Vk,
          ViAddressIn => ViAddressIn,
          Qi => Qi,
          ViAddressOut => ViAddressOut,
          QiOut => QiOut,
          Vout => Vout,
          wannaWrite => wannaWrite,
          finish => finish
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

      wait for Clock_period*1;

			ready <='1';
         Rst <='1';
         canIwrite <='1';
         op <="00";
         Vj <="00000000000000000000000000000011";
         Vk <="00000000000000000000000000000010";
         ViAddressIn<="00001";
         Qi <="10011";
			wait for Clock_period*1;

			ready <='1';
         Rst <='0';
         canIwrite <='1';
         op <="00";
         Vj <="00000000000000000000000000000011";
         Vk <="00000000000000000000000000000010";
         ViAddressIn<="00011";
         Qi <="10001";
			wait for Clock_period*1;

			ready <='1';
         Rst <='0';
         canIwrite <='1';
         op <="10";
         Vj <="00000000000000000000000000000011";
         Vk <="00000000000000000000000000000010";
         ViAddressIn<="00001";
         Qi <="10011";
			wait for Clock_period*1;

			ready <='1';
         Rst <='0';
         canIwrite <='0';
         op <="10";
         Vj <="00000000000000000000000000000011";
         Vk <="00000000000000000000000000000010";
         ViAddressIn<="00001";
         Qi <="10011";
			wait for Clock_period*1;

			ready <='1';
         Rst <='0';
         canIwrite <='1';
         op <="01";
         Vj <="00000000000000000000000000000011";
         Vk <="00000000000000000000000000000010";
         ViAddressIn<="00001";
         Qi <="10011";
      wait;
   end process; 

END;
