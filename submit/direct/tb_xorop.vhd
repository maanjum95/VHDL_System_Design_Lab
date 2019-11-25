--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   15:22:16 11/21/2019
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tb_xorop.vhd
-- Project Name:  IDEA Direct 
-- 
-- VHDL Test Bench Created by ISE for module: xorop
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_xorop IS
END tb_xorop;
 
ARCHITECTURE behavior OF tb_xorop IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT xorop
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;  

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
 	--Outputs
   signal Y : std_logic_vector(15 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xorop PORT MAP (
          A => A,
          B => B,
          Y => Y
        );
	
	-- testing process for the xor as defined in test vector file.
	testing: process is
	begin
		-- 1
		A <= x"0000";
		B <= x"0000";
		wait for 10ns;
		
		-- 2
		A <= x"1234";
		B <= x"5678";
		wait for 10ns;
		
		-- 3
		A <= x"1234";
		B <= x"0000";
		wait for 10ns;
	end process testing;

END;
