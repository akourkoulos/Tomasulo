----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:02 04/12/2021 
-- Design Name: 
-- Module Name:    LogicFU - Behavioral 
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmeticFU is
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
end arithmeticFU;

architecture Behavioral of arithmeticFU is
signal sigCalculVout :STD_LOGIC_VECTOR (31 downto 0);
signal sigregi1 :STD_LOGIC_VECTOR (31 downto 0);
signal sigregi2 :STD_LOGIC_VECTOR (31 downto 0);
signal sigregi3 :STD_LOGIC_VECTOR (31 downto 0);

signal sigask1 :STD_LOGIC;
signal sigask2 :STD_LOGIC;
signal sigask3 :STD_LOGIC;

signal sigWE :STD_LOGIC;
signal sigQi1 :STD_LOGIC_VECTOR (4 downto 0);
signal sigQi2 :STD_LOGIC_VECTOR (4 downto 0);
signal sigQi3 :STD_LOGIC_VECTOR (4 downto 0);

signal sigViAddress1 :STD_LOGIC_VECTOR (4 downto 0);
signal sigViAddress2 :STD_LOGIC_VECTOR (4 downto 0);
signal sigViAddress3 :STD_LOGIC_VECTOR (4 downto 0);



component regi5 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component regi32 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component regi1 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
end component;


begin

sigCalculVout<=std_logic_vector (signed (Vj) + signed(Vk)) when op="00" else
std_logic_vector (signed (Vj) - signed(Vk)) when op="01" else
std_logic_vector(shift_left(unsigned (Vj),to_integer(unsigned(Vk)))) ;


sigWE<='0' when canIwrite='0' and sigask3='1' else
'1' when canIwrite='0' and sigask3='0' else
'1';

Qiregi1:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>Qi,
DataOut =>sigQi1
);

Qirgi2:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigQi1,
DataOut =>sigQi2
);

Qirgi3:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigQi2,
DataOut =>sigQi3
);

ViAddrregi1:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>ViAddressIn,
DataOut =>sigViAddress1
);

ViAddrregi2:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigViAddress1,
DataOut =>sigViAddress2
);

ViAddrregi3:regi5
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigViAddress2,
DataOut =>sigViAddress3
);


askregi1:regi1
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>ready,
DataOut =>sigask1
);

askregi2:regi1
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigask1,
DataOut =>sigask2
);

askregi3:regi1
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigask2,
DataOut =>sigask3
);
		
myregi1:regi32
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigCalculVout,
DataOut =>sigregi1
);

myregi2:regi32
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigregi1,
DataOut =>sigregi2
);

myregi3:regi32
port map(
Clock =>Clock,
RST =>Rst,
WE =>sigWE,
DataIn=>sigregi2,
DataOut =>sigregi3
);
wannaWrite<=sigask3;
Vout<=sigregi3;
ViAddressOut<=sigViAddress3;
Qiout<=sigQi3;

end Behavioral;

