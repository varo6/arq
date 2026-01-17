----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:36 03/04/2025 
-- Design Name: 
-- Module Name:    vga - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga is
	Port (
			reset : in STD_LOGIC;
			enable_25Mhz : in STD_LOGIC;
			sinc_h	: out  STD_LOGIC;
			sinc_v	: out  STD_LOGIC;
			pixel_cont: out unsigned(9 downto 0);
			linea_cont: out unsigned(9 downto 0);
			inhibicion_color	: out  STD_LOGIC
			);
end vga;

architecture Behavioral of vga is
	constant N_PIXELES: integer :=793;
	constant SINC_H_1_0: integer :=649;
	constant SINC_H_0_1: integer :=746;
	constant INHIBICION_COLOR_H: integer :=639;
	
	constant N_LINEAS: integer :=527;
	constant SINC_V_1: integer :=489;
	constant SINC_V_2: integer :=491;
	constant INHIBICION_COLOR_V: integer :=479;
	constant DIV_RELOJ: integer :=3;
	
	signal sinc_h_i,sinc_v_i : std_logic;
	signal inh_h,inh_v : std_logic;
	signal pixel : unsigned(9 downto 0);
	signal linea : unsigned(9 downto 0);
	
	--signal pos_x : unsigned(9 downto 0);
	--signal pos_y : unsigned(9 downto 0);
	
	signal inh_col_int : std_logic;

begin
	pixel_actual:process(reset,enable_25Mhz)
		begin
			if(reset='1') then
				pixel <= (others => '0');
			elsif(enable_25Mhz'event and enable_25Mhz = '1') then
				
					if(pixel < N_PIXELES) then
						pixel <= pixel + 1;
					else
						pixel <= (others => '0');
					end if;
		
			end if;
		end process;
		
	control_sincronia_horiz:process(enable_25Mhz)
		begin
			if(enable_25Mhz'event and enable_25Mhz='1') then
				
					if(pixel >= SINC_H_1_0 and pixel < SINC_H_0_1) then
						sinc_h_i <= '0';
					else
						sinc_h_i <= '1';
					end if;
				
			end if;
		end process;
	sinc_h <= sinc_h_i;
	
	control_sincronia_vert:process(enable_25Mhz)
		begin
			if(enable_25Mhz'event and enable_25Mhz='1') then
				
					if(pixel = SINC_H_0_1) then
						if(linea >= SINC_V_1 and linea < SINC_V_2) then
							sinc_v_i <= '0';
						else
							sinc_v_i <= '1';
						end if;
					
				end if;
			end if;
		end process;
	sinc_v <= sinc_v_i;

	control_inh_h:process(pixel)
		begin
			if(pixel <= INHIBICION_COLOR_H) then
				inh_h <= '0';
			else
				inh_h <= '1';
			end if;
		end process;
		
	control_inh_v:process(linea)
		begin
			if(linea <= INHIBICION_COLOR_V) then
				inh_v <= '0';
			else
				inh_v <= '1';
			end if;
		end process;
		
	linea_actual:process(reset,enable_25Mhz)
		begin
			if(reset = '1') then
				linea <= (others =>'0');
			elsif(enable_25Mhz'event and enable_25Mhz = '1') then
				
					if(pixel = SINC_H_0_1) then
						if(linea < N_LINEAS) then
							linea <= linea + 1;
						else
							linea <= (others => '0');
						end if;
					end if;
		
			end if;
		end process;
		
	control_inhibicion_color:process(enable_25Mhz)
		begin
			if(enable_25Mhz'event and enable_25Mhz = '1') then
				
					inhibicion_color <= inh_h or inh_v;
				
			end if;
		end process;
	pixel_cont<=pixel;
	linea_cont<=linea;
	
end Behavioral;
