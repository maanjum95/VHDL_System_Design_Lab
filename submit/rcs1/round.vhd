----------------------------------------------------------------------------------
-- Engineer: 		Muhammad Anjum
-- 
-- Create Date:    16:39:58 11/23/2019 
-- Module Name:    round - Behavioral 
-- Project Name: 	 IDEA Direct
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

entity round is
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
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
end round;

architecture Behavioral of round is
  COMPONENT xorop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT; 
    COMPONENT addop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	  COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 SIGNAL W1: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W2: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W3: STD_LOGIC_VECTOR(15 downto 0); 
	 SIGNAL W4: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W5: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W6: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W7: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W8: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W9: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W10: STD_LOGIC_VECTOR(15 downto 0);
begin
	M1: mulop PORT MAP(I_1=>X1, I_2=>Z1, O_1=>W1);
	A1: addop PORT MAP(A=>X2, B=>Z2, Y=>W2);
	
	A2: addop PORT MAP(A=>X3, B=>Z3, Y=>W3);
	M2: mulop PORT MAP(I_1=>X4, I_2=>Z4, O_1=>W4);
	
	R3: xorop PORT MAP(A=>W1, B=>W3, Y=>W5);
	R4: xorop PORT MAP(A=>W2, B=>W4, Y=>W6);
	
	M5: mulop PORT MAP(I_1=>Z5, I_2=>W5, O_1=>W7);
	A5: addop PORT MAP(A=>W7, B=>W6, Y=>W8);
	
	M6: mulop PORT MAP(I_1=>W8, I_2=>Z6, O_1=>W9);
	A6: addop PORT MAP(A=>W7, B=>W9, Y=>W10);
	
	R7: xorop PORT MAP(A=>W1, B=>W9, Y=>Y1);
	R8: xorop PORT MAP(A=>W3, B=>W9, Y=>Y2);
	
	R9: xorop PORT MAP(A=>W2, B=>W10, Y=>Y3);
	R10: xorop PORT MAP(A=>W4, B=>W10, Y=>Y4);

end Behavioral;

