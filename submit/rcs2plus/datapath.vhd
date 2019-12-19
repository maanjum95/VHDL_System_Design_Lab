----------------------------------------------------------------------------------
-- Engineer: 		 Muhammad A. Anjum
-- 
-- Create Date:    15:44:44 12/07/2019 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
-- Project Name: 	 IDEA - RCS-2
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

entity datapath is
    Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
			  EN125 : in  STD_LOGIC;
           EN346 : in  STD_LOGIC;
           EN78 : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  S_T : in  STD_LOGIC_VECTOR (1 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Y1_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4_TRAFO : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Behavioral of datapath is
	COMPONENT reg16bit
        Port ( D: in  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
   END COMPONENT;
	COMPONENT mux4x1
		Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           D2 : in  STD_LOGIC_VECTOR (15 downto 0);
           D3 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT xorop
		Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT addop
		Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	COMPONENT mulop
		Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
	END COMPONENT;
	
	-- signals
	signal D147, D238, D56: std_logic_vector(15 downto 0);
	signal Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8: std_logic_vector(15 downto 0);
	signal W1, W2, W3, W4: std_logic_vector(15 downto 0);
begin
	mux_1: mux4x1 PORT MAP(D0=>X1, D1=>X4, D2=>Z5, D3=>Z6, S=>S, O=>W1);
	mux_2: mux4x1 PORT MAP(D0=>Z1, D1=>Z4, D2=>Q5, D3=>Q8, S=>S, O=>W2);
	mux_3: mux4x1 PORT MAP(D0=>X3, D1=>X2, D2=>Q6, D3=>Q7, S=>S, O=>W3);
	mux_4: mux4x1 PORT MAP(D0=>Z3, D1=>Z2, D2=>D147, D3=>D147, S=>S_T, O=>W4);

	-- register set
	R1: reg16bit PORT MAP(D=>D147, CLK=>CLK, EN=>EN125, Q=>Q1);
	R2: reg16bit PORT MAP(D=>D238, CLK=>CLK, EN=>EN125, Q=>Q2);
	R3: reg16bit PORT MAP(D=>D238, CLK=>CLK, EN=>EN346, Q=>Q3);
	R4: reg16bit PORT MAP(D=>D147, CLK=>CLK, EN=>EN346, Q=>Q4);
	R5: reg16bit PORT MAP(D=>D56, CLK=>CLK, EN=>EN125, Q=>Q5);
	R6: reg16bit PORT MAP(D=>D56, CLK=>CLK, EN=>EN346, Q=>Q6);
	R7: reg16bit PORT MAP(D=>D147, CLK=>CLK, EN=>EN78, Q=>Q7);
	R8: reg16bit PORT MAP(D=>D238, CLK=>CLK, EN=>EN78, Q=>Q8);
	
	-- 4 xor before output Y
	xor_Y1: xorop PORT MAP(A=>Q1, B=>D147, Y=>Y1);
	xor_Y2: xorop PORT MAP(A=>Q2, B=>D147, Y=>Y2);
	xor_Y3: xorop PORT MAP(A=>Q3, B=>D238, Y=>Y3);
	xor_Y4: xorop PORT MAP(A=>Q4, B=>D238, Y=>Y4);
	
	-- the three remaining modules xor, addop, mulop
	xor_1: xorop PORT MAP(A=>D147, B=>D238, Y=>D56);
	addop_1: addop PORT MAP(A=>W3, B=>W4, Y=>D238);
	mulop_1: mulop PORT MAP(I_1=>W1, I_2=>W2, O_1=>D147);
	
	-- transformation data path
	Y1_TRAFO <= Q1;
	Y2_TRAFO <= Q2;
	Y3_TRAFO <= Q3;
	Y4_TRAFO <= Q4;
	
end Behavioral;

