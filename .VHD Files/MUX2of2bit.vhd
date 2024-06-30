----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:17:10 03/10/2020 
-- Design Name: 
-- Module Name:    MUX2 - Behavioral 
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

entity MUX2of2bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(1 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(1 downto 0);
			  Control:in  STD_LOGIC;
           Outp : out  STD_LOGIC_VECTOR(1 downto 0));
end MUX2of2bit;

architecture Behavioral of MUX2of2bit is

begin
process(Inp1,Inp2,Control)
begin 

if Control ='1' then
Outp<=Inp2;
else
Outp<=Inp1;
end if;

end process;

end Behavioral;

