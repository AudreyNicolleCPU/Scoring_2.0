--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:05 03/04/2022
-- Design Name:   
-- Module Name:   C:/TP1_ELN2_GROUP_A_EQUIPE1/chronoscore_phase2/chronoscore_phase2/counterDec_4b_RE_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counterDec_4b_RE
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
 
ENTITY counterDec_4b_RE_tb IS
END counterDec_4b_RE_tb;
 
ARCHITECTURE behavior OF counterDec_4b_RE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counterDec_4b_RE
    PORT(
         R : IN  std_logic;
         CE : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic := '0';
   signal CE : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
   signal TC : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_period :  time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counterDec_4b_RE PORT MAP (
          R => R,
          CE => CE,
          CLK => CLK,
          Q => Q,
          TC => TC
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	CE_process :process 
	begin
		CE <= '0'; -- ou CE_1ms <= '0';
		wait for 90 ns;
		CE <= '1'; -- ou CE_1ms <= '1';
		wait for 10 ns;
	end process;
	 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		R <= '0';
		
      wait for 100 ns;	
		R <= '1';
	
		wait for 100 ns;
		
		R <= '0';
		
		wait;
      

      -- insert stimulus here 

      wait;
   end process;

END;
