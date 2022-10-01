--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:00:39 02/18/2022
-- Design Name:   
-- Module Name:   C:/chronoscore_phase1/Groupe_B/Equipe_2/chronoscore_phase1/mux_8x1x4b_tb.vhd
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8x1x4b
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
 
ENTITY mux_8x1x4b_tb IS
END mux_8x1x4b_tb;
 
ARCHITECTURE behavior OF mux_8x1x4b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8x1x4b
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(3 downto 0);
         D : IN  std_logic_vector(3 downto 0);
         E : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(3 downto 0);
         G : IN  std_logic_vector(3 downto 0);
         H : IN  std_logic_vector(3 downto 0);
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(3 downto 0) := (others => '0');
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal E : std_logic_vector(3 downto 0) := (others => '0');
   signal F : std_logic_vector(3 downto 0) := (others => '0');
   signal G : std_logic_vector(3 downto 0) := (others => '0');
   signal H : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8x1x4b PORT MAP (
          A => A,
          sel => sel,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G,
          H => H,
          O => O
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
	A <= "0001";
	B <= "0010";
	C <= "0101";
	D <= "0100";
	E <= "0010";
	F <= "0111";
	G <= "0011";
	H <= "1000";
	
	wait for 100 ns;	
		sel <= "000";
		wait for 30 ns;
		sel <= "001";
		wait for 30 ns;
		sel <= "010";
		wait for 30 ns;
		sel <= "011";
		wait for 30 ns;
		sel <= "100";
		wait for 30 ns;
		sel <= "101";
		wait for 30 ns;
		sel <= "110";
		wait for 30 ns;
		sel <= "111";

      wait;
    
   end process;

END;
