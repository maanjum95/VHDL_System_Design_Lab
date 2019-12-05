--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   10:26:02 12/05/2019
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs1/tb_reg16bit.vhd
-- Project Name:  idea_rcs1 
-- 
-- VHDL Test Bench Created by ISE for module: reg16bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_reg16bit IS
END tb_reg16bit;
 
ARCHITECTURE behavior OF tb_reg16bit IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT reg16bit
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         CLK : IN  std_logic;
         EN : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
  
   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg16bit PORT MAP (
          D => D,
          CLK => CLK,
          EN => EN,
          Q => Q
        );

   -- Clocking signal
   CLK_process :process(CLK) is
   begin
		if (CLK = '1') then
			CLK <= '0' after CLK_period/2;
		else
			CLK <= '1' after CLK_period/2;
		end if;
   end process CLK_Process;
	
	-- generating test signals
	testing: process is
	begin
		-- reset
		D <= x"0000";
		EN <= '1';
		wait for 10ns;
		
		D <= x"1234";
		wait for 10ns;
		
		D <= x"ABCD";
		EN <= '0';
		wait for 10ns;
	end process testing;
	
END;
