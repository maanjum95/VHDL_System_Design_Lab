--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   12:23:32 12/05/2019
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs1/tb_keygen.vhd
-- Project Name:  idea_rcs1  
-- 
-- VHDL Test Bench Created by ISE for module: keygen
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_keygen IS
END tb_keygen;
 
ARCHITECTURE behavior OF tb_keygen IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT keygen
    PORT(
         KEY : IN  std_logic_vector(127 downto 0);
         SEL : IN  std_logic_vector(3 downto 0);
         P0 : OUT  std_logic_vector(15 downto 0);
         P1 : OUT  std_logic_vector(15 downto 0);
         P2 : OUT  std_logic_vector(15 downto 0);
         P3 : OUT  std_logic_vector(15 downto 0);
         P4 : OUT  std_logic_vector(15 downto 0);
         P5 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal SEL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P0 : std_logic_vector(15 downto 0);
   signal P1 : std_logic_vector(15 downto 0);
   signal P2 : std_logic_vector(15 downto 0);
   signal P3 : std_logic_vector(15 downto 0);
   signal P4 : std_logic_vector(15 downto 0);
   signal P5 : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keygen PORT MAP (
          KEY => KEY,
          SEL => SEL,
          P0 => P0,
          P1 => P1,
          P2 => P2,
          P3 => P3,
          P4 => P4,
          P5 => P5
        );
	
	-- Testing process
	testing: process is 
	begin
		-- round 1
		KEY <= x"00010002000300040005000600070008";
		SEL <= "0000";
		wait for 10ns;
		
		-- round 2
		SEL <= "0001";
		wait for 10ns;
		
		-- round 3
		SEL <= "0010";
		wait for 10ns;
		
		-- round 4
		SEL <= "0011";
		wait for 10ns;
		
		-- round 5
		SEL <= "0100";
		wait for 10ns;
		
		-- round 6
		SEL <= "0101";
		wait for 10ns;
		
		-- round 7
		SEL <= "0110";
		wait for 10ns;
		
		-- round 8
		SEL <= "0111";
		wait for 10ns;
		
		-- transformation round
		SEL <= "1000";
		wait for 10ns;
		
		-- undefined Selection
		SEL <= "1001";
		wait for 10ns;
		
	end process testing;

END;
