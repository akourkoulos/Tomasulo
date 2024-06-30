----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:28 04/12/2021 
-- Design Name: 
-- Module Name:    LogicCalculation - Behavioral 
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

entity LogicCalculation is
    Port ( Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           Vout : out  STD_LOGIC_VECTOR (31 downto 0));
end LogicCalculation;

architecture Behavioral of LogicCalculation is

begin
PROCESS(Vj,Vk,op)
BEGIN

if op="00" then
Vout<= Vj or Vk ;
elsif op="01" then
Vout<= Vj and Vk ;
else
Vout<= not Vj;
end if;

end process;

end Behavioral;

