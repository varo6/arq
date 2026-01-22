--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:54:51 01/22/2026
-- Design Name:   
-- Module Name:   C:/Users/DETCP/Downloads/arq-main/arq-main/P2c_Picoblaze_Helloworld_RAM_INT_FLIP/P2c_Proyecto_Helloworld_RAM_INT_FLIP/estados_tb.vhd
-- Project Name:  P2c_Proyecto_Helloworld_RAM_INT_FLIP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: estados
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
 
ENTITY estados_tb IS
END estados_tb;
 
ARCHITECTURE behavior OF estados_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT estados
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         write_strobe : IN  std_logic;
         read_strobe : IN  std_logic;
         port_id : IN  std_logic_vector(7 downto 0);
         out_port : IN  std_logic_vector(7 downto 0);
         out_result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_strobe : std_logic := '0';
   signal read_strobe : std_logic := '0';
   signal port_id : std_logic_vector(7 downto 0) := (others => '0');
   signal out_port : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal out_result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: estados PORT MAP (
          clk => clk,
          reset => reset,
          write_strobe => write_strobe,
          read_strobe => read_strobe,
          port_id => port_id,
          out_port => out_port,
          out_result => out_result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

	stim_proc: process
   begin		
      reset <= '0';
      write_strobe <= '0';
      port_id <= (others => '0');
      out_port <= (others => '0');
      
      wait for 100 ns;	
      
      reset <= '1';
      wait for clk_period * 10;
      reset <= '0';
      
      wait for clk_period * 100; 
      
      wait for clk_period;
      port_id <= x"DD";
      out_port <= x"FF";  -- Simulamos un fallo
      write_strobe <= '1';
      wait for clk_period;
      write_strobe <= '0';
      
      wait for clk_period * 5;
      
      port_id <= x"DD";
      out_port <= x"00"; -- Simulamos un acierto
      write_strobe <= '1';
      wait for clk_period;
      write_strobe <= '0';

      wait;
   end process;

END;
