--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:44:56 11/21/2019
-- Design Name:   
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tb_addop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
	
	-- Testing process for the adder over all possible boolean values
	testing: process is
		constant P: integer := 2**16 - 1; -- upper limit for 16 bit
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
