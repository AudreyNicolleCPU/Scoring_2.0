----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:58 03/04/2022 
-- Design Name: 
-- Module Name:    chronometer - Behavioral 
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

entity chronometer is
    Port ( RESET : in  STD_LOGIC;
           START : in  STD_LOGIC;
           WAIT_t : in  STD_LOGIC;
			  CE_1s : in STD_LOGIC;
			  CLK : in STD_LOGIC;
           sec_unit : out  STD_LOGIC_VECTOR(3 downto 0);
           sec_dec : out  STD_LOGIC_VECTOR(3 downto 0);
			  min_unit : out  STD_LOGIC_VECTOR(3 downto 0);
			  min_dec : out  STD_LOGIC_VECTOR(3 downto 0));
end chronometer;

architecture Behavioral of chronometer is

	signal CE_time45min : STD_LOGIC := '0';
	signal min_unit_int : STD_LOGIC_VECTOR(3 downto 0);
	signal min_dec_int : STD_LOGIC_VECTOR(3 downto 0);
	signal or_out : STD_LOGIC := '0';
	signal start_reg : STD_LOGIC := '0';
	signal equ45 : STD_LOGIC := '0';
	signal CE_secDec : STD_LOGIC := '0';
	signal CE_minUni : STD_LOGIC := '0';
	signal CE_minDec : STD_LOGIC := '0';

    COMPONENT XOR_2b
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT counterDec_4b_RE
    PORT(
         R : IN  std_logic;
         CE : IN  std_logic;
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;

    COMPONENT counterSen_4b_RE
    PORT(
         clk : IN  std_logic;
         R : IN  std_logic;
         CE : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT equ45min
    PORT(
         min_dec : IN  std_logic_vector(3 downto 0);
         min_unit : IN  std_logic_vector(3 downto 0);
         equ : OUT  std_logic
        );
    END COMPONENT;
    
    COMPONENT register_1b_E
    PORT(
         D : IN  std_logic;
         CLK : IN  std_logic;
         CE : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
	 
    COMPONENT register_1b_R
    PORT(
         R : IN  std_logic;
         D : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;


    COMPONENT register_1b
    PORT(
         clk : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    	 
begin

or_out <= start_reg or START;
CE_time45min <= start_reg and CE_1s and not equ45 and not WAIT_t;

	U1: register_1b_R PORT MAP (
			 D => or_out,
          R => RESET,
          clk => CLK,
          Q => start_reg
        );
		  
	U3: counterDec_4b_RE PORT MAP (
			 CE => CE_time45min,
          R => RESET,
          clk => CLK,
          Q => sec_unit,
			 TC => CE_secDec
        );	

	U4: counterSen_4b_RE PORT MAP (
			 CE => CE_secDec,
          R => RESET,
          clk => CLK,
          Q => sec_dec,
			 TC => CE_minUni
        );	

	U5: counterDec_4b_RE PORT MAP (
			 CE => CE_minUni,
          R => RESET,
          clk => CLK,
          Q => min_unit,
			 TC => CE_minDec
        );	

	U6: counterSen_4b_RE PORT MAP (
			 CE => CE_minDec,
          R => RESET,
          clk => CLK,
          Q => min_dec,
			 TC => open
		);

	U7: equ45min PORT MAP (
			 min_dec => min_dec_int,
			 min_unit => min_unit_int,
			 equ => equ45
        );			  		  
		  
end Behavioral;

