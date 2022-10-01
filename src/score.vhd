----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:23 03/03/2022 
-- Design Name: 
-- Module Name:    score - Behavioral 
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

entity score is
    Port ( clk : in  STD_LOGIC;
           CE_1ms : in  STD_LOGIC;
           BPL : in  STD_LOGIC;
           BPreset : in  STD_LOGIC;
           BPV : in  STD_LOGIC;
           loc_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           loc_dec : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_dec : out  STD_LOGIC_VECTOR (3 downto 0));
end score;

architecture Behavioral of score is

component XOR_2b 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           O : out  STD_LOGIC);
end component;

component counterDec_4b_RE     
    Port ( clk : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           TC : out  STD_LOGIC);
end component;

component register_1b_E
    Port ( clk : in  STD_LOGIC;
           D : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

component register_1b
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
			  clk : in  STD_LOGIC);
end component;

signal bpl_r : STD_LOGIC;
signal bpl_d : STD_LOGIC;
signal bpl_f : STD_LOGIC;
signal bpl_fr : STD_LOGIC;
signal bpl_inc : STD_LOGIC;
signal CE_LOC : STD_LOGIC;

signal bpv_r : STD_LOGIC;
signal bpv_f : STD_LOGIC;
signal bpv_d : STD_LOGIC;
signal bpv_fr : STD_LOGIC;
signal bpv_inc : STD_LOGIC;
signal CE_VIS : STD_LOGIC;

begin

U0: register_1b_E PORT MAP (
		 clk => clk,
		 D => BPL,
		 CE => CE_1ms,
		 Q => bpl_r 
	  );
	  
U1: register_1b_E PORT MAP (
		 clk => clk,
		 D => bpl_r,
		 CE => CE_1ms,
		 Q => bpl_d 
	  );
	  
U2: register_1b PORT MAP (
		 D => bpl_d,
		 Q => bpl_f,
		 clk => clk
	  );

U3: XOR_2b PORT MAP (
		 A => bpl_f,
		 B => bpl_d,
		 O => bpl_fr
		 );

U4: register_1b_E PORT MAP (
		 clk => clk,
		 D => BPV,
		 CE => CE_1ms,
		 Q => bpv_r 
	  );

U5: register_1b_E PORT MAP (
		 clk => clk,
		 D => bpv_r,
		 CE => CE_1ms,
		 Q => bpv_d 
	  );

U6: register_1b PORT MAP (
		 D => bpv_d,
		 Q => bpv_f,
		 clk => clk
	  );

U7: XOR_2b PORT MAP (
		 A => bpv_f,
		 B => bpv_d,
		 O => bpv_fr
	  );
	  
bpl_inc <= bpl_fr and bpl_d ;
bpv_inc <= bpv_fr and bpv_d ;

U8: counterDec_4b_RE PORT MAP (
		 clk => clk,
		 CE => bpl_inc,
		 R => BPreset,
		 Q => loc_unit,
		 TC => CE_LOC
	  );

U9: counterDec_4b_RE PORT MAP (
		 clk => clk,
		 CE => CE_LOC,
		 R => BPreset,
		 Q => loc_dec,
		 TC => open
	  );

U10: counterDec_4b_RE PORT MAP (
		 clk => clk,
		 CE => bpv_inc,
		 R => BPreset,
		 Q => vis_unit,
		 TC => CE_VIS
	  );
	  
U11: counterDec_4b_RE PORT MAP (
		 clk => clk,
		 CE => CE_VIS,
		 R => BPreset,
		 Q => vis_dec,
		 TC => open
	  );
	  	  
end Behavioral;