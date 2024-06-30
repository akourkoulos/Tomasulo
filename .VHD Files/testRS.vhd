--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:40:55 04/07/2021
-- Design Name:   
-- Module Name:   C:/Users/Aggelos/Desktop/proxorimeni/organosh/Ergasia_1/tomasulo/testRS.vhd
-- Project Name:  tomasulo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ReservationStation
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
 
ENTITY testRS IS
END testRS;
 
ARCHITECTURE behavior OF testRS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ReservationStation
    PORT(
         Clock : IN  std_logic;
         WE : IN  std_logic_vector(6 downto 0);
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
         Vj : IN  std_logic_vector(31 downto 0);
         Vk : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         Qi : IN  std_logic_vector(4 downto 0);
         Qj : IN  std_logic_vector(4 downto 0);
         Qk : IN  std_logic_vector(4 downto 0);
			ViAddressIn: IN  std_logic_vector(4 downto 0);
         Rst : IN  std_logic_vector(6 downto 0);
         BusyOut : OUT  std_logic;
         OpOut : OUT  std_logic_vector(1 downto 0);
         VjOut : OUT  std_logic_vector(31 downto 0);
         VkOut : OUT  std_logic_vector(31 downto 0);
         QiOut : OUT  std_logic_vector(4 downto 0);
         QjOut : OUT  std_logic_vector(4 downto 0);
         QkOut : OUT  std_logic_vector(4 downto 0);
			ready:out  STD_LOGIC;
			ViAddressOut: OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal WE : std_logic_vector(6 downto 0) := (others => '0');
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal ViAddressIn : std_logic_vector(4 downto 0) := (others => '0');
   signal Qi : std_logic_vector(4 downto 0) := (others => '0');
   signal Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal Rst : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal BusyOut : std_logic;
   signal OpOut : std_logic_vector(1 downto 0);
   signal VjOut : std_logic_vector(31 downto 0);
   signal VkOut : std_logic_vector(31 downto 0);
   signal QiOut : std_logic_vector(4 downto 0);
   signal QjOut : std_logic_vector(4 downto 0);
   signal QkOut : std_logic_vector(4 downto 0);
   signal ViAddressOut : std_logic_vector(4 downto 0);
   signal ready : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ReservationStation PORT MAP (
          Clock => Clock,
          WE => WE,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Vj => Vj,
          Vk => Vk,
          op => op,
			 Qi => Qi,
          Qj => Qj,
          Qk => Qk,
          Rst => Rst,
			 ViAddressIn=>ViAddressIn,
          BusyOut => BusyOut,
          OpOut => OpOut,
          VjOut => VjOut,
          VkOut => VkOut,
          QiOut => QiOut,
          QjOut => QjOut,
          QkOut => QkOut,
			 ready=>ready,
			 ViAddressOut => ViAddressOut
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

          WE <= "1111111";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "10";
			 CDB_Q<="00000";
			 Qi<="10010";
          Qj <= "01010";
          Qk <= "00001";
          Rst <= "1111111";
          ViAddressIn<="00011";
			       wait for Clock_period*1;

          WE <= "1111111";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "10";
			 Qi<="10010";
          Qj <= "01010";
          Qk <= "00001";
          Rst <= "0000000";
			 CDB_Q<="00000";
			 ViAddressIn<="00010";
			       wait for Clock_period*1;

          WE <= "1111111";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "10";
			 Qi<="10010";
          Qj <= "00000";
          Qk <= "00001";
          Rst <= "0000000";		
			 CDB_Q<="01010";
			 ViAddressIn<="00010";
			       wait for Clock_period*1;

          WE <= "0011111";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "11";
			 Qi<="10010";
          Qj <= "01011";
          Qk <= "00001";
          Rst <= "0000000";		
			 CDB_Q<="00000";
			 ViAddressIn<="00011";
			      wait for Clock_period*1;

          WE <= "0000000";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "11";
			 Qi<="10010";
          Qj <= "01011";
          Qk <= "00001";
          Rst <= "0001010";
			 CDB_Q<="01011";
			 ViAddressIn<="00011";
				wait for Clock_period*1;

          WE <= "1111111";
          CDB_V <="00000000000000000000000000011111";
          Vj <= "00000000000000000000000000000111";
          Vk <= "00000000000000000000000000000001";
          op <= "11";
			 Qi<="10010";
          Qj <= "00000";
          Qk <= "00000";
          Rst <= "0001010";
			 CDB_Q<="00000";
			 ViAddressIn<="00011";
      wait;
   end process;

END;
