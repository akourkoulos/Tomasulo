----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:20 04/15/2021 
-- Design Name: 
-- Module Name:    Issue - Behavioral 
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

entity Issue is
    Port ( available : in  STD_LOGIC;
				QiIn : in  STD_LOGIC_VECTOR (4 downto 0);
			  issueask : in  STD_LOGIC;
           FU_type : in  STD_LOGIC_VECTOR (1 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (4 downto 0);
           Rk : in  STD_LOGIC_VECTOR (4 downto 0);
           Accepted : out  STD_LOGIC;
			  availableout : out  STD_LOGIC;
           FU_type_out : out  STD_LOGIC_VECTOR (1 downto 0);
           opOut : out  STD_LOGIC_VECTOR (1 downto 0);
			  QiOut : out  STD_LOGIC_VECTOR (4 downto 0);
           RiOut : out  STD_LOGIC_VECTOR (4 downto 0);
           RjOut : out  STD_LOGIC_VECTOR (4 downto 0);
           RkOut : out  STD_LOGIC_VECTOR (4 downto 0);
           WERF : out  STD_LOGIC);
end Issue;

architecture Behavioral of Issue is

begin
process(available,issueask,FU_type,op,Ri,Rj ,Rk,QiIn)
begin

FU_type_out<=FU_type;
opOut<=op;
RiOut<=Ri;
RjOut <=Rj;
RkOut<=Rk;
QiOut<=QiIn;
availableout<=issueask;

if available='0' or issueask='0' then
Accepted<='0';
WERF<='0';
else
Accepted<='1';
WERF<='1';
end if;

end process;


end Behavioral;

