----------------------------------------------------------------------------------
-- Engineer: 		 Muhammad A. Anjum
-- 
-- Create Date:    10:18:51 12/05/2019 
-- Module Name:    reg16bit - Behavioral 
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

entity reg16bit is
    Port ( D: in  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end reg16bit;

architecture Behavioral of reg16bit is

begin

	process(CLK) is
	begin
		if (CLK = '1' and CLK'event) then -- checking for clk low to high
			if (EN = '1') then -- checking for enable
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

