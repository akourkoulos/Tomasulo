----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:26 02/28/2020 
-- Design Name: 
-- Module Name:    RF - Behavioral 
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

entity RF is
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
end RF;



architecture Behavioral of RF is

component regi5 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component MUX2of5bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(4 downto 0));
end component;



component regi32 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MuxBig5bit  is
		Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           Inp0 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp4 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp5 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp6 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp7 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp8 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp9 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp10 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp11 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp12 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp13 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp14 : in  STD_LOGIC_VECTOR ( 4 downto 0);
			  Inp15 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp16 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp17 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp18 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp19 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp20 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp21 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp22 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp23 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp24 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp25 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp26 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp27 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp28 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp29 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp30 : in  STD_LOGIC_VECTOR (4 downto 0);
			  Inp31 : in  STD_LOGIC_VECTOR (4 downto 0);
           Outp : out  STD_LOGIC_VECTOR (4 downto 0));
end component ;

component MuxBig is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           Inp0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component ;

component Decoder is
    Port ( Inp : in  STD_LOGIC_VECTOR (4 downto 0);
           Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

type RegSig is array(0 to 31) of std_logic_vector(31 downto 0);
type SMux is array(0 to 31) of std_logic_vector(4 downto 0);
type RegSigQ is array(0 to 31) of std_logic_vector(4 downto 0);

signal sigDec:STD_LOGIC_VECTOR (31 downto 0);
signal sigDecQ:STD_LOGIC_VECTOR (31 downto 0);
signal sigDecQIns:STD_LOGIC_VECTOR (31 downto 0);
signal sigregi:RegSig;
signal sigregiQ:RegSigQ;
signal sigmuxQ:SMux;
signal sigout1:STD_LOGIC_VECTOR (31 downto 0);
signal sigout2:STD_LOGIC_VECTOR (31 downto 0);
signal sigoutQ1:STD_LOGIC_VECTOR (4 downto 0);
signal sigoutQ2:STD_LOGIC_VECTOR (4 downto 0);
signal sigoutQ3:STD_LOGIC_VECTOR (4 downto 0);
signal sigWEForQ:STD_LOGIC;
signal sigcontrolmuxQ:STD_LOGIC_VECTOR (31 downto 0);

begin 

DEC:Decoder
port map(
Inp=>Awr,
Outp=>sigDec
);

R0:regi32
port map(
Clock=>Clock,
WE=>'1',
RST=>RST,
DataIn=>"00000000000000000000000000000000",
DataOut=>sigregi(0)
);

GEN1:
for i in 1 to 31 generate

R:regi32
port map(
Clock=>Clock,
WE=>sigDec(i)and WrEn and sigWEForQ,
RST=>RST, 
DataIn=>Din_V ,
DataOut=>sigregi(i)
);

end generate GEN1;


M1:MuxBig
port map(
Inp0=>sigregi(0),
Inp1=>sigregi(1),
Inp2=>sigregi(2),
Inp3=>sigregi(3),
Inp4=>sigregi(4),
Inp5=>sigregi(5),
Inp6=>sigregi(6),
Inp7=>sigregi(7),
Inp8=>sigregi(8),
Inp9=>sigregi(9),
Inp10=>sigregi(10),
Inp11=>sigregi(11),
Inp12=>sigregi(12),
Inp13=>sigregi(13),
Inp14=>sigregi(14),
Inp15=>sigregi(15),
Inp16=>sigregi(16),
Inp17=>sigregi(17),
Inp18=>sigregi(18),
Inp19=>sigregi(19),
Inp20=>sigregi(20),
Inp21=>sigregi(21),
Inp22=>sigregi(22),
Inp23=>sigregi(23),
Inp24=>sigregi(24),
Inp25=>sigregi(25),
Inp26=>sigregi(26),
Inp27=>sigregi(27),
Inp28=>sigregi(28),
Inp29=>sigregi(29),
Inp30=>sigregi(30),
Inp31=>sigregi(31),
A=>Ard1,
Outp=>sigout1
);

M2:MuxBig
port map(
Inp0=>sigregi(0),
Inp1=>sigregi(1),
Inp2=>sigregi(2),
Inp3=>sigregi(3),
Inp4=>sigregi(4),
Inp5=>sigregi(5),
Inp6=>sigregi(6),
Inp7=>sigregi(7),
Inp8=>sigregi(8),
Inp9=>sigregi(9),
Inp10=>sigregi(10),
Inp11=>sigregi(11),
Inp12=>sigregi(12),
Inp13=>sigregi(13),
Inp14=>sigregi(14),
Inp15=>sigregi(15),
Inp16=>sigregi(16),
Inp17=>sigregi(17),
Inp18=>sigregi(18),
Inp19=>sigregi(19),
Inp20=>sigregi(20),
Inp21=>sigregi(21),
Inp22=>sigregi(22),
Inp23=>sigregi(23),
Inp24=>sigregi(24),
Inp25=>sigregi(25),
Inp26=>sigregi(26),
Inp27=>sigregi(27),
Inp28=>sigregi(28),
Inp29=>sigregi(29),
Inp30=>sigregi(30),
Inp31=>sigregi(31),
A=>Ard2,
Outp=>sigout2
);

Dout1<=Din_V  when Ard1=Awr else
sigout1;

Dout2<=Din_V  when Ard2=Awr else
sigout2;


sigcontrolmuxQ(1)<='1' when AwrIns="00001" else
'0';
sigcontrolmuxQ(2)<='1' when AwrIns="00010" else
'0';
sigcontrolmuxQ(3)<='1' when AwrIns="00011" else
'0';
sigcontrolmuxQ(4)<='1' when AwrIns="00100" else
'0';
sigcontrolmuxQ(5)<='1' when AwrIns="00101" else
'0';
sigcontrolmuxQ(6)<='1' when AwrIns="00110" else
'0';
sigcontrolmuxQ(7)<='1' when AwrIns="00111" else
'0';
sigcontrolmuxQ(8)<='1' when AwrIns="01000" else
'0';
sigcontrolmuxQ(9)<='1' when AwrIns="01001" else
'0';
sigcontrolmuxQ(10)<='1' when AwrIns="01010" else
'0';
sigcontrolmuxQ(11)<='1' when AwrIns="01011" else
'0';
sigcontrolmuxQ(12)<='1' when AwrIns="01100" else
'0';
sigcontrolmuxQ(13)<='1' when AwrIns="01101" else
'0';
sigcontrolmuxQ(14)<='1' when AwrIns="01110" else
'0';
sigcontrolmuxQ(15)<='1' when AwrIns="01111" else
'0';
sigcontrolmuxQ(16)<='1' when AwrIns="10000" else
'0';
sigcontrolmuxQ(17)<='1' when AwrIns="10001" else
'0';
sigcontrolmuxQ(18)<='1' when AwrIns="10010" else
'0';
sigcontrolmuxQ(19)<='1' when AwrIns="10011" else
'0';
sigcontrolmuxQ(20)<='1' when AwrIns="10100" else
'0';
sigcontrolmuxQ(21)<='1' when AwrIns="10101" else
'0';
sigcontrolmuxQ(22)<='1' when AwrIns="10110" else
'0';
sigcontrolmuxQ(23)<='1' when AwrIns="10111" else
'0';
sigcontrolmuxQ(24)<='1' when AwrIns="11000" else
'0';
sigcontrolmuxQ(25)<='1' when AwrIns="11001" else
'0';
sigcontrolmuxQ(26)<='1' when AwrIns="11010" else
'0';
sigcontrolmuxQ(27)<='1' when AwrIns="11011" else
'0';
sigcontrolmuxQ(28)<='1' when AwrIns="11100" else
'0';
sigcontrolmuxQ(29)<='1' when AwrIns="11101" else
'0';
sigcontrolmuxQ(30)<='1' when AwrIns="11110" else
'0';
sigcontrolmuxQ(31)<='1' when AwrIns="11111" else
'0';



DECQ:Decoder
port map(
Inp=>Awr,
Outp=>sigDecQ
);

DECQIns:Decoder
port map(
Inp=>AwrIns,
Outp=>sigDecQIns
);

R0Q:regi5
port map(
Clock=>Clock,
WE=>'1',
RST=>RST,
DataIn=>"00000",
DataOut=>sigregiQ(0)
);

GEN2:
for i in 1 to 31 generate

MUX2Q:MUX2of5bit
port map 
(
Inp1=>"00000",
Inp2=>Din_Q_Ins,
control=>sigcontrolmuxQ(i),
outp=> sigmuxQ(i)
);

RQ:regi5
port map(
Clock=>Clock,
WE=>(sigDecQ(i)and WrEn and sigWEForQ)or(sigDecQIns(i)and InsWrEn),
RST=>RST, 
DataIn=>sigmuxQ(i),
DataOut=>sigregiQ(i)
);

end generate GEN2;


M1Q:MuxBig5bit
port map(
Inp0=>sigregiQ(0),
Inp1=>sigregiQ(1),
Inp2=>sigregiQ(2),
Inp3=>sigregiQ(3),
Inp4=>sigregiQ(4),
Inp5=>sigregiQ(5),
Inp6=>sigregiQ(6),
Inp7=>sigregiQ(7),
Inp8=>sigregiQ(8),
Inp9=>sigregiQ(9),
Inp10=>sigregiQ(10),
Inp11=>sigregiQ(11),
Inp12=>sigregiQ(12),
Inp13=>sigregiQ(13),
Inp14=>sigregiQ(14),
Inp15=>sigregiQ(15),
Inp16=>sigregiQ(16),
Inp17=>sigregiQ(17),
Inp18=>sigregiQ(18),
Inp19=>sigregiQ(19),
Inp20=>sigregiQ(20),
Inp21=>sigregiQ(21),
Inp22=>sigregiQ(22),
Inp23=>sigregiQ(23),
Inp24=>sigregiQ(24),
Inp25=>sigregiQ(25),
Inp26=>sigregiQ(26),
Inp27=>sigregiQ(27),
Inp28=>sigregiQ(28),
Inp29=>sigregiQ(29),
Inp30=>sigregiQ(30),
Inp31=>sigregiQ(31),
A=>Ard1,
Outp=>sigoutQ1
);

M2Q:MuxBig5bit
port map(
Inp0=>sigregiQ(0),
Inp1=>sigregiQ(1),
Inp2=>sigregiQ(2),
Inp3=>sigregiQ(3),
Inp4=>sigregiQ(4),
Inp5=>sigregiQ(5),
Inp6=>sigregiQ(6),
Inp7=>sigregiQ(7),
Inp8=>sigregiQ(8),
Inp9=>sigregiQ(9),
Inp10=>sigregiQ(10),
Inp11=>sigregiQ(11),
Inp12=>sigregiQ(12),
Inp13=>sigregiQ(13),
Inp14=>sigregiQ(14),
Inp15=>sigregiQ(15),
Inp16=>sigregiQ(16),
Inp17=>sigregiQ(17),
Inp18=>sigregiQ(18),
Inp19=>sigregiQ(19),
Inp20=>sigregiQ(20),
Inp21=>sigregiQ(21),
Inp22=>sigregiQ(22),
Inp23=>sigregiQ(23),
Inp24=>sigregiQ(24),
Inp25=>sigregiQ(25),
Inp26=>sigregiQ(26),
Inp27=>sigregiQ(27),
Inp28=>sigregiQ(28),
Inp29=>sigregiQ(29),
Inp30=>sigregiQ(30),
Inp31=>sigregiQ(31),
A=>Ard2,
Outp=>sigoutQ2
);


M3Q:MuxBig5bit
port map(
Inp0=>sigregiQ(0),
Inp1=>sigregiQ(1),
Inp2=>sigregiQ(2),
Inp3=>sigregiQ(3),
Inp4=>sigregiQ(4),
Inp5=>sigregiQ(5),
Inp6=>sigregiQ(6),
Inp7=>sigregiQ(7),
Inp8=>sigregiQ(8),
Inp9=>sigregiQ(9),
Inp10=>sigregiQ(10),
Inp11=>sigregiQ(11),
Inp12=>sigregiQ(12),
Inp13=>sigregiQ(13),
Inp14=>sigregiQ(14),
Inp15=>sigregiQ(15),
Inp16=>sigregiQ(16),
Inp17=>sigregiQ(17),
Inp18=>sigregiQ(18),
Inp19=>sigregiQ(19),
Inp20=>sigregiQ(20),
Inp21=>sigregiQ(21),
Inp22=>sigregiQ(22),
Inp23=>sigregiQ(23),
Inp24=>sigregiQ(24),
Inp25=>sigregiQ(25),
Inp26=>sigregiQ(26),
Inp27=>sigregiQ(27),
Inp28=>sigregiQ(28),
Inp29=>sigregiQ(29),
Inp30=>sigregiQ(30),
Inp31=>sigregiQ(31),
A=>Awr,
Outp=>sigoutQ3
);

sigWEForQ<='1' when CDB_Q=sigoutQ3 else
'0';

DoutQ1<= "00000"when Awr=Ard1 and sigWEForQ='1' and WrEn='1'  else
sigoutQ1;

DoutQ2<= "00000"when Awr=Ard2 and sigWEForQ='1' and WrEn='1' else
sigoutQ2;

end Behavioral;
