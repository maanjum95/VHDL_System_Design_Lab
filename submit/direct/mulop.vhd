----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mulop is
    Port ( I_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_1 : out  STD_LOGIC_VECTOR (15 downto 0));
end mulop;

architecture Behavioral of mulop is
	signal I1: std_logic_vector (16 downto 0);
	signal I2: std_logic_vector (16 downto 0);
	signal I1I2: std_logic_vector (33 downto 0); -- 34 bits for multiplication of 2 17 bits.
	signal I1I2_mod: std_logic_vector (15 downto 0);
	signal I1I2_div: std_logic_vector (17 downto 0);
	
	signal result: std_logic_vector(17 downto 0);
begin
	-- zero check for the inputs
	zero_check: process(I_1, I_2) is 
	begin
		if I_1 = std_logic_vector(to_unsigned(0, 16)) then
			I1 <= '1' & I_1; -- if input I_1 is zero map it to 2^16 (17 bits)
		else 
			I1 <= '0' & I_1; -- if input I_1 is not zero add a 0 at start to make it 17 bits.
		end if;
			
		if I_2 = std_logic_vector(to_unsigned(0, 16)) then
			I2 <= '1' & I_2; -- if input I_1 is zero map it to 2^16 (17 bits)
		else 
			I2 <= '0' & I_2; -- if input I_1 is not zero add a 0 at start to make it 17 bits.
		end if;
	end process zero_check;
	
	-- Modulo and Division of the multiplication result
	I1I2 <= I1 * I2;
	I1I2_mod <= I1I2 (15 downto 0); -- last 16 bits are the mod by 2^16
	I1I2_div <= I1I2 (33 downto 16); -- first 18 bits are the div by 2^16
	
	low_high: process(I1I2_mod, I1I2_div) is
	begin
	-- Low-High Algorithm
	-- I1I2 mod (2^16 + 1) = r
	--		(I1I2 mod 2^16) - (I1I2 div 2^16) if (I1I2 mod 2^16) >= (I1I2 div 2^16)
	--		(I1I2 mod 2^16) - (I1I2 div 2^16) + 2^16 +1 if (I1I2 mod 2^16) < (I1I2 div 2^16)		
		if I1I2_mod >= I1I2_div then
			result <= I1I2_mod - I1I2_div;
		else
			result <= I1I2_mod - I1I2_div + std_logic_vector(to_unsigned(2**16 + 1, 17));
		end if;
		
	end process low_high;
	
	O_1 <= result (15 downto 0); -- Selecting only the last 16 bits
	

end Behavioral;

