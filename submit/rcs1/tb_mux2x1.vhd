--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   10:53:27 12/05/2019  
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs1/tb_mux2x1.vhd
-- Project Name:  idea_rcs1  
-- 
-- VHDL Test Bench Created by ISE for module: mux2x1
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux2x1 IS
END tb_mux2x1;
 
ARCHITECTURE behavior OF tb_mux2x1 IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mux2x1
    PORT(
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic;
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
 
   --Inputs
   signal D0 : std_logic_vector(15 downto 0) := (others => '0');
   signal D1 : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic := '0';
	
 	--Outputs
   signal O : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2x1 PORT MAP (
          D0 => D0,
          D1 => D1,
          S => S,
          O => O
        );

	testing: process is
	begin
		-- Setup
		D0 <= x"0000";
		D1 <= x"0000";
		S <= '0';
		wait for 10ns;
		
		-- 1
		D0 <= x"1234";
		wait for 10ns;
		
		-- 2 
		D0 <= x"4321";
		wait for 10ns;
		
		-- 3
		D1 <= x"ABCD";
		wait for 10ns;
		
		-- 4
		S <= '1';
		wait for 10ns;
		
		-- 5
		D1 <= x"DCBA";
		D0 <= x"1234";
		wait for 10ns;
		
		-- 6 
		S <= '0';
		wait for 10ns;
		
		-- 7
		S <= 'X';
		wait for 10ns;
	end process testing;

END;
