--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:35 11/23/2019
-- Design Name:   
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tp_mulop.vhd
-- Project Name:  idea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mulop
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
 
ENTITY tp_mulop IS
END tp_mulop;
 
ARCHITECTURE behavior OF tp_mulop IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mulop
    PORT(
         I_1 : IN  std_logic_vector(15 downto 0);
         I_2 : IN  std_logic_vector(15 downto 0);
         O_1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal I_2 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_1 : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mulop PORT MAP (
          I_1 => I_1,
          I_2 => I_2,
          O_1 => O_1
        );
	
	-- Testing of the mulop component
	testing: process is
	begin
		-- 1
		I_1 <= x"0000";
		I_2 <= x"0000";
		wait for 10ns;
		
		-- 2
		I_1 <= x"0001";
		wait for 10ns;
		
		-- 3
		I_2 <= x"0001";
		wait for 10ns;
		
		-- 4
		I_1 <= x"0003";
		wait for 10ns;
		
		-- 5
		I_2 <= x"0003";
		wait for 10ns;
		
		-- 6
		I_1 <= x"7fff";
		wait for 10ns;
		
		-- 7
		I_2 <= x"7fff";
		wait for 10ns;
		
		-- 8
		I_1 <= x"ffff";
		wait for 10ns;
		
		-- 9
		I_2 <= x"ffff";
		wait for 10ns;
		
		-- 10
		I_1 <= x"8000";
		wait for 10ns;
		
		-- 11
		I_2 <= x"8000";
		wait for 10ns;
	end process testing;

END;
