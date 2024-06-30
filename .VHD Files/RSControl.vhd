----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:53 04/13/2021 
-- Design Name: 
-- Module Name:    RSControl - Behavioral 
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

entity RSControl is
    Port ( Busy : in  STD_LOGIC_VECTOR (4 downto 0);
			  FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
			  available : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           ready : in  STD_LOGIC_VECTOR (4 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           Q : in  STD_LOGIC_VECTOR (4 downto 0);
           answertoAvailable : out  STD_LOGIC;
           RstFU : out  STD_LOGIC;
			  QiForIssue : out  STD_LOGIC_VECTOR (4 downto 0);
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
end RSControl;

architecture Behavioral of RSControl is

begin
process (rst,Busy,FU_type,ready,Qj,Qk,Q ,available)
begin

if(rst='1') then
Rst1<="1111111";
Rst2<="1111111";
Rst3<="1111111";
Rst4<="1111111";
Rst5<="1111111";
RstFU<='1';
else
Rst1<="0000000";
Rst2<="0000000";
Rst3<="0000000";
Rst4<="0000000";
Rst5<="0000000";
WE1<="0000000";
WE2<="0000000";
WE3<="0000000";
WE4<="0000000";
WE5<="0000000";
RstFU<='0';

if(available='1') then

if(FU_type ="00") then

if( Busy(0)='0') then
QiForIssue<="00001"after 0.001 ns;
answertoAvailable<='1' after 0.001 ns ;
WE1(0)<='1' after 0.001 ns;
WE1(1)<='1' after 0.001 ns;
if(Qj="00000")then
WE1(2)<='1' after 0.001 ns;
WE1(4)<='0' after 0.001 ns;
else
WE1(2)<='0' after 0.001 ns;
WE1(4)<='1' after 0.001 ns;
end if;
if(Qk<="00000")then
WE1(3)<='1' after 0.001 ns;
WE1(5)<='0' after 0.001 ns;
else
WE1(3)<='0' after 0.001 ns;
WE1(5)<='1' after 0.001 ns;
end if;
WE1(6)<='1' after 0.001 ns;

elsif( Busy(1)='0') then
QiForIssue<="00010"after 0.001 ns;
answertoAvailable<='1' after 0.001 ns;
WE2(0)<='1' after 0.001 ns;
WE2(1)<='1' after 0.001 ns;
if(Qj="00000")then
WE2(2)<='1' after 0.001 ns;
WE2(4)<='0' after 0.001 ns;
else
WE2(2)<='0' after 0.001 ns;
WE2(4)<='1' after 0.001 ns;
end if;
if(Qk="00000")then
WE2(3)<='1' after 0.001 ns;
WE2(5)<='0' after 0.001 ns;
else
WE2(3)<='0' after 0.001 ns;
WE2(5)<='1' after 0.001 ns;
end if;
WE2(6)<='1' after 0.001 ns;
else
answertoAvailable<='0' after 0.001 ns;
QiForIssue<="00000"after 0.001 ns;

end if;

elsif(FU_type ="01") then


if( Busy(2)='0') then
QiForIssue<="01001"after 0.001 ns;
answertoAvailable<='1' after 0.001 ns;
WE3(0)<='1' after 0.001 ns;
WE3(1)<='1' after 0.001 ns;
if(Qj="00000")then
WE3(2)<='1' after 0.001 ns;
WE3(4)<='0' after 0.001 ns;
else
WE3(2)<='0' after 0.001 ns;
WE3(4)<='1' after 0.001 ns;
end if;
if(Qk="00000")then
WE3(3)<='1' after 0.001 ns;
WE3(5)<='0' after 0.001 ns;
else
WE3(3)<='0' after 0.001 ns;
WE3(5)<='1' after 0.001 ns;
end if;
WE3(6)<='1' after 0.001 ns;

elsif( Busy(3)='0') then
QiForIssue<="01010"after 0.001 ns;
answertoAvailable<='1' after 0.001 ns;
WE4(0)<='1' after 0.001 ns;
WE4(1)<='1' after 0.001 ns;
if(Qj="00000")then
WE4(2)<='1' after 0.001 ns;
WE4(4)<='0' after 0.001 ns;
else
WE4(2)<='0' after 0.001 ns;
WE4(4)<='1' after 0.001 ns;
end if;
if(Qk="00000")then
WE4(3)<='1' after 0.001 ns;
WE4(5)<='0' after 0.001 ns;
else
WE4(3)<='0' after 0.001 ns;
WE4(5)<='1' after 0.001 ns;
end if;
WE4(6)<='1' after 0.001 ns;

elsif( Busy(4)='0') then
QiForIssue<="01011"after 0.001 ns;
answertoAvailable<='1' after 0.001 ns;
WE5(0)<='1' after 0.001 ns;
WE5(1)<='1' after 0.001 ns;
if(Qj="00000")then
WE5(2)<='1' after 0.001 ns;
WE5(4)<='0' after 0.001 ns;
else
WE5(2)<='0' after 0.001 ns;
WE5(4)<='1' after 0.001 ns;
end if;
if(Qk="00000")then
WE5(3)<='1' after 0.001 ns;
WE5(5)<='0' after 0.001 ns;
else
WE5(3)<='0' after 0.001 ns;
WE5(5)<='1' after 0.001 ns;
end if;
WE5(6)<='1' after 0.001 ns;
else
answertoAvailable<='0' after 0.001 ns;
QiForIssue<="00000"after 0.001 ns;
end if;

else
answertoAvailable<='0' after 0.001 ns;
QiForIssue<="00000"after 0.001 ns;

end if;

else
answertoAvailable<='0' after 0.001 ns;
QiForIssue<="00000"after 0.001 ns;

end if;


if(Q="00001")then
Rst1(0)<='1' after 0.001 ns;
elsif(Q="00010")then
Rst2(0)<='1' after 0.001 ns;
elsif(Q="01001")then
Rst3(0)<='1' after 0.001 ns;
elsif(Q="01010")then
Rst4(0)<='1' after 0.001 ns;
elsif(Q="01011")then
Rst5(0)<='1' after 0.001 ns;
else
Rst1(0)<='0' after 0.001 ns;
Rst2(0)<='0' after 0.001 ns;
Rst3(0)<='0' after 0.001 ns;
Rst4(0)<='0' after 0.001 ns;
Rst5(0)<='0' after 0.001 ns;
end if;

if(ready(0)='1')then
control1<='0' after 0.001 ns;
Rst1<="1111110" after 0.001 ns;
elsif(ready(1)='1')then
control1<='1' after 0.001 ns;
Rst2<="1111110" after 0.001 ns;
else
control1<='0' after 0.001 ns;
end if;

if(ready(2)='1')then
control2<="00" after 0.001 ns;
Rst3<="1111110" after 0.001 ns;
elsif(ready(3)='1')then
control2<="01" after 0.001 ns;
Rst4<="1111110" after 0.001 ns;
elsif(ready(4)='1')then
control2<="10" after 0.001 ns;
Rst5<="1111110" after 0.001 ns;
else 
control2<="00" after 0.001 ns;
end if;


end if;

end process;




end Behavioral;

