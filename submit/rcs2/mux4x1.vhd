----------------------------------------------------------------------------------
-- Engineer: 		Muhammad A. Anjum
-- 
-- Create Date:    15:00:18 12/07/2019 
-- Module Name:    mux4x1 - Behavioral 
-- Project Name: 	 IDEA - RCS-1
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

entity mux4x1 is
    Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
           D1 : in  STD_LOGIC_VECTOR (15 downto 0);
           D2 : in  STD_LOGIC_VECTOR (15 downto 0);
           D3 : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is

begin
	
	process (D0, D1, D2, D3, S) is
	begin
		case S is
			when "00" => O <= D0;
			when "01" => O <= D1;
			when "10" => O <= D2;
			when "11" => O <= D3;
			when others => O <= "XXXXXXXXXXXXXXXX";
		end case;
	end process;

end Behavioral;

