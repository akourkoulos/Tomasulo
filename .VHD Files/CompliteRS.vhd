----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:32 04/13/2021 
-- Design Name: 
-- Module Name:    CompliteRS - Behavioral 
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

entity CompleteRS is
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
end CompleteRS;


architecture Behavioral of CompleteRS is
signal sigWE1 : STD_LOGIC_VECTOR(6 downto 0);
signal sigWE2 : STD_LOGIC_VECTOR(6 downto 0);
signal sigWE3 : STD_LOGIC_VECTOR(6 downto 0);
signal sigWE4 : STD_LOGIC_VECTOR(6 downto 0);
signal sigWE5 : STD_LOGIC_VECTOR(6 downto 0);
signal sigRst1 : STD_LOGIC_VECTOR(6 downto 0);
signal sigRst2 : STD_LOGIC_VECTOR(6 downto 0);
signal sigRst3 : STD_LOGIC_VECTOR(6 downto 0);
signal sigRst4 : STD_LOGIC_VECTOR(6 downto 0);
signal sigRst5 : STD_LOGIC_VECTOR(6 downto 0);
signal sigBusyOut: STD_LOGIC_VECTOR(4 downto 0);
signal sigOpOut1: STD_LOGIC_VECTOR(1 downto 0);
signal sigOpOut2: STD_LOGIC_VECTOR(1 downto 0);
signal sigOpOut3: STD_LOGIC_VECTOR(1 downto 0);
signal sigOpOut4: STD_LOGIC_VECTOR(1 downto 0);
signal sigOpOut5: STD_LOGIC_VECTOR(1 downto 0);
signal sigVjOut1: STD_LOGIC_VECTOR(31 downto 0);
signal sigVjOut2: STD_LOGIC_VECTOR(31 downto 0);
signal sigVjOut3: STD_LOGIC_VECTOR(31 downto 0);
signal sigVjOut4: STD_LOGIC_VECTOR(31 downto 0);
signal sigVjOut5: STD_LOGIC_VECTOR(31 downto 0);
signal sigVkOut1: STD_LOGIC_VECTOR(31 downto 0);
signal sigVkOut2: STD_LOGIC_VECTOR(31 downto 0);
signal sigVkOut3: STD_LOGIC_VECTOR(31 downto 0);
signal sigVkOut4: STD_LOGIC_VECTOR(31 downto 0);
signal sigVkOut5: STD_LOGIC_VECTOR(31 downto 0);
signal sigQjOut1: STD_LOGIC_VECTOR(4 downto 0);
signal sigQjOut2: STD_LOGIC_VECTOR(4 downto 0);
signal sigQjOut3: STD_LOGIC_VECTOR(4 downto 0);
signal sigQjOut4: STD_LOGIC_VECTOR(4 downto 0);
signal sigQjOut5: STD_LOGIC_VECTOR(4 downto 0);
signal sigQkOut1: STD_LOGIC_VECTOR(4 downto 0);
signal sigQkOut2: STD_LOGIC_VECTOR(4 downto 0);
signal sigQkOut3: STD_LOGIC_VECTOR(4 downto 0);
signal sigQkOut4: STD_LOGIC_VECTOR(4 downto 0);
signal sigQkOut5: STD_LOGIC_VECTOR(4 downto 0);
signal sigQiOut1: STD_LOGIC_VECTOR(4 downto 0);
signal sigQiOut2: STD_LOGIC_VECTOR(4 downto 0);
signal sigQiOut3: STD_LOGIC_VECTOR(4 downto 0);
signal sigQiOut4: STD_LOGIC_VECTOR(4 downto 0);
signal sigQiOut5: STD_LOGIC_VECTOR(4 downto 0);
signal sigViAddressOut1: STD_LOGIC_VECTOR(4 downto 0);
signal sigViAddressOut2: STD_LOGIC_VECTOR(4 downto 0);
signal sigViAddressOut3: STD_LOGIC_VECTOR(4 downto 0);
signal sigViAddressOut4: STD_LOGIC_VECTOR(4 downto 0);
signal sigViAddressOut5: STD_LOGIC_VECTOR(4 downto 0);
signal sigready: STD_LOGIC_VECTOR(4 downto 0);

signal sigRstFU: STD_LOGIC;
signal sigcontrol2: STD_LOGIC_VECTOR(1 downto 0);
signal sigcontrol1: STD_LOGIC;

signal sigMux2of2B: STD_LOGIC_VECTOR(1 downto 0);
signal sigMux2ForViAdd: STD_LOGIC_VECTOR(4 downto 0);
signal sigMux2ForQi : STD_LOGIC_VECTOR(4 downto 0);
signal sigMux2ForVj : STD_LOGIC_VECTOR(31 downto 0);
signal sigMux2ForVk : STD_LOGIC_VECTOR(31 downto 0);
signal sigMux2ForReady : STD_LOGIC;

