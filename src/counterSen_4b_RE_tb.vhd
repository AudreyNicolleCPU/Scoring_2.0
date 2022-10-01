--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:39:03 03/04/2022
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_B/EQUIPE_2/chronoscore_phase2/counterSen_4b_RE_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counterSen_4b_RE
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
 
ENTITY counterSen_4b_RE_tb IS
END counterSen_4b_RE_tb;
 
ARCHITECTURE behavior OF counterSen_4b_RE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counterSen_4b_RE
    PORT(
         clk : IN  std_logic;
         R : IN  std_logic;
         CE : IN  std_logic;
         D : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal R : std_logic := '0';
--   signal CE, CE1 : std_logic := '0';
	signal CE : std_logic := '0';
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal TC : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant CE_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counterSen_4b_RE PORT MAP (
          clk => clk,
          R => R,
          CE => CE,
          D => D,
          Q => Q,
          TC => TC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/10;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	
   -- CE process definitions
   CE_process :process
   begin
		CE <= '0';
		wait for (CE_period/10)*9;
		CE <= '1';
		wait for CE_period/10;
   end process;
	
--   CE1_process :process
--   begin
--		CE1 <= '0';
--		wait for CE_period-clk_period;
--		CE1 <= '1';
--		wait for clk_period;
--   end process;
	
   -- Stimulus process
   stim_proc: process
   begin		

      wait for 100 ns;	
		wait for clk_period*5;	
		R <= '1';
		wait for clk_period*5;
		R <= '0';	
      wait;
   end process;

END;
