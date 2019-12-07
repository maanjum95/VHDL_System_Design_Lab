--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   15:26:01 12/07/2019
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs2/tb_control.vhd
-- Project Name:  idea_rcs2

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
         INIT : IN  std_logic;
         TRAFO : IN  std_logic;
         EN125 : OUT  std_logic;
         EN346 : OUT  std_logic;
         EN78 : OUT  std_logic;
         RESULT : OUT  std_logic;
         S : OUT  std_logic_vector(1 downto 0);
         S_T : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal CLK : std_logic := '0';
   signal INIT : std_logic := '0';
   signal TRAFO : std_logic := '0';

 	--Outputs
   signal EN125 : std_logic;
   signal EN346 : std_logic;
   signal EN78 : std_logic;
   signal RESULT : std_logic;
   signal S : std_logic_vector(1 downto 0);
   signal S_T : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN
 -- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          CLK => CLK,
          INIT => INIT,
          TRAFO => TRAFO,
          EN125 => EN125,
          EN346 => EN346,
          EN78 => EN78,
          RESULT => RESULT,
          S => S,
          S_T => S_T
        );

   -- Clock process definitions
   CLK_process :process (CLK)
   begin
		if (CLK = '1') then
			CLK <= '0' after CLK_period/2;
		else
			CLK <= '1' after CLK_period/2; 
		end if;
   end process;
 

	testing: process is
	begin
		INIT <= '1';
		wait for CLK_period*2;
		INIT <= '0';
		wait for 300ns;
	end process testing;

END;
