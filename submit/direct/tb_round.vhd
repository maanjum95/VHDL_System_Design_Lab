--------------------------------------------------------------------------------
-- Engineer:		Muhammad Anjum
--
-- Create Date:   17:18:54 11/23/2019 
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/direct/tb_round.vhd
-- Project Name:  IDEA Direct  
-- 
-- VHDL Test Bench Created by ISE for module: round
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_round IS
END tb_round;
 
ARCHITECTURE behavior OF tb_round IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT round
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z5 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z6 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: round PORT MAP (
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4
        );
	
	testing: process is
	begin
		-- 1
		X1<= x"0000";
		X2<= x"0000";
		X3<= x"0000";
		X4<= x"0000";
		Z1<= x"0000";
		Z2<= x"0000";
		Z3<= x"0000";
		Z4<= x"0000";
		Z5<= x"0000";
		Z6<= x"0000";
		wait for 10ns;
		
		-- 2
		X1<= x"ffff";
		wait for 10ns;
		
		-- 3
		X2<= x"aaaa";
		wait for 10ns;
		
		-- 4
		X3<= x"5555";
		wait for 10ns;
		
		--5 
		X4<= x"2492";
		wait for 10ns;
		
		--6 
		Z1<= x"db6d";
		wait for 10ns;
		
		--7
		Z2<= x"1c71";
		wait for 10ns;
		
		--8 
		Z3<= x"cccc";
		wait for 10ns;
		
		--9
		Z4<= x"0002";
		wait for 10ns;
		
		--10
		Z5<= x"eeee";
		wait for 10ns;
		
		--11
		Z6<= x"8888";
		wait for 10ns;
	end process testing;

END;
