--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:44:18 12/11/2025
-- Design Name:   
-- Module Name:   C:/Users/DETCP/Downloads/P2c_Picoblaze_Helloworld_RAM_INT_FLIP/P2c_Proyecto_Helloworld_RAM_INT_FLIP/hasher_tb.vhd
-- Project Name:  P2c_Proyecto_Helloworld_RAM_INT_FLIP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hasher
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY hasher_tb IS
END hasher_tb;
 
ARCHITECTURE behavior OF hasher_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hasher
    PORT(
         operand : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hasher PORT MAP (
          operand => operand,
          Y => Y,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		operand <= "01101000";
		
		wait for clk_period*100;
		
		operand <= "01101111";
		 
		wait for clk_period*100;
		
		operand <= "01101100";
		
		wait for clk_period*100;
		
		operand <= "01100001";

      -- insert stimulus here 

      wait;
   end process;

END;
