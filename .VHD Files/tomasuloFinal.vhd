----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:27:25 04/16/2021 
-- Design Name: 
-- Module Name:    tomasuloFinal - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tomasuloFinal is
    Port ( Clock : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           Issueask : in  STD_LOGIC;
           accepted : out  STD_LOGIC);
end tomasuloFinal;

architecture Behavioral of tomasuloFinal is

component CDB is
    Port ( wannaWrite1 : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				Clock : in  STD_LOGIC;
           V1 : in  STD_LOGIC_VECTOR (31 downto 0);
           V2 : in  STD_LOGIC_VECTOR (31 downto 0);
           V3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (4 downto 0);
           wannaWrite2 : in  STD_LOGIC;
           wannaWrite3 : in  STD_LOGIC;
           answer : out  STD_LOGIC_VECTOR (2 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0);
           Qout : out  STD_LOGIC_VECTOR (4 downto 0);
           ControlOut : out  STD_LOGIC_VECTOR (1 downto 0);
			  WE_RF : out  STD_LOGIC);
end component;

component MUX4of5bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp4 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC_VECTOR(4 downto 0));
end component;


component CompleteRS is
    Port ( canIwrite1 : in  STD_LOGIC;
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
			  QiForIssue: out  STD_LOGIC_VECTOR (4 downto 0);
           AddressOfViArithm : out  STD_LOGIC_VECTOR (4 downto 0);
           wannaWriteArithm : out  STD_LOGIC);
end component;

component RF is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           AwrIns : in  STD_LOGIC_VECTOR (4 downto 0);
           Din_V : in  STD_LOGIC_VECTOR (31 downto 0);
           CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Din_Q_Ins : in  STD_LOGIC_VECTOR (4 downto 0);
           WrEn : in  STD_LOGIC;
           InsWrEn : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
			  RST: in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
			 DoutQ1 : out  STD_LOGIC_VECTOR (4 downto 0);
           DoutQ2 : out  STD_LOGIC_VECTOR (4 downto 0)
);
end component;

component Issue is
    Port ( available : in  STD_LOGIC;
			   issueask: in  STD_LOGIC;
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           QiIn : in  STD_LOGIC_VECTOR (4 downto 0);
           Accepted : out  STD_LOGIC;
           FU_type_out : out  STD_LOGIC_VECTOR (1 downto 0);
           opOut : out  STD_LOGIC_VECTOR (1 downto 0);
           RiOut : out  STD_LOGIC_VECTOR (4 downto 0);
           RjOut : out  STD_LOGIC_VECTOR (4 downto 0);
           RkOut : out  STD_LOGIC_VECTOR (4 downto 0);
           QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
			  availableout : out  STD_LOGIC;
            WERF : out  STD_LOGIC);
end component;

signal sigavailable : STD_LOGIC;
signal sigFU_type_out: STD_LOGIC_VECTOR (1 downto 0);
signal sigopOut : STD_LOGIC_VECTOR (1 downto 0);
signal sigRiOut :STD_LOGIC_VECTOR (4 downto 0);
signal sigRjOut :STD_LOGIC_VECTOR (4 downto 0);
signal sigRkOut :STD_LOGIC_VECTOR (4 downto 0);
signal sigWERF: STD_LOGIC;
signal sigavailableout: STD_LOGIC;
signal sigQiForIssue:STD_LOGIC_VECTOR (4 downto 0);
signal sigQiOut:STD_LOGIC_VECTOR (4 downto 0);
signal sigAddressOfViLogic:STD_LOGIC_VECTOR (4 downto 0);
signal sigAddressOfViArithm:STD_LOGIC_VECTOR (4 downto 0);
signal sigAddForRF:STD_LOGIC_VECTOR (4 downto 0);
signal sigRFDout1:STD_LOGIC_VECTOR (31 downto 0);
signal sigRFDout2:STD_LOGIC_VECTOR (31 downto 0);
signal sigRFDoutQ1:STD_LOGIC_VECTOR (4 downto 0);
signal sigRFDoutQ2:STD_LOGIC_VECTOR (4 downto 0);
signal sigwannaWriteArithm:STD_LOGIC;
signal sigwannaWriteLogic:STD_LOGIC;
signal sigVoutCDB:STD_LOGIC_VECTOR (31 downto 0);
signal sigAnswerCDB:STD_LOGIC_VECTOR (2 downto 0);
signal sigQoutCDB:STD_LOGIC_VECTOR (4 downto 0);
signal sigWE_RFfromCDB:STD_LOGIC;
signal sigControlOutCDB:STD_LOGIC_VECTOR (1 downto 0);
signal sigViLogicRS:STD_LOGIC_VECTOR (31 downto 0);
signal sigQiLogicRS:STD_LOGIC_VECTOR (4 downto 0);
signal sigViArithmRS:STD_LOGIC_VECTOR (31 downto 0);
signal sigQiArithmRS:STD_LOGIC_VECTOR (4 downto 0);

