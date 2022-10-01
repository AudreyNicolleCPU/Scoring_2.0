----------------------------------------------------------------------------------
-- Company: CPE
-- Engineer: BONNET-SAINT-GEORGES Gaspard/LAPRAIS Augustin/NICOLLE Audrey/WEBER Thibaut
-- 
-- Create Date:    10:54:39 02/18/2022 
-- Design Name: 
-- Module Name:    counter_3b_E - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_3b_E is
    Port ( CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end counter_3b_E;

architecture Behavioral of counter_3b_E is

signal cnt : unsigned(2 downto 0) := "000";

begin
	
	process(CE,clk)
	begin 
	
		if (CE = '1' and rising_edge(clk)) then
			if (cnt = "111") then
				cnt <= "000";
			else
			cnt <= cnt + 1;
			end if ;
		end if;
	end process; 
	
Q <= STD_LOGIC_VECTOR(cnt);
	
end Behavioral;

