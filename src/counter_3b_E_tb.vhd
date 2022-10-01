--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:32 02/18/2022
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_B/EQUIPE_2/chronoscore_phase1/counter_3b_E_tb.vhd
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_3b_E
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_3b_E_tb IS
END counter_3b_E_tb;
 
ARCHITECTURE behavior OF counter_3b_E_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_3b_E
    PORT(
         CE : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CE : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0) := "0000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant CE_1ms_period : time := 100 ns;
--	constant CE_1s_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_3b_E PORT MAP (
          CE => CE,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
    -- CE_1ms process definitions
   CE_1ms_process :process
   begin
		clk <= '0';
		wait for (CE_1ms_period/10)*9;
		clk <= '1';
		wait for CE_1ms_period/10;
   end process;	 
	
--    -- CE_1s process definitions
--   CE_1s_process :process
--   begin
--		clk <= '0';
--		wait for CE_1s_period - clk_period;
--		clk <= '1';
--		wait for CE_1s_period/80;
--   end process;	 	

END;
