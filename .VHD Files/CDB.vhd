----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:33 04/14/2021 
-- Design Name: 
-- Module Name:    CDB - Behavioral 
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

entity CDB is
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
end CDB;

	architecture Behavioral of CDB is
signal sigWE: STD_LOGIC;
signal siganswer: STD_LOGIC_VECTOR(2 downto 0);
signal sigregiIn: STD_LOGIC_VECTOR(1 downto 0);
signal sigregiOut: STD_LOGIC_VECTOR(1 downto 0);
signal sigMux2Vout : STD_LOGIC_VECTOR(31 downto 0);
signal sigMux2Qout: STD_LOGIC_VECTOR(4 downto 0);
signal sigControlOut: STD_LOGIC_VECTOR(1 downto 0);

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

component regi2 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

begin

Helpregi2:regi2
Port map 
(
Clock=>Clock,
RST =>rst,
WE =>'1',
DataIn => sigregiIn,
DataOut => sigregiOut
);

sigregiIn<="00" when sigregiOut="01" else
"10" when  sigregiOut="11" else
"00" when sigregiOut="10" else
"01"when wannaWrite1='1' and wannaWrite2='1' and wannaWrite3='0' and sigregiOut="00"else
"10"when wannaWrite1='1' and wannaWrite2='0' and wannaWrite3='1' and sigregiOut="00" else
"10"when wannaWrite1='0' and wannaWrite2='1' and wannaWrite3='1' and sigregiOut="00" else
"11"when wannaWrite1='1' and wannaWrite2='1' and wannaWrite3='1' and sigregiOut="00" else
"00";


siganswer <=  "010" when sigregiOut="01"else
"100" when sigregiOut="10"else
"010" when sigregiOut="11"else
"001" when wannaWrite1='1' else
"010" when wannaWrite2='1' else
"100" when wannaWrite3='1' else
"000";

sigControlOut <= "00" when siganswer="001" else
"01" when siganswer="010" else
"10" when siganswer="100" else
"11";

WE_RF<='0' when siganswer="000" else
'1';

MUX4V: MUX4 
Port map ( 
Inp1=>V1,
Inp2=>V2,
Inp3 =>V3,
Inp4 =>"00000000000000000000000000000000",
Control=>sigControlOut,
Outp=>sigMux2Vout
);

MUX4Q: MUX4of5bit 
Port map ( 
Inp1=>Q1,
Inp2=>Q2,
Inp3 =>Q3,
Inp4 =>"00000",
Control=>sigControlOut,
Outp=>sigMux2Qout
);

Vout<=sigMux2Vout;
Qout<=sigMux2Qout;

answer<=siganswer;
ControlOut<=sigControlOut;

end Behavioral;

