----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:47 02/28/2020 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

entity Decoder is
    Port ( Inp : in  STD_LOGIC_VECTOR (4 downto 0);
           Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end Decoder;

architecture Behavioral of Decoder is

begin
process(Inp) is
begin

if Inp="00000" then
Outp<="00000000000000000000000000000001";
elsif Inp="00001" then
Outp<="00000000000000000000000000000010";
elsif Inp="00010" then
Outp<="00000000000000000000000000000100";
elsif Inp="00011" then
Outp<="00000000000000000000000000001000";
 elsif Inp="00100" then
Outp<="00000000000000000000000000010000";
elsif Inp="00101" then
Outp<="00000000000000000000000000100000";
elsif Inp="00110" then
Outp<="00000000000000000000000001000000";
elsif Inp="00111" then
Outp<="00000000000000000000000010000000";
elsif Inp="01000" then
Outp<="00000000000000000000000100000000";
elsif Inp="01001" then
Outp<="00000000000000000000001000000000";
elsif Inp="01010" then
Outp<="00000000000000000000010000000000";
elsif Inp="01011" then
Outp<="00000000000000000000100000000000";
elsif Inp="01100" then
Outp<="00000000000000000001000000000000";
elsif Inp="01101" then
Outp<="00000000000000000010000000000000";
elsif Inp="01110" then
Outp<="00000000000000000100000000000000";
elsif Inp="01111" then
Outp<="00000000000000001000000000000000";
elsif Inp="10000" then
Outp<="00000000000000010000000000000000";
elsif Inp="10001" then
Outp<="00000000000000100000000000000000";
elsif Inp="10010" then
Outp<="00000000000001000000000000000000";
elsif Inp="10011" then
Outp<="00000000000010000000000000000000";
elsif Inp="10100" then
Outp<="00000000000100000000000000000000";
elsif Inp="10101" then
Outp<="00000000001000000000000000000000";
elsif Inp="10110" then
Outp<="00000000010000000000000000000000";
elsif Inp="10111" then
Outp<="00000000100000000000000000000000";
elsif Inp="11000" then
Outp<="00000001000000000000000000000000";
elsif Inp="11001" then
Outp<="00000010000000000000000000000000";
elsif Inp="11010" then
Outp<="00000100000000000000000000000000";
elsif Inp="11011" then
Outp<="00001000000000000000000000000000";
elsif Inp="11100" then
Outp<="00010000000000000000000000000000";
elsif Inp="11101" then
Outp<="00100000000000000000000000000000";
elsif Inp="11110" then
Outp<="01000000000000000000000000000000";
else
Outp<="10000000000000000000000000000000";
end if;
end process ;


end Behavioral;

