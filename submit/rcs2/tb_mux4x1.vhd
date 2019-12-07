--------------------------------------------------------------------------------
-- Engineer:		Muhammad A. Anjum
--
-- Create Date:   15:02:25 12/07/2019 
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs2/tb_mux4x1.vhd
-- Project Name:  idea_rcs2
-- VHDL Test Bench Created by ISE for module: mux4x1
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux4x1 IS
END tb_mux4x1;
 
ARCHITECTURE behavior OF tb_mux4x1 IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT mux4x1
    PORT(
         D0 : IN  std_logic_vector(15 downto 0);
         D1 : IN  std_logic_vector(15 downto 0);
         D2 : IN  std_logic_vector(15 downto 0);
         D3 : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
  
   --Inputs
   signal D0 : std_logic_vector(15 downto 0) := (others => '0');
   signal D1 : std_logic_vector(15 downto 0) := (others => '0');
   signal D2 : std_logic_vector(15 downto 0) := (others => '0');
   signal D3 : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4x1 PORT MAP (
          D0 => D0,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          S => S,
          O => O
        );

   -- testing process of mux4x1
	testing: process is
	begin
		-- 1
		D0 <= x"1234";
		D1 <= x"5678";
		D2 <= x"90AB";
		D3 <= x"CDEF";
		S <= "00";
		wait for 10ns;
		
		-- 2
		D0 <= x"4321";
		wait for 10ns;
		
		-- 3
		S <= "01";
		wait for 10ns;
		
		-- 4
		D1 <= x"8765";
		wait for 10ns;
		
		-- 5
		S <= "10";
		wait for 10ns;
		
		-- 6
		D2 <= x"AB09";
		wait for 10ns;
		
		-- 7
		S <= "11";
		wait for 10ns;
		
		-- 8
		D3 <= x"FEDC";
		wait for 10ns;
	end process testing;

END;
