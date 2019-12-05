----------------------------------------------------------------------------------
-- Engineer: 		 Muhammad A. Anjum
-- 
-- Create Date:    10:42:01 12/05/2019 
-- Module Name:    mux2x1 - Behavioral 
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

entity mux2x1 is
    Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end mux2x1;

architecture Behavioral of mux2x1 is

begin
	process (D0, D1, S) is
	begin
		case S is 
			when '0' => O <= D0;
			when '1' => O <= D1;
			when others => O <= "XXXXXXXXXXXXXXXX"; -- fix this
		end case;
	end process;

end Behavioral;

