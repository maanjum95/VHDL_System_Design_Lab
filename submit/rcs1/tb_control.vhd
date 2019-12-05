--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   13:30:37 12/05/2019 
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs1/tb_control.vhd
-- Project Name:  idea_rcs1  
-- 
-- VHDL Test Bench Created by ISE for module: control
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_control IS
END tb_control;
 
ARCHITECTURE behavior OF tb_control IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT control
    PORT(
         CLK : IN  std_logic;
         START : IN  std_logic;
         ROUND : OUT  std_logic_vector(3 downto 0);
         READY : OUT  std_logic;
         EN : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal START : std_logic := '0';

 	--Outputs
   signal ROUND : std_logic_vector(3 downto 0);
   signal READY : std_logic;
   signal EN : std_logic;
   signal S : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          CLK => CLK,
          START => START,
          ROUND => ROUND,
          READY => READY,
          EN => EN,
          S => S
        );

   -- Clock process definitions
   CLK_process :process(CLK)
   begin
		if CLK = '1' then
			CLK <= '0' after CLK_period/2;
		else
			CLK <= '1' after CLK_period/2;
		end if;
	end process;
 

   -- Stimulus process
   testing: process
   begin		
		START <= '0';
		wait for CLK_period;
		START <= '1';
		wait for CLK_period/2 + 1ns;
		START <= '0';
		wait for 30ns;
   end process testing;

END;
