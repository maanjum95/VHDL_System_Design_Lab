--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   16:44:56 11/21/2019
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tb_addop.vhd
-- Project Name:  IDEA Direct
-- 
-- VHDL Test Bench Created by ISE for module: addop
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_addop IS
END tb_addop;
 
ARCHITECTURE behavior OF tb_addop IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT addop
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
   uut: addop PORT MAP (
          A => A,
          B => B,
          Y => Y
        );
	
	-- Testing process for the adder over booleans defined in test vector
	testing: process is
	begin
		-- 1
		A <= x"0000";
		B <= x"0000";
		wait for 10ns;
		
		-- 2
		A <= x"7ce3";
		wait for 10ns;
		
		-- 3
		B <= x"2db6";
		wait for 10ns;
		
		-- 5
		A <= x"fce3";
		wait for 10ns;
		
		-- 6
		B <= x"edb6";
		wait for 10ns;
		
		-- 7
		A <= x"7ce3";
		wait for 10ns;
	end process;
	
END;
