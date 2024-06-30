----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:45 04/05/2021 
-- Design Name: 
-- Module Name:    ReservationStation - Behavioral 
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

entity ReservationStation is
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
end ReservationStation;

architecture Behavioral of ReservationStation is
signal sigoutop:STD_LOGIC_VECTOR (1 downto 0);
signal sigoutbusy:STD_LOGIC;
signal sigmux1 :STD_LOGIC_VECTOR (31 downto 0);
signal sigoutVj:STD_LOGIC_VECTOR (31 downto 0);
signal sigmux2 :STD_LOGIC_VECTOR (31 downto 0);
signal sigoutVk:STD_LOGIC_VECTOR (31 downto 0);
signal sigoutQk:STD_LOGIC_VECTOR (4 downto 0);
signal sigoutQj:STD_LOGIC_VECTOR (4 downto 0);
signal sigViAddressOut:STD_LOGIC_VECTOR (4 downto 0);
signal sigcontrolj:STD_LOGIC;
signal sigcontrolk:STD_LOGIC;
signal sigRstQj:STD_LOGIC;
signal sigRstQk:STD_LOGIC;
signal sigRstWEVk:STD_LOGIC;
signal sigRstWEVj:STD_LOGIC;


component MUX2 is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(31 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(31 downto 0));
end component;

component regi1 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
end component;

component regi32 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component regi5 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component regi2 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (1 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

begin

regiOp:regi2
port map (
				Clock =>Clock,
           RST =>Rst(1),
           WE =>WE(1),
           DataIn=>op,
           DataOut =>sigoutop
);

regiQj:regi5
port map (
				Clock =>Clock,
           RST =>Rst(4) or sigRstQj,
           WE =>WE(4),
           DataIn=>Qj,
           DataOut =>sigoutQj
);

regiQk:regi5
port map (
				Clock =>Clock,
           RST =>Rst(5)or sigRstQk,
           WE =>WE(5),
           DataIn=>Qk,
           DataOut =>sigoutQk
);


sigcontrolj<='0' when ( CDB_Q = sigoutQj and (not (CDB_Q="00000")) ) else
'1';
sigRstQj<='1' when ( CDB_Q=sigoutQj and (not (CDB_Q="00000"))) else
'0';
sigRstWEVj<='1' when ( CDB_Q=sigoutQj and (not (CDB_Q="00000"))) else
'0';

sigcontrolk<='0' when ( CDB_Q=sigoutQk and (not (CDB_Q="00000"))) else
'1';
sigRstQk<='1' when ( CDB_Q=sigoutQk and (not (CDB_Q="00000")))  else
'0';
sigRstWEVk<='1' when ( CDB_Q=sigoutQk and (not (CDB_Q="00000"))) else
'0';

Mymux1:MUX2
port map(
				Inp1 =>CDB_V,
           Inp2 =>Vj,
			  Control=>sigcontrolj,
           Outp =>sigmux1
);

regiVj:regi32
port map (
				Clock =>Clock,
           RST =>Rst(2),
           WE =>WE(2) or sigRstWEVj,
           DataIn=>sigmux1,
           DataOut =>sigoutVj
);

Mymux2:MUX2
port map(
				Inp1 =>CDB_V,
           Inp2 =>Vk,
			  Control=>sigcontrolk,
           Outp =>sigmux2
);

regiVk:regi32
port map (
				Clock =>Clock,
           RST =>Rst(3),
           WE =>WE(3) or sigRstWEVk,
           DataIn=>sigmux2,
           DataOut =>sigoutVk
);


regiViAddress:regi5
port map (
				Clock =>Clock,
           RST =>Rst(6),
           WE =>WE(6),
           DataIn=>ViAddressIn,
           DataOut =>sigViAddressOut
);

regiBusy:regi1
port map (
				Clock =>Clock,
           RST =>Rst(0),
           WE =>WE(0),
           DataIn=>WE(0),
           DataOut =>sigoutbusy
);


BusyOut<=sigoutbusy;
OpOut <=sigoutop;
VjOut <=sigoutVj;
VkOut <=sigoutVk;
QjOut <=sigoutQj;
QkOut <=sigoutQk;
ViAddressOut<=sigViAddressOut;

ready<='1' when(sigoutQk="00000" and sigoutQj="00000" and (not (sigViAddressOut="00000"))) else
'0' ;
Qiout<=Qi when(sigoutQk="00000" and sigoutQj="00000" and (not (sigViAddressOut="00000"))) else
"00000" ;

end Behavioral;

