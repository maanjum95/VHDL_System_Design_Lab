--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:16 11/21/2019
-- Design Name:   
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tb_xorop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xorop
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
	
	testing: process is -- process to loop over each boolean combination to test the result
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
