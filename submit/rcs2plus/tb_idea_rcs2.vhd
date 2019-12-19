--------------------------------------------------------------------------------
-- Engineer:		Muhammad Anjum
--
-- Create Date:   17:19:19 12/10/2019
-- Design Name:   
-- Module Name:   /nas/ei/share/TUEIEDA/LabHDL/2019w/ge46bod/submit/rcs2/tb_idea_rcs2.vhd
-- Project Name:  idea_rcs2 
-- 
-- VHDL Test Bench Created by ISE for module: idea_rcs2
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_idea_rcs2 IS
END tb_idea_rcs2;
 
ARCHITECTURE behavior OF tb_idea_rcs2 IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT idea_rcs2
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X_1 : IN  std_logic_vector(15 downto 0);
         X_2 : IN  std_logic_vector(15 downto 0);
         X_3 : IN  std_logic_vector(15 downto 0);
         X_4 : IN  std_logic_vector(15 downto 0);
         Y_1 : OUT  std_logic_vector(15 downto 0);
         Y_2 : OUT  std_logic_vector(15 downto 0);
         Y_3 : OUT  std_logic_vector(15 downto 0);
         Y_4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X_1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X_4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y_1 : std_logic_vector(15 downto 0);
   signal Y_2 : std_logic_vector(15 downto 0);
   signal Y_3 : std_logic_vector(15 downto 0);
   signal Y_4 : std_logic_vector(15 downto 0);
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: idea_rcs2 PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X_1 => X_1,
          X_2 => X_2,
          X_3 => X_3,
          X_4 => X_4,
          Y_1 => Y_1,
          Y_2 => Y_2,
          Y_3 => Y_3,
          Y_4 => Y_4,
          READY => READY
        );

   -- Clock process definitions
   CLOCK_process :process(CLOCK)
   begin
		if CLOCK = '1' then
			CLOCK <= '0' after CLOCK_period/2;
		else
			CLOCK <= '1' after CLOCK_period/2;
		end if;
   end process;

	-- Testing process defination
	testing: process is
	begin
		-- 1
		X_1 <= x"1111";
		X_2 <= x"2222";
		X_3 <= x"4444";
		X_4 <= x"8888";
		KEY <= x"00010002000300040005000600070008";
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for 800ns;
		
		-- 2
		X_1 <= x"0000";
		X_2 <= x"0000";
		X_3 <= x"0000";
		X_4 <= x"0000";
		KEY <= x"00000000000000000000000000000000";
		START <= '1';
		wait for CLOCK_period;
		START <= '0';
		wait for 800ns;
	end process testing;
END;
