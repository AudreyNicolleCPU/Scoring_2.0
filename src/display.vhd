----------------------------------------------------------------------------------
-- Company: CPE
-- Engineer: BONNET-SAINT-GEORGES Gaspard/LAPRAIS Augustin/NICOLLE Audrey/WEBER Thibaut 
-- 
-- Create Date:    11:36:26 02/18/2022 
-- Design Name: 
-- Module Name:    display - Behavioral 
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

entity display is
    Port ( CE_1ms : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           data_disp1_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           CE_1s : in  STD_LOGIC;
           AN : out  STD_LOGIC_VECTOR (7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is
	
	signal AN_sel : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	signal AN_T3v8 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal segs_data : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal sseg_7 : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
	signal sseg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal T1s : STD_LOGIC := '0';
	signal DP : STD_LOGIC := '0';
	signal A : STD_LOGIC := '1';
	signal B : STD_LOGIC := '1';
	signal D : STD_LOGIC := '1';
	signal E : STD_LOGIC := '1';
	signal F : STD_LOGIC := '1';
	signal G : STD_LOGIC := '1';
	signal H : STD_LOGIC := '1';

	COMPONENT counter_3b_E
	PORT(
        CE : IN  std_logic;
        clk : IN  std_logic;
        Q : OUT  std_logic_vector(2 downto 0)
		  );
    END COMPONENT;
	
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
	 
	 COMPONENT register_8b
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT transcoder_3v8
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT transcoder_7segs
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         O : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT Tregister_1b
    PORT(
         T : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
	 
begin   

sseg <= DP & sseg_7;

	U0: counter_3b_E PORT MAP (
          CE => CE_1ms,
          clk => CLK,
          Q => AN_sel
        );
	U1: transcoder_3v8 PORT MAP (
          A => AN_sel,
          O => AN_T3v8
        );
	U2: register_8b PORT MAP (
			D => AN_T3v8,
         clk => CLK,
         Q => AN
        );
	U3: Tregister_1b PORT MAP (
          T => CE_1s,
          clk => CLK,
          Q => T1s
        );

	U4: mux_8x1x1b PORT MAP (
			 A => A,
			 B => B,
          C => T1s,
			 D => D,
			 E => E,
			 F => F,
			 G => G,
			 H => H,
          sel => AN_sel,
			 O => DP
        );

	U5: mux_8x1x4b PORT MAP (
          A => data_disp1_R0,
          B => data_disp1_R0 ,
			 C => data_disp1_L0,
			 D => data_disp1_L1,
			 E => data_disp2_R0,
			 F => data_disp2_R1,
			 G => data_disp2_L0,
			 H => data_disp2_L1,
          sel => AN_sel,
			 O => segs_data
        );

	U6: transcoder_7segs PORT MAP (
          A => segs_data,
          O => sseg_7
        );

	U7: register_8b PORT MAP (
			D => sseg,
         clk => CLK,
         Q => LEDS
        );
end Behavioral;

