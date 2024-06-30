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

entity MUX4of5bit is
    Port ( Inp1 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp2 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR(4 downto 0);
           Inp4 : in  STD_LOGIC_VECTOR(4 downto 0);
			  Control:in  STD_LOGIC_VECTOR(1 downto 0);
           Outp : out  STD_LOGIC_VECTOR(4 downto 0));
end MUX4of5bit ;

architecture Behavioral of MUX4of5bit  is

begin
process(Inp1,Inp2,Inp3,Inp4,Control)
begin 

if Control ="00" then
Outp<=Inp1;
elsif Control ="01" then
Outp<=Inp2;
elsif Control ="10" then
Outp<=Inp3;
else
Outp<=Inp4;
end if;

end process;

end Behavioral;