signal sigMux4of2B: STD_LOGIC_VECTOR(1 downto 0);
signal sigMux4ForViAdd: STD_LOGIC_VECTOR(4 downto 0);
signal sigMux4ForQi : STD_LOGIC_VECTOR(4 downto 0);
signal sigMux4ForVj : STD_LOGIC_VECTOR(31 downto 0);
signal sigMux4ForVk : STD_LOGIC_VECTOR(31 downto 0);
signal sigMux4ForReady : STD_LOGIC;
signal sigFinish: STD_LOGIC;
signal sigFinish1: STD_LOGIC;


component MUX2of1Bit is
    Port ( Inp1 : in  STD_LOGIC;
           Inp2 : in  STD_LOGIC;
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC);
end component;

component MUX2of2bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(1 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(1 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(1 downto 0));
end component;


component MUX2of5bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(4 downto 0));
end component;


component MUX2 is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(31 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component MUX4 is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(31 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR(31 downto 0);
           Inp4 : in  STD_LOGIC_VECTOR(31 downto 0);
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC_VECTOR(31 downto 0));
end component;


component MUX4of5bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp4 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC_VECTOR(4 downto 0));
end component;


component MUX4of2bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(1 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(1 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR(1 downto 0);
           Inp4 : in  STD_LOGIC_VECTOR(1 downto 0);
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC_VECTOR(1 downto 0));
end component;

component MUX4of1bit is
    Port ( Inp1 : in  STD_LOGIC;
           Inp2 : in  STD_LOGIC;
			  Inp3 : in  STD_LOGIC;
           Inp4 : in  STD_LOGIC;
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC);
end component;

component RSControl is
    Port ( Busy : in  STD_LOGIC_VECTOR (4 downto 0);
			  FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
			  available : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           ready : in  STD_LOGIC_VECTOR (4 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  QiForIssue : out  STD_LOGIC_VECTOR (4 downto 0);
           answertoAvailable : out  STD_LOGIC;
           RstFU : out  STD_LOGIC;
           WE1 : out  STD_LOGIC_VECTOR (6 downto 0);
           Rst1 : out  STD_LOGIC_VECTOR (6 downto 0);
			  WE2 : out  STD_LOGIC_VECTOR (6 downto 0);
           Rst2 : out  STD_LOGIC_VECTOR (6 downto 0);
			  WE3 : out  STD_LOGIC_VECTOR (6 downto 0);
           Rst3 : out  STD_LOGIC_VECTOR (6 downto 0);
			  WE4 : out  STD_LOGIC_VECTOR (6 downto 0);
           Rst4 : out  STD_LOGIC_VECTOR (6 downto 0);
			  WE5 : out  STD_LOGIC_VECTOR (6 downto 0);
           Rst5 : out  STD_LOGIC_VECTOR (6 downto 0);
			  control1 : out  STD_LOGIC;
			  control2 : out  STD_LOGIC_VECTOR (1 downto 0));
end component;


component ReservationStation is
    Port ( Clock:in  STD_LOGIC;			  	
			  WE : in  STD_LOGIC_VECTOR (6 downto 0);
           CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
           CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
           Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  Qi: in  STD_LOGIC_VECTOR (4 downto 0);
			  ViAddressIn : in  STD_LOGIC_VECTOR (4 downto 0);
           Rst: in  STD_LOGIC_VECTOR (6 downto 0);
           BusyOut : out  STD_LOGIC;
           OpOut : out  STD_LOGIC_VECTOR (1 downto 0);
           VjOut : out  STD_LOGIC_VECTOR (31 downto 0);
           VkOut : out  STD_LOGIC_VECTOR (31 downto 0);
           QjOut : out  STD_LOGIC_VECTOR (4 downto 0);
           QkOut : out  STD_LOGIC_VECTOR (4 downto 0);
           QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
			  ViAddressOut :out  STD_LOGIC_VECTOR (4 downto 0);
			  ready:out  STD_LOGIC);
end component;

component LogicFU is
    Port ( Clock : in  STD_LOGIC;
			  ready: in  STD_LOGIC; 	 
			  Rst: in  STD_LOGIC;
           canIwrite : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           ViAddressIn : in  STD_LOGIC_VECTOR (4 downto 0);
           Qi : in  STD_LOGIC_VECTOR (4 downto 0);
           ViAddressOut : out  STD_LOGIC_VECTOR (4 downto 0);
           QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0);
           wannaWrite : out  STD_LOGIC;
           finish : out  STD_LOGIC);
end component;

component arithmeticFU is
    Port ( Clock : in  STD_LOGIC;
			  ready: in  STD_LOGIC; 	 
			  Rst: in  STD_LOGIC;
           canIwrite : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           ViAddressIn : in  STD_LOGIC_VECTOR (4 downto 0);
           Qi : in  STD_LOGIC_VECTOR (4 downto 0);
           ViAddressOut : out  STD_LOGIC_VECTOR (4 downto 0);
           QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0);
           wannaWrite : out  STD_LOGIC;
           finish : out  STD_LOGIC);
