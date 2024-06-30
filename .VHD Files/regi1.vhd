----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:30 02/28/2020 
-- Design Name: 
-- Module Name:    regi - Behavioral 
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

entity regi1 is
    Port ( Clock : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           DataIn : in  STD_LOGIC;
           DataOut : out  STD_LOGIC);
end regi1;

architecture Behavioral of regi1 is

begin
process
begin 
WAIT UNTIL Clock'EVENT AND Clock = '1' ;

if RST='1' then 
DataOut<='0';
else
if WE='1' then
DataOut<=DataIn  ;

end if;
end if;

end process;

end Behavioral;

