----------------------------------------------------------------------------------
-- Engineer: 		Muhammad Anjum
-- 
-- Create Date:     
-- Module Name:    idea - Structural 
-- Project Name: 	 IDEA Direct
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity idea is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Structural of idea is
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
	 
	 SIGNAL W11, W12, W13, W14: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W21, W22, W23, W24: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W31, W32, W33, W34: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W41, W42, W43, W44: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W51, W52, W53, W54: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W61, W62, W63, W64: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W71, W72, W73, W74: STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL W81, W82, W83, W84: STD_LOGIC_VECTOR(15 downto 0);
	 
	 -- 53 partials key of the IDEA key generator
	 TYPE KEY_ARR IS ARRAY(51 downto 0) OF STD_LOGIC_VECTOR(15 downto 0);
	 SIGNAL Z: KEY_ARR; 
	 
begin
	-- Key generation procedure for the IDEA Algorithm.
	key_gen: process(KEY) is
	variable tmp_key: std_logic_vector(127 downto 0); -- KEY : in  STD_LOGIC_VECTOR (127 downto 0);
	variable idx: integer;
	begin
		-- initialization of variables
		tmp_key := KEY;
		idx:= 0;
		
		-- loop to generate the required keys
		key_gen_loop: for I in 0 to 6 loop
			for J in 0 to 7 loop
				Z(idx) <= tmp_key(127 - J * 16 downto 112 - J * 16);
				
				-- index increment and check we need to run till 52 key are generated
				idx := idx + 1;
				if idx > 51 then
					exit key_gen_loop;
				end if;
			end loop;
			
			-- cyclic shift of the first 25 bits to the end
			tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
		end loop;
		
	end process key_gen;
	
	-- 8 Round of the algorithm
	round_1: round PORT MAP(X1=>X_1, X2=>X_2, X3=>X_3, X4=>X_4,
									Z1=>Z(0), Z2=>Z(1), Z3=>Z(2), Z4=>Z(3),
									Z5=>Z(4), Z6=>Z(5),
									Y1=>W11, Y2=>W12, Y3=>W13, Y4=>W14);
									
	round_2: round PORT MAP(X1=>W11, X2=>W12, X3=>W13, X4=>W14,
									Z1=>Z(6), Z2=>Z(7), Z3=>Z(8), Z4=>Z(9),
									Z5=>Z(10), Z6=>Z(11),
									Y1=>W21, Y2=>W22, Y3=>W23, Y4=>W24);
									
	round_3: round PORT MAP(X1=>W21, X2=>W22, X3=>W23, X4=>W24,
									Z1=>Z(12), Z2=>Z(13), Z3=>Z(14), Z4=>Z(15),
									Z5=>Z(16), Z6=>Z(17),
									Y1=>W31, Y2=>W32, Y3=>W33, Y4=>W34);
									
	round_4: round PORT MAP(X1=>W31, X2=>W32, X3=>W33, X4=>W34,
									Z1=>Z(18), Z2=>Z(19), Z3=>Z(20), Z4=>Z(21),
									Z5=>Z(22), Z6=>Z(23),
									Y1=>W41, Y2=>W42, Y3=>W43, Y4=>W44);
									
	round_5: round PORT MAP(X1=>W41, X2=>W42, X3=>W43, X4=>W44,
									Z1=>Z(24), Z2=>Z(25), Z3=>Z(26), Z4=>Z(27),
									Z5=>Z(28), Z6=>Z(29),
									Y1=>W51, Y2=>W52, Y3=>W53, Y4=>W54);
									
	round_6: round PORT MAP(X1=>W51, X2=>W52, X3=>W53, X4=>W54,
									Z1=>Z(30), Z2=>Z(31), Z3=>Z(32), Z4=>Z(33),
									Z5=>Z(34), Z6=>Z(35),
									Y1=>W61, Y2=>W62, Y3=>W63, Y4=>W64);
									
	round_7: round PORT MAP(X1=>W61, X2=>W62, X3=>W63, X4=>W64,
									Z1=>Z(36), Z2=>Z(37), Z3=>Z(38), Z4=>Z(39),
									Z5=>Z(40), Z6=>Z(41),
									Y1=>W71, Y2=>W72, Y3=>W73, Y4=>W74);
									
	round_8: round PORT MAP(X1=>W71, X2=>W72, X3=>W73, X4=>W74,
									Z1=>Z(42), Z2=>Z(43), Z3=>Z(44), Z4=>Z(45),
									Z5=>Z(46), Z6=>Z(47),
									Y1=>W81, Y2=>W82, Y3=>W83, Y4=>W84);	
										
	out_trafo: trafo PORT MAP(X1=>W81, X2=>W82, X3=>W83, X4=>W84,
									Z1=>Z(48), Z2=>Z(49), Z3=>Z(50), Z4=>Z(51),
									Y1=>Y_1, Y2=>Y_2, Y3=>Y_3, Y4=>Y_4);

end Structural;

