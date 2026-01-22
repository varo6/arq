--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:53:07 12/04/2025
-- Design Name:   
-- Module Name:   D:/PRAC_carmenvaroandre/P2c_Picoblaze_Helloworld_RAM_INT_FLIP/P2c_Proyecto_Helloworld_RAM_INT_FLIP/xor_tb.vhd
-- Project Name:  P2c_Proyecto_Helloworld_RAM_INT_FLIP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modulo_xor
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
 
ENTITY xor_tb IS
END xor_tb;
 
ARCHITECTURE behavior OF xor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modulo_xor
    PORT(
         in_port_1 : IN  std_logic_vector(7 downto 0);
         in_port_2 : IN  std_logic_vector(7 downto 0);
         in_port_3 : IN  std_logic_vector(7 downto 0);
         in_port_4 : IN  std_logic_vector(7 downto 0);
         out_port_1 : OUT  std_logic_vector(7 downto 0);
         out_port_2 : OUT  std_logic_vector(7 downto 0);
         out_port_3 : OUT  std_logic_vector(7 downto 0);
         out_port_4 : OUT  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_port_1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_port_2 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_port_3 : std_logic_vector(7 downto 0) := (others => '0');
   signal in_port_4 : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal out_port_1 : std_logic_vector(7 downto 0);
   signal out_port_2 : std_logic_vector(7 downto 0);
   signal out_port_3 : std_logic_vector(7 downto 0);
   signal out_port_4 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: modulo_xor PORT MAP (
          in_port_1 => in_port_1,
          in_port_2 => in_port_2,
          in_port_3 => in_port_3,
          in_port_4 => in_port_4,
          out_port_1 => out_port_1,
          out_port_2 => out_port_2,
          out_port_3 => out_port_3,
          out_port_4 => out_port_4,
          reset => reset,
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
		reset <= '1';
      wait for 150 ns;
		reset <= '0';
		
		wait for 120 ns;
		in_port_1 <= "10101011";
		wait for 21 ns;
		in_port_2 <= "11101011";
		in_port_3 <= "10111011";
		wait for 258 ns;
		in_port_4 <= "10101111";
		
		wait for 99 ns;
		
		in_port_2 <= "00101001";
		wait for 222 ns;
		
		in_port_1 <= "00000000";
      -- insert stimulus here 

      wait;
   end process;

END;