end component;

begin


RsCon: RSControl 
Port map ( 
Busy => sigBusyOut,
FU_type =>FU_type,
available =>availableask,
rst =>rst,
ready =>sigready,
Qj =>RF_Qj,
Qk =>RF_Qk,
Q =>CDB_Q,
QiForIssue=>QiForIssue,
answertoAvailable=>answertoAvailable,
RstFU =>sigRstFU,
WE1 =>sigWE1,
Rst1 =>sigRst1,
WE2 =>sigWE2,
Rst2  =>sigRst2,
WE3 =>sigWE3,
Rst3  =>sigRst3,
WE4 =>sigWE4,
Rst4  =>sigRst4,
WE5 =>sigWE5,
Rst5  =>sigRst5,
control1 =>sigcontrol1,
control2=> sigcontrol2
);




RS1:ReservationStation 
Port map (
Clock=>Clock,		  	
WE =>sigWE1,
CDB_V =>CDB_V,
CDB_Q =>CDB_Q,
Vj =>RF_Vj,
Vk =>RF_Vk,
op =>opIn,
Qj=>RF_Qj,
Qk=>RF_Qk,
Qi=>"00001",
ViAddressIn=>ViAddress,
Rst=>sigRst1,
BusyOut =>sigBusyOut(0),
OpOut =>sigOpOut1,
VjOut =>sigVjOut1,
VkOut =>sigVkOut1,
QjOut =>sigQjOut1,
QkOut =>sigQkOut1,
QiOut =>sigQiOut1,
ViAddressOut=>sigViAddressOut1,
ready=>sigready(0));

RS2:ReservationStation 
Port map (
Clock=>Clock,		  	
WE =>sigWE2,
CDB_V =>CDB_V,
CDB_Q =>CDB_Q,
Vj =>RF_Vj,
Vk =>RF_Vk,
op =>opIn,
Qj=>RF_Qj,
Qk=>RF_Qk,
Qi=>"00010",
ViAddressIn=>ViAddress,
Rst=>sigRst2,
BusyOut =>sigBusyOut(1),
OpOut =>sigOpOut2,
VjOut =>sigVjOut2,
VkOut =>sigVkOut2,
QjOut =>sigQjOut2,
QkOut =>sigQkOut2,
QiOut =>sigQiOut2,
ViAddressOut=>sigViAddressOut2,
ready=>sigready(1));

RS3:ReservationStation 
Port map (
Clock=>Clock,		  	
WE =>sigWE3,
CDB_V =>CDB_V,
CDB_Q =>CDB_Q,
Vj =>RF_Vj,
Vk =>RF_Vk,
op =>opIn,
Qj=>RF_Qj,
Qk=>RF_Qk,
Qi=>"01001",
ViAddressIn=>ViAddress,
Rst=>sigRst3,
BusyOut =>sigBusyOut(2),
OpOut =>sigOpOut3,
VjOut =>sigVjOut3,
VkOut =>sigVkOut3,
QjOut =>sigQjOut3,
QkOut =>sigQkOut3,
QiOut =>sigQiOut3,
ViAddressOut=>sigViAddressOut3,
ready=>sigready(2));

RS4:ReservationStation 
Port map (
Clock=>Clock,		  	
WE =>sigWE4,
CDB_V =>CDB_V,
CDB_Q =>CDB_Q,
Vj =>RF_Vj,
Vk =>RF_Vk,
op =>opIn,
Qj=>RF_Qj,
Qk=>RF_Qk,
Qi=>"01010",
ViAddressIn=>ViAddress,
Rst=>sigRst4,
BusyOut =>sigBusyOut(3),
OpOut =>sigOpOut4,
VjOut =>sigVjOut4,
VkOut =>sigVkOut4,
QjOut =>sigQjOut4,
QkOut =>sigQkOut4,
QiOut =>sigQiOut4,
ViAddressOut=>sigViAddressOut4,
ready=>sigready(3));



