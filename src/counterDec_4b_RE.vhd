----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:36 03/04/2022 
-- Design Name: 
-- Module Name:    counterDec_4b_RE - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterDec_4b_RE is
    Port ( R : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           TC : out  STD_LOGIC);
end counterDec_4b_RE;

architecture Behavioral of counterDec_4b_RE is
signal TC_int : STD_LOGIC :='0';
signal Q_int : UNSIGNED(3 downto 0) :="0000";
begin

process(CLK,CE,R)

begin
	if (R = '1') then
		TC_int <= '0';
		Q_int <= "0000";	
		
	elsif (rising_edge(CLK)) then	
		TC_int <= '0';				
		if (CE = '1') then
			if (Q_int = "1001") then
					TC_int <= '1';
					Q_int <= "0000";
				else
					Q_int <= Q_int+1;
			end if;
		end if;
	end if;		

	
	
	Q <= STD_LOGIC_VECTOR(Q_int);
	TC <= TC_int;
	
end process;


end Behavioral;

