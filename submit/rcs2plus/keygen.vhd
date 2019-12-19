----------------------------------------------------------------------------------
-- Engineer: 		 Muhammad A. Anjum
-- 
-- Create Date:    11:12:54 12/05/2019 
-- Module Name:    keygen - Behavioral 
-- Project Name: 	 IDEA RCS - 1	
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keygen is
    Port ( KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           P0 : out  STD_LOGIC_VECTOR (15 downto 0);
           P1 : out  STD_LOGIC_VECTOR (15 downto 0);
           P2 : out  STD_LOGIC_VECTOR (15 downto 0);
           P3 : out  STD_LOGIC_VECTOR (15 downto 0);
           P4 : out  STD_LOGIC_VECTOR (15 downto 0);
           P5 : out  STD_LOGIC_VECTOR (15 downto 0));
end keygen;

architecture Behavioral of keygen is

begin
	
	keygen: process (KEY, SEL) is
		variable tmp_key : std_logic_vector(127 downto 0);
	begin
		-- assinging KEY to a temporary variable for manipulation
		tmp_key := KEY; 
		case SEL is
			when "0000" => -- round 1
				P0 <= tmp_key(127 downto 112);
				P1 <= tmp_key(111 downto 96);
				P2 <= tmp_key(95 downto 80);
				P3 <= tmp_key(79 downto 64);
				P4 <= tmp_key(63 downto 48);
				P5 <= tmp_key(47 downto 32);
			when "0001" => -- round 2
				P0 <= tmp_key(31 downto 16);
				P1 <= tmp_key(15 downto 0);
				
				-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P2 <= tmp_key(127 downto 112);
				P3 <= tmp_key(111 downto 96);
				P4 <= tmp_key(95 downto 80);
				P5 <= tmp_key(79 downto 64);
			when "0010" => -- round 3
				-- previous cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(63 downto 48);
				P1 <= tmp_key(47 downto 32);
				P2 <= tmp_key(31 downto 16);
				P3 <= tmp_key(15 downto 0);
				
				-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P4 <= tmp_key(127 downto 112);
				P5 <= tmp_key(111 downto 96);
			when "0011" => -- round 4
				-- previous cyclic shift x2
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(95 downto 80);
				P1 <= tmp_key(79 downto 64);
				P2 <= tmp_key(63 downto 48);
				P3 <= tmp_key(47 downto 32);
				P4 <= tmp_key(31 downto 16);
				P5 <= tmp_key(15 downto 0);
			when "0100" => -- round 5
			-- previous cyclic shift x2
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
			-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(127 downto 112);
				P1 <= tmp_key(111 downto 96);
				P2 <= tmp_key(95 downto 80);
				P3 <= tmp_key(79 downto 64);
				P4 <= tmp_key(63 downto 48);
				P5 <= tmp_key(47 downto 32);
			when "0101" => -- round 6
				-- previous cyclic shift x3
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(31 downto 16);
				P1 <= tmp_key(15 downto 0);
				
				-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P2 <= tmp_key(127 downto 112);
				P3 <= tmp_key(111 downto 96);
				P4 <= tmp_key(95 downto 80);
				P5 <= tmp_key(79 downto 64);
			when "0110" => -- round 7
				-- previous cyclic shift x4
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(63 downto 48);
				P1 <= tmp_key(47 downto 32);
				P2 <= tmp_key(31 downto 16);
				P3 <= tmp_key(15 downto 0);
				
				-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P4 <= tmp_key(127 downto 112);
				P5 <= tmp_key(111 downto 96);
			when "0111" => -- round 8
				-- previous cyclic shift x5
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(95 downto 80);
				P1 <= tmp_key(79 downto 64);
				P2 <= tmp_key(63 downto 48);
				P3 <= tmp_key(47 downto 32);
				P4 <= tmp_key(31 downto 16);
				P5 <= tmp_key(15 downto 0);
			when "1000" => -- transformation round
				-- previous cyclic shift x5
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				-- cyclic shift x1
				tmp_key := tmp_key(102 downto 0) & tmp_key(127 downto 103);
				
				P0 <= tmp_key(127 downto 112);
				P1 <= tmp_key(111 downto 96);
				P2 <= tmp_key(95 downto 80);
				P3 <= tmp_key(79 downto 64);
				P4 <= tmp_key(63 downto 48);
				P5 <= tmp_key(47 downto 32);
			when others => -- any othercase
				P0 <= "XXXXXXXXXXXXXXXX";
				P1 <= "XXXXXXXXXXXXXXXX";
				P2 <= "XXXXXXXXXXXXXXXX";
				P3 <= "XXXXXXXXXXXXXXXX";
				P4 <= "XXXXXXXXXXXXXXXX";
				P5 <= "XXXXXXXXXXXXXXXX";
		end case;
	end process keygen;

end Behavioral;

