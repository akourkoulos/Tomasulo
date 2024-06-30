----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:58 02/29/2020 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity MuxBig  is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           Inp0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp8 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp9 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp10 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp11 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp12 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp13 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp14 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp15 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp16 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp17 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp18 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp19 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp20 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp21 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp22 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp24 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp25 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp26 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp27 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp28 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp29 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp30 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Inp31 : in  STD_LOGIC_VECTOR (31 downto 0);
           Outp : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxBig ;

architecture Behavioral of MuxBig is

begin
process(A,Inp0,Inp1,Inp2,Inp3,Inp4,Inp5,Inp6,Inp7,Inp8,Inp9,Inp10,Inp11,Inp12,Inp13,Inp14,Inp15,Inp16,Inp17,Inp18,Inp19,Inp20,Inp21,Inp22,Inp23,Inp24,Inp25,Inp26,Inp27,Inp28,Inp29,Inp30,Inp31) is

begin

if A="00000" then 
Outp<=Inp0;
elsif A="00001" then
Outp<=Inp1;
elsif A="00010" then
Outp<=Inp2;
elsif A="00011" then
Outp<=Inp3;
elsif A="00100" then
Outp<=Inp4;
elsif A="00101" then
Outp<=Inp5;
elsif A="00110" then
Outp<=Inp6;
elsif A="00111" then
Outp<=Inp7;
elsif A="01000" then
Outp<=Inp8;
elsif A="01001" then
Outp<=Inp9;
elsif A="01010" then
Outp<=Inp10;
elsif A="01011" then
Outp<=Inp11;
elsif A="01100" then
Outp<=Inp12;
elsif A="01101" then
Outp<=Inp13;
elsif A="01110" then
Outp<=Inp14;
elsif A="01111" then
Outp<=Inp15;
elsif A="10000" then
Outp<=Inp16;
elsif A="10001" then
Outp<=Inp17;
elsif A="10010" then
Outp<=Inp18;
elsif A="10011" then
Outp<=Inp19;
elsif A="10100" then
Outp<=Inp20;
elsif A="10101" then
Outp<=Inp21;
elsif A="10110" then
Outp<=Inp22;
elsif A="10111" then
Outp<=Inp23;
elsif A="11000" then
Outp<=Inp24;
elsif A="11001" then
Outp<=Inp25;
elsif A="11010" then
Outp<=Inp26;
elsif A="11011" then
Outp<=Inp27;
elsif A="11100" then
Outp<=Inp28;
elsif A="11101" then
Outp<=Inp29;
elsif A="11110" then
Outp<=Inp30;
else
Outp<=Inp31;


end if;

end process;
end Behavioral;

