----------------------------------------------------------------------------------
-- Engineer: 		 Muhammad A. Anjum
-- 
-- Create Date:     
-- Module Name:    idea_single - Structural 
-- Project Name: 	 IDEA RCS - 1
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

entity idea_single is
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
end idea_single;

architecture Structural of idea_single is
	COMPONENT round
    PORT ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    COMPONENT trafo
    PORT ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
	 COMPONENT control
	 Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
           READY : out  STD_LOGIC;
           EN : out  STD_LOGIC;
           S : out  STD_LOGIC);
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
	
	-- signals
	signal RND: std_logic_vector(3 downto 0);
	signal Enable: std_logic;
	signal S: std_logic;
	signal K1, K2, K3, K4, K5, K6: std_logic_vector(15 downto 0);
	signal X1, X2, X3, X4: std_logic_vector(15 downto 0);
	signal Y1, Y2, Y3, Y4: std_logic_vector(15 downto 0);
	signal Q1, Q2, Q3, Q4: std_logic_vector(15 downto 0);
	
begin
	-- Control unit of the RCS - 1
	control_unit: control PORT MAP(CLK =>CLOCK, START=> START, 
											 ROUND=>RND ,READY=>READY , EN=>Enable, S=>S);
	-- KEY generator for RCS - 1
	key_generator: keygen PORT MAP(KEY=>KEY, SEL=>RND,
											 P0=>K1, P1=>K2, P2=>K3,
											 P3=>K4, P4=>K5, P5=>K6);
											 
	-- 4 input multiplexer select between input text and round output
	mux_1: mux2x1 PORT MAP(D0=>X_1, D1=>Q1, S=>S, O=>X1);
	mux_2: mux2x1 PORT MAP(D0=>X_2, D1=>Q2, S=>S, O=>X2);
	mux_3: mux2x1 PORT MAP(D0=>X_3, D1=>Q3, S=>S, O=>X3);
	mux_4: mux2x1 PORT MAP(D0=>X_4, D1=>Q4, S=>S, O=>X4);
	
	-- Round module
	round_module: round PORT MAP(X1=>X1, X2=>X2, X3=>X3, X4=>X4,
										  Z1=>K1, Z2=>K2, Z3=>K3, Z4=>K4,
										  Z5=>K5, Z6=>K6,
										  Y1=>Y1, Y2=>Y2, Y3=>Y3, Y4=>Y4);
										  
	-- 4 16 bit register to store result of one round
	reg_1: reg16bit PORT MAP(D=>Y1, CLK=>CLOCK, EN=>Enable, Q=>Q1);
	reg_2: reg16bit PORT MAP(D=>Y2, CLK=>CLOCK, EN=>Enable, Q=>Q2);
	reg_3: reg16bit PORT MAP(D=>Y3, CLK=>CLOCK, EN=>Enable, Q=>Q3);
	reg_4: reg16bit PORT MAP(D=>Y4, CLK=>CLOCK, EN=>Enable, Q=>Q4);
	
	-- Final output transformation
	output_transformation: trafo PORT MAP(X1=>Q1, X2=>Q2, X3=>Q3, X4=>Q4,
													  Z1=>K1, Z2=>K2, Z3=>K3, Z4=>K4,
													  Y1=>Y_1, Y2=>Y_2, Y3=>Y_3, Y4=>Y_4);
end Structural;

