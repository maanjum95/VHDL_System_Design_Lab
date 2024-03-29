----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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

entity idea_rcs2 is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2;

architecture Structural of idea_rcs2 is
	COMPONENT mux2x1
		Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT reg16bit 
		Port ( D: in  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT keygen
		Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           P0 : out  STD_LOGIC_VECTOR (15 downto 0);
           P1 : out  STD_LOGIC_VECTOR (15 downto 0);
           P2 : out  STD_LOGIC_VECTOR (15 downto 0);
           P3 : out  STD_LOGIC_VECTOR (15 downto 0);
           P4 : out  STD_LOGIC_VECTOR (15 downto 0);
           P5 : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT clockedround 
		Port ( CLK : in  STD_LOGIC;
           INIT : in  STD_LOGIC;
           TRAFO : in STD_LOGIC;
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           RESULT : out STD_LOGIC;
           Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT roundcounter
		Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;
	signal RESULT, S_i, INIT, TRAFO: std_logic;
	signal ROUND: std_logic_vector (3 downto 0);
	signal Q1, Q2, Q3, Q4: std_logic_vector(15 downto 0);
	signal X1, X2, X3, X4: std_logic_vector(15 downto 0);
	signal Y1, Y2, Y3, Y4: std_logic_vector(15 downto 0);
	signal Z1, Z2, Z3, Z4, Z5, Z6: std_logic_vector (15 downto 0);
begin
	-- round counter controller
	RC: roundcounter PORT MAP(CLK=>CLOCK, START=>START, RESULT=>RESULT,
										READY=>READY, S_i=>S_i, INIT=>INIT,
										TRAFO=>TRAFO, ROUND=>ROUND);
	-- register to store calculation result of one round
	R1: reg16bit PORT MAP(D=>Y1, CLK=>CLOCK, EN=>RESULT, Q=>Q1);
	R2: reg16bit PORT MAP(D=>Y2, CLK=>CLOCK, EN=>RESULT, Q=>Q2);
	R3: reg16bit PORT MAP(D=>Y3, CLK=>CLOCK, EN=>RESULT, Q=>Q3);
	R4: reg16bit PORT MAP(D=>Y4, CLK=>CLOCK, EN=>RESULT, Q=>Q4);
	
	-- mux bank to select between input data and previous round
	mux_1: mux2x1 PORT MAP(D0=>Q1, D1=>X_1, S=>S_i, O=>X1);
	mux_2: mux2x1 PORT MAP(D0=>Q2, D1=>X_2, S=>S_i, O=>X2);
	mux_3: mux2x1 PORT MAP(D0=>Q3, D1=>X_3, S=>S_i, O=>X3);
	mux_4: mux2x1 PORT MAP(D0=>Q4, D1=>X_4, S=>S_i, O=>X4);
	
	-- keygenerator module
	key_gen: keygen PORT MAP(KEY=>KEY, SEL=>ROUND,
									P0=>Z1, P1=>Z2, P2=>Z3,
									P3=>Z4, P4=>Z5, P5=>Z6);
	
	-- extended round module
	extd_round: clockedround PORT MAP(CLK=>CLOCK, INIT=>INIT, TRAFO=>TRAFO,
												X1=>X1, X2=>X2, X3=>X3, X4=>X4,
												Z1=>Z1, Z2=>Z2, Z3=>Z3,
												Z4=>Z4, Z5=>Z5, Z6=>Z6,
												Y1=>Y1, Y2=>Y2, Y3=>Y3, Y4=>Y4,
												RESULT =>RESULT,
												Y1_TRAFO=>Y_1, Y2_TRAFO=>Y_2,
												Y3_TRAFO=>Y_3, Y4_TRAFO=>Y_4);
	

end Structural;

