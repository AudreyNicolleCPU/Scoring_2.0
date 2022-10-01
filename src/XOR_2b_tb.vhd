--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:45:15 03/04/2022
-- Design Name:   
-- Module Name:   C:/TP1_ELN2_GROUP_A_EQUIPE1/chronoscore_phase2/chronoscore_phase2/XOR_2b_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: XOR_2b
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
 
ENTITY XOR_2b_tb IS
END XOR_2b_tb;
 
ARCHITECTURE behavior OF XOR_2b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT XOR_2b
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal O : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: XOR_2b PORT MAP (
          A => A,
          B => B,
          O => O
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait;
   end process;

END;