begin

issueModule: Issue 
Port map
( 
available=>sigavailable,
issueask=>Issueask,
FU_type =>FU_type,
QiIn=>sigQiForIssue,
op =>op,
Ri =>Ri,
Rj =>Rj,
Rk =>Rk,
Accepted =>accepted,
FU_type_out =>sigFU_type_out,
opOut =>sigopOut,
RiOut =>sigRiOut,
RjOut =>sigRjOut,
RkOut =>sigRkOut,
QiOut=>sigQiOut,
availableout=>sigavailableout,
WERF=>sigWERF
);



MyMUX4of5Bit:MUX4of5Bit
port map (
Inp1=>sigAddressOfViLogic,
Inp2=>sigAddressOfViArithm,
inp3=>"00000",
Inp4=>"00000",
control=>sigControlOutCDB,
outp=>sigAddForRF
);

RFModule: RF 
Port map(
Ard1 =>sigRjOut,
Ard2 =>sigRkOut,
Awr =>sigAddForRF,
AwrIns =>sigRiOut,
Din_V =>sigVoutCDB,
CDB_Q =>sigQoutCDB,
Din_Q_Ins =>sigQiOut,
WrEn =>sigWE_RFfromCDB,
InsWrEn =>sigWERF,
Clock=>Clock,
RST=>Rst,
Dout1 =>sigRFDout1,
Dout2=>sigRFDout2,
DoutQ1 =>sigRFDoutQ1,
DoutQ2 =>sigRFDoutQ2
);

RSModule: CompleteRS 
Port map( 
canIwrite1 =>sigAnswerCDB(0),
canIwrite2=>sigAnswerCDB(1),
Clock =>Clock,
OpIn =>sigopOut,
CDB_V =>sigVoutCDB,
CDB_Q =>sigQoutCDB,
RF_Qj =>sigRFDoutQ1,
RF_Qk =>sigRFDoutQ2,
RF_Vj =>sigRFDout1,
RF_Vk =>sigRFDout2,
ViAddress =>sigRiOut,
availableask =>sigavailableout,
FU_type =>sigFU_type_out,
rst =>Rst,
answertoAvailable =>sigavailable,
ViLogic =>sigViLogicRS,
QiLogic =>sigQiLogicRS,
AddressOfViLogic =>sigAddressOfViLogic,
wannaWriteLogic =>sigwannaWriteLogic,
ViArithm =>sigViArithmRS,
QiArithm =>sigQiArithmRS,
QiForIssue=>sigQiForIssue,
AddressOfViArithm =>sigAddressOfViArithm,
wannaWriteArithm =>sigwannaWriteArithm
);

CDBModule :CDB 
Port map ( 
wannaWrite1 =>sigwannaWriteLogic,
rst =>Rst,
Clock=>Clock,
V1 =>sigViLogicRS,
V2 =>sigViArithmRS,
V3 =>"00000000000000000000000000000000",
Q1 =>sigQiLogicRS,
Q2 =>sigQiArithmRS,
Q3 =>"00000",
wannaWrite2 =>sigwannaWriteArithm,
wannaWrite3 =>'0',
answer =>sigAnswerCDB,
Vout =>sigVoutCDB,
Qout=>sigQoutCDB,
ControlOut=>sigControlOutCDB,
WE_RF =>sigWE_RFfromCDB);


end Behavioral;

