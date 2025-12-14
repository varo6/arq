----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:32 12/11/2025 
-- Design Name: 
-- Module Name:    vga_inter - Behavioral 
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

entity vga_inter is
	Port (
			reset : in STD_LOGIC;
			enable_25Mhz : in STD_LOGIC;
			sinc_h	: out  STD_LOGIC;
			sinc_v	: out  STD_LOGIC;
			--pixel_cont: out unsigned(9 downto 0);
			--linea_cont: out unsigned(9 downto 0);
			inhibicion_color_inter	: out  STD_LOGIC;
			VGA_out_inter : out STD_LOGIC_VECTOR(2 downto 0); -- va a ser lo que mostremos por pantalla en cada pixel.
			
			read_strobe : in STD_LOGIC;
			port_id : in STD_LOGIC_VECTOR(7 downto 0); -- x"EF"
			outport : in STD_LOGIC_VECTOR(7 downto 0)
			);
end vga_inter;

architecture Behavioral of vga_inter is

----------------------------------------------------------------
-- declaracion del modul VGA
----------------------------------------------------------------
	component vga is
	Port (
			reset : in STD_LOGIC;
			enable_25Mhz : in STD_LOGIC;
			sinc_h	: out  STD_LOGIC;
			sinc_v	: out  STD_LOGIC;
			pixel_cont: out unsigned(9 downto 0);
			linea_cont: out unsigned(9 downto 0);
			inhibicion_color	: out  STD_LOGIC
			);
	end component;


signal pos_x: unsigned(9 downto 0);
signal pos_y: unsigned(9 downto 0);
signal pixel_cont: unsigned(9 downto 0);
signal linea_cont: unsigned(9 downto 0);

signal inhibicion_color_inter_int: std_logic;
signal VGA_out_inter_int : std_logic_vector(2 downto 0);
begin

	modulo_vga: vga
	port map(
				reset => reset,
				enable_25Mhz => enable_25Mhz,
				sinc_h	=> sinc_h,
				sinc_v	=> sinc_v,
				pixel_cont => pixel_cont,
				linea_cont => linea_cont,
				inhibicion_color	=> inhibicion_color_inter_int
				);
				
				

-- Escritura en VGA
-- TODO: CUANTO TIEMPO VA A ESTAR ACTIVADO DE UN COLOR. SEGUN ESTA LOGICA, EN EL MOMENTO EN EL QUE CAMBIE EL PORTID
-- DEJA DE MOSTRAR EL COLOR O EL READSTROBE. FSM <- solucion 1. TIMER simple <- solucion 2

process (reset,enable_25Mhz) 
	begin 
		if (reset = '1') then
			VGA_out_inter_int <= (others => '0');
			
			-- esquina final de la pantalla
			pos_x <= "1010000000"; -- 640
			pos_y <= "0111100000"; -- 480
			
			-- la escritura de la VGA es secuencial va desde (0,0) hasta (640,480) uno por uno, de derecha a izquirda, de arriba a abajo.

		elsif rising_edge(enable_25Mhz) then
		
		-- VERIFICAMOS AQUI LAS RESTRICCIONES para poder pintar por pantalla
		
			if (read_strobe = '1' and port_id = x"EF") then
				if (inhibicion_color_inter_int = '1') then
					VGA_out_inter_int <= (others => '0');
				else
					if (pixel_cont <= pos_x) then
						if (linea_cont <= pos_y) then --dentro de la pantalla
							
							-- COMO ESTAMOS DENTRO DE LA PANTALLA ESCRIBIMOS EL COLOR QUE DESEAMOS AQUI.
							
							if(outport = "00000000") then	-- Signal contra correcta. Sabiendo que la signal va dirigida a la VGA		
								VGA_out_inter_int <= "010";
							else							-- Signal contra incorrecta
								VGA_out_inter_int <= "100";
							end if;
						else								--columna no coincide
							VGA_out_inter_int <= (others => '0');
						end if;
					else									--fila no coincide
						VGA_out_inter_int <= (others => '0');
					end if;
				end if;
				
			else											--no esta activado
				VGA_out_inter_int <= (others => '0');
			end if;
		end if;
end process;

inhibicion_color_inter <= inhibicion_color_inter_int;

VGA_out_inter <= VGA_out_inter_int;

end Behavioral;

