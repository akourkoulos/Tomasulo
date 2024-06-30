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
 
ENTITY testCompleteRS IS
END testCompleteRS;
 
ARCHITECTURE behavior OF testCompleteRS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CompleteRS
    PORT(
         canIwrite1 : in  STD_LOGIC;
			  canIwrite2 : in  STD_LOGIC;
			  Clock : in  STD_LOGIC;
           OpIn : in  STD_LOGIC_VECTOR (1 downto 0);
           CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
           CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           ViAddress : in  STD_LOGIC_VECTOR (4 downto 0);
           availableask : in  STD_LOGIC;
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           rst : in  STD_LOGIC;
           answertoAvailable : out  STD_LOGIC;
           ViLogic : out  STD_LOGIC_VECTOR (31 downto 0);
           QiLogic : out  STD_LOGIC_VECTOR (4 downto 0);
           AddressOfViLogic : out  STD_LOGIC_VECTOR (4 downto 0);
           wannaWriteLogic : out  STD_LOGIC;
           ViArithm : out  STD_LOGIC_VECTOR (31 downto 0);
           QiArithm : out  STD_LOGIC_VECTOR (4 downto 0);
           QiForIssue : out  STD_LOGIC_VECTOR (4 downto 0);
           AddressOfViArithm : out  STD_LOGIC_VECTOR (4 downto 0);
           wannaWriteArithm : out  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
	signal canIwrite1: std_logic := '0';
	signal canIwrite2: std_logic := '0';
	signal availableask: std_logic := '0';
   signal OpIn : std_logic_vector(1 downto 0) := (others => '0');
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal ViAddress : std_logic_vector(4 downto 0) := (others => '0');
   signal FU_type : std_logic_vector(1 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal answertoAvailable : std_logic;
   signal ViLogic : std_logic_vector(31 downto 0);
   signal QiLogic : std_logic_vector(4 downto 0);
   signal AddressOfViLogic : std_logic_vector(4 downto 0);
   signal wannaWriteLogic : std_logic;
   signal ViArithm : std_logic_vector(31 downto 0);
   signal QiArithm : std_logic_vector(4 downto 0);
   signal AddressOfViArithm : std_logic_vector(4 downto 0);
   signal wannaWriteArithm : std_logic;
   signal QiForIssue: std_logic_vector(4 downto 0);
   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CompleteRS PORT MAP (
          Clock => Clock,
          canIwrite1=>canIwrite1,
          canIwrite2 => canIwrite2,
          availableask => availableask,
          OpIn => OpIn ,
          CDB_V => CDB_V,
          CDB_Q=> CDB_Q,
			 RF_Qj => RF_Qj,
          RF_Qk => RF_Qk,
          RF_Vj=> RF_Vj,
          RF_Vk => RF_Vk,
			 ViAddress=>ViAddress,
          FU_type => FU_type,
          rst => rst,
          answertoAvailable => answertoAvailable,
          ViLogic => ViLogic,
          QiLogic => QiLogic,
          AddressOfViLogic => AddressOfViLogic,
          wannaWriteLogic => wannaWriteLogic,
			 ViArithm=>ViArithm,
			 QiArithm => QiArithm,
			 QiForIssue=>QiForIssue,
			 AddressOfViArithm=>AddressOfViArithm,
			 wannaWriteArithm => wannaWriteArithm
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
      wait for Clock_period;
			 canIwrite1<='1';
          canIwrite2 <= '0';
          availableask <= '1';
          OpIn <= "00" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="01001";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000000011";
          RF_Vk <= "00000000000000000000000000000011";
			 ViAddress<="00001";
          FU_type <= "00";
          rst <= '1';
           wait for Clock_period;
			 canIwrite1<='1';
          canIwrite2 <= '0';
          availableask <= '1';
          OpIn <= "00" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="01001";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000000011";
          RF_Vk <= "00000000000000000000000000000011";
			 ViAddress<="00001";
          FU_type <= "00";
          rst <= '0';
         wait for Clock_period;
			 canIwrite1<='1';
          canIwrite2 <= '0';
          availableask <= '1';
          OpIn <= "01" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="00000";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000000011";
          RF_Vk <= "00000000000000000000000000000010";
			 ViAddress<="00010";
          FU_type <= "00";
          rst <= '0';
			 wait for Clock_period;
			 canIwrite1<='1';
          canIwrite2 <= '1';
          availableask <= '1';
          OpIn <= "01" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="00000";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000001111";
          RF_Vk <= "00000000000000000000001000000000";
			 ViAddress<="00011";
          FU_type <= "00";
          rst <= '0';
			  wait for Clock_period;
			 canIwrite1<='0';
          canIwrite2 <= '1';
          availableask <= '1';
          OpIn <= "01" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="00000";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000001111";
          RF_Vk <= "00000000000000000000001000000000";
			 ViAddress<="00110";
          FU_type <= "01";
          rst <='0';
			  wait for Clock_period;
			 canIwrite1<='0';
          canIwrite2 <= '1';
          availableask <= '1';
          OpIn <= "00" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="00000";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000001111";
          RF_Vk <= "00000000000000000000001000000000";
			 ViAddress<="00111";
          FU_type <= "01";
          rst <= '0';
			 wait for Clock_period;
			 canIwrite1<='0';
          canIwrite2 <= '1';
          availableask <= '1';
          OpIn <= "10" ;
          CDB_V <="00000000000000000000000000000001";
          CDB_Q<= "00000";
			 RF_Qj <="00000";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000001111";
          RF_Vk <= "00000000000000000000001000000000";
			 ViAddress<="00111";
          FU_type <= "01";
          rst <= '0';
			 wait for Clock_period;
			 canIwrite1<='1';
          canIwrite2 <= '1';
          availableask <= '1';
          OpIn <= "01" ;
          CDB_V <="11000000000000000000000000000001";
          CDB_Q<= "01001";
			 RF_Qj <="01001";
          RF_Qk <= "00000";
          RF_Vj<= "00000000000000000000000000001111";
          RF_Vk <= "00000000000000000000001000000000";
			 ViAddress<="00111";
          FU_type <= "01";
          rst <= '0';
      wait;
   end process; 

END;