RS5:ReservationStation 
Port map (
Clock=>Clock,		  	
WE =>sigWE5,
CDB_V =>CDB_V,
CDB_Q =>CDB_Q,
Vj =>RF_Vj,
Vk =>RF_Vk,
op =>opIn,
Qj=>RF_Qj,
Qk=>RF_Qk,
Qi=>"01011",
ViAddressIn=>ViAddress,
Rst=>sigRst5,
BusyOut =>sigBusyOut(4),
OpOut =>sigOpOut5,
VjOut =>sigVjOut5,
VkOut =>sigVkOut5,
QjOut =>sigQjOut5,
QkOut =>sigQkOut5,
QiOut =>sigQiOut5,
ViAddressOut=>sigViAddressOut5,
ready=>sigready(4));

Mux2of2B:Mux2of2bit
port map(
inp1=>sigOpOut1,
inp2=>sigOpOut2,
Control=>sigcontrol1,
Outp=>sigMux2of2B
);

Mux2of5B:Mux2of5bit
port map(
inp1=>sigViAddressOut1,
inp2=>sigViAddressOut2,
Control=>sigcontrol1,
Outp=>sigMux2ForViAdd
);

Mux2ofQi:Mux2of5bit
port map(
inp1=>sigQiOut1,
inp2=>sigQiOut2,
Control=>sigcontrol1,
Outp=>sigMux2ForQi
);

Mux2ofVj:Mux2
port map(
inp1=>sigVjOut1,
inp2=>sigVjOut2,
Control=>sigcontrol1,
Outp=>sigMux2ForVj
);

Mux2ofVk:Mux2
port map(
inp1=>sigVkOut1,
inp2=>sigVkOut2,
Control=>sigcontrol1,
Outp=>sigMux2ForVk
);

Mux2ofReady:Mux2of1Bit
port map(
inp1=>sigready(0),
inp2=>sigready(1),
Control=>sigcontrol1,
Outp=>sigMux2ForReady
);







Mux4of2B:Mux4of2bit
port map(
inp1=>sigOpOut3,
inp2=>sigOpOut4,
inp3=>sigOpOut5,
inp4=>"00",
Control=>sigcontrol2,
Outp=>sigMux4of2B
);

Mux4of5B:Mux4of5bit
port map(
inp1=>sigViAddressOut3,
inp2=>sigViAddressOut4,
inp3=>sigViAddressOut5,
inp4=>"00000",
Control=>sigcontrol2,
Outp=>sigMux4ForViAdd
);

Mux4ofQi:Mux4of5bit
port map(
inp1=>sigQiOut3,
inp2=>sigQiOut4,
inp3=>sigQiOut5,
inp4=>"00000",
Control=>sigcontrol2,
Outp=>sigMux4ForQi
);

Mux4ofVj:Mux4
port map(
inp1=>sigVjOut3,
inp2=>sigVjOut4,
inp3=>sigVjOut5,
inp4=>"00000000000000000000000000000000",
Control=>sigcontrol2,
Outp=>sigMux4ForVj
);

Mux4ofVk:Mux4
port map(
inp1=>sigVkOut3,
inp2=>sigVkOut4,
inp3=>sigVkOut5,
inp4=>"00000000000000000000000000000000",
Control=>sigcontrol2,
Outp=>sigMux4ForVk
);

Mux4ofReady:Mux4of1Bit
port map(
inp1=>sigready(2),
inp2=>sigready(3),
inp3=>sigready(4),
inp4=>'0',
Control=>sigcontrol2,
Outp=>sigMux4ForReady
);

MyLogicFU: LogicFU 
Port map (
Clock =>Clock ,
ready=>sigMux2ForReady,
Rst=>sigRstFU,
canIwrite =>canIwrite1,
op =>sigMux2of2B,
Vj =>sigMux2ForVj,
Vk =>sigMux2ForVk,
ViAddressIn =>sigMux2ForViAdd,
Qi =>sigMux2ForQi,
ViAddressOut =>AddressOfViLogic,
QiOut=>QiLogic,
Vout =>ViLogic,
wannaWrite =>wannaWriteLogic,
finish =>sigFinish
);

MyarithmeticFU: arithmeticFU 
Port map (
Clock =>Clock ,
ready=>sigMux4ForReady,
Rst=>sigRstFU,
canIwrite =>canIwrite2,
op =>sigMux4of2B,
Vj =>sigMux4ForVj,
Vk =>sigMux4ForVk,
ViAddressIn =>sigMux4ForViAdd,
Qi =>sigMux4ForQi,
ViAddressOut =>AddressOfViarithm,
QiOut=>Qiarithm,
Vout =>Viarithm,
wannaWrite =>wannaWritearithm,
finish =>sigFinish1
);

end Behavioral;

