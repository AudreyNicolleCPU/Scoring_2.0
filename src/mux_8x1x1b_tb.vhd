--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:17:19 02/18/2022
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_B/EQUIPE_2/chronoscore_phase1/mux_8x1x1b_tb.vhd
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8x1x1b
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
 
ENTITY mux_8x1x1b_tb IS
END mux_8x1x1b_tb;
 
ARCHITECTURE behavior OF mux_8x1x1b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8x1x1b
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         E : IN  std_logic;
         F : IN  std_logic;
         G : IN  std_logic;
         H : IN  std_logic;
         sel : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal F : std_logic := '0';
   signal G : std_logic := '0';
   signal H : std_logic := '0';
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic;
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8x1x1b PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G,
          H => H,
          sel => sel,
          O => O
        );
		 
		A <=	'1',
				'0' after 5 ns;

		F <=  '1' ,
				'0' after 15 ns;
				
		E <= 	'1',
				'0' after 25 ns;
				
		sel <=	"000",
					"101" after 10 ns,
					"100" after 20 ns;

END;
