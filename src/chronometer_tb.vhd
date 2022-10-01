--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:30:28 03/11/2022
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_B/EQUIPE_2/chronoscore_phase2/chronometer_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chronometer
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
 
ENTITY chronometer_tb IS
END chronometer_tb;
 
ARCHITECTURE behavior OF chronometer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chronometer
    PORT(
         RESET : IN  std_logic;
         START : IN  std_logic;
         WAIT_t : IN  std_logic;
         CE_1s : IN  std_logic;
         CLK : IN  std_logic;
         sec_unit : OUT  std_logic_vector(3 downto 0);
         sec_dec : OUT  std_logic_vector(3 downto 0);
         min_unit : OUT  std_logic_vector(3 downto 0);
         min_dec : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal START : std_logic := '0';
   signal WAIT_t : std_logic := '0';
   signal CE_1s : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal sec_unit : std_logic_vector(3 downto 0);
   signal sec_dec : std_logic_vector(3 downto 0);
   signal min_unit : std_logic_vector(3 downto 0);
   signal min_dec : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_1s_period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: chronometer PORT MAP (
          RESET => RESET,
          START => START,
          WAIT_t => WAIT_t,
          CE_1s => CE_1s,
          CLK => CLK,
          sec_unit => sec_unit,
          sec_dec => sec_dec,
          min_unit => min_unit,
          min_dec => min_dec
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	CE_1s_process :process
   begin
		CE_1s <= '0';
		wait for (CE_1s_period/100)*90;
		CE_1s <= '1';
		wait for CE_1s_period/100;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for 500 ns;	
		START <= '1';
		wait for CLK_period*10;
		START <= '0';
		wait for CLK_period*100;
		Wait_t <= '1';
		wait for CLK_period*100;		
		Wait_t <= '0';
		wait for CLK_period*100;
		RESET <= '1';
		wait for CLK_period*10;
		RESET <= '0';
		wait for CLK_period*10;
		START <= '1';


      wait;
   end process;

END;
