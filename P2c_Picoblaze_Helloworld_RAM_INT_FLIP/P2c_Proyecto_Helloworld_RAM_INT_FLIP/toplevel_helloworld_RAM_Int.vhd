library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity toplevel is
    Port (      port_id : out std_logic_vector(7 downto 0);	--solo para depurar
           write_strobe : out std_logic;	 						--solo para depurar
            read_strobe : out std_logic;							--solo para depurar
               out_port : out std_logic_vector(7 downto 0);	--solo para depurar
                in_port : out std_logic_vector(7 downto 0);	--solo para depurar
						reset : in std_logic;
						  clk : in std_logic;
						   rx : in std_logic;
				         tx : out std_logic;
		     		      LED : out std_logic;	 --led de comprobacion y reset
							VGA_out : out  STD_LOGIC_VECTOR(11 downto 0) -- salida del VGA (TODO: ver pines reales de la VGA)
							
							);
end toplevel ;

architecture behavioral of toplevel is
----------------------------------------------------------------
-- declaracion del picoblaze
----------------------------------------------------------------
  component picoblaze
    Port (      address : out std_logic_vector(7 downto 0);
            instruction : in std_logic_vector(15 downto 0);
                port_id : out std_logic_vector(7 downto 0);
           write_strobe : out std_logic;
               out_port : out std_logic_vector(7 downto 0);
            read_strobe : out std_logic;
                in_port : in std_logic_vector(7 downto 0);
              interrupt : in std_logic;
                  reset : in std_logic; 
						  clk : in std_logic);
    end component;

-----------------------------------------------------------------
-- declaracin de la ROM de programa
-----------------------------------------------------------------
  component programa_helloworld_int_FLIP
    Port (      address : in std_logic_vector(7 downto 0);
            		   dout : out std_logic_vector(15 downto 0);
                    clk : in std_logic);
    end component;



----------------------------------------------------------------
-- declaracion del modul XOR
----------------------------------------------------------------
  component modulo_xor
  Port (     in_port_1 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 1 (Entra YA supuestamente cifrado)
				 in_port_2 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 2
				 in_port_3 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 3
				 in_port_4 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 4
				 port_id : in std_logic_vector(7 downto 0);
				 out_result : out std_logic;
				 reset : in std_logic;
				 clk : in std_logic;
				 writestrobe: in std_logic;
				 readstrobe: in std_logic);
				 
    end component;
	 
	
----------------------------------------------------------------
-- declaracion del modul VGA
----------------------------------------------------------------	
	 component vga is
		Port (
				reset : in STD_LOGIC;
				enable_25Mhz : in STD_LOGIC;
				sinc_h	: out  STD_LOGIC;
				sinc_v	: out  STD_LOGIC;
				pixel_cont : out  unsigned (9 downto 0);
				linea_cont : out unsigned (9 downto 0);
				inhibicion_color	: out  STD_LOGIC;
				
				port_id: in std_logic_vector(7 downto 0);
				readstrobe:in std_logic -- readstrobe o writestrobe ?? TODO
				);
	end component;
-----------------------------------------------------------------
-- Signals usadas para conectar el picoblaze y la ROM de programa
-----------------------------------------------------------------
signal     address : std_logic_vector(7 downto 0);
signal instruction : std_logic_vector(15 downto 0);
		
-----------------------------------------------------------------
-- Signals para debugging 
-----------------------------------------------------------------
signal readstrobe: std_logic;
signal writestrobe: std_logic;
signal portid: std_logic_vector(7 downto 0);
signal inport: std_logic_vector(7 downto 0);
signal outport: std_logic_vector(7 downto 0);
signal picoint: std_logic;
-----------------------------------------------------------------
-- Signals para salida XOR 
-----------------------------------------------------------------

signal inport1 : std_logic_vector(7 downto 0);
signal inport2 : std_logic_vector(7 downto 0);
signal inport3 : std_logic_vector(7 downto 0);
signal inport4 : std_logic_vector(7 downto 0);
signal outresult : std_logic;

-----------------------------------------------------------------
-- Signals para VGA. TODO: El VHD ha de funcionar a 25 MHz
-----------------------------------------------------------------

signal inport: std_logic_vector(7 downto 0);

signal pixel_cont_top : unsigned(9 downto 0);
signal linea_cont_top : unsigned(9 downto 0);
signal inhibicion_color_top : std_logic;
signal enable_25 : std_logic;

signal pos_x : unsigned(9 downto 0); -- (640)
signal pos_y : unsigned(9 downto 0); -- (480)

-----------------------------------------------------------------
-- Declaracion inicial de la RAM
-----------------------------------------------------------------
type ram_type is array (0 to 63) of std_logic_vector (7 downto 0);
signal RAM : ram_type := (
x"0A", x"0D", x"2A", x"20", x"48", x"45", x"4C", x"4C",
x"4F", x"20", x"49", x"27", x"4D", x"20", x"41", x"4C",
x"49", x"56", x"45", x"21", x"20", x"3A", x"2D", x"44",
x"20", x"2A", x"0A", x"0D", x"2A", x"20", x"50", x"52",
x"45", x"53", x"53", x"20", x"41", x"4E", x"59", x"20",
x"4B", x"45", x"59", x"20", x"54", x"4F", x"20", x"43",
x"4F", x"4E", x"54", x"49", x"4E", x"55", x"45", x"20",
x"2A", x"0A", x"0D", x"00", x"00", x"00", x"00", x"00" );

signal rxbuff_out,RAM_out: std_logic_vector(7 downto 0);

begin

	LED <= reset; 	-- para comprobar la programacion encendemos
						--	un led cada vez que reseteamos

	read_strobe <= readstrobe;
	write_strobe <= writestrobe;
	port_id <= portid;
	in_port <= inport;
	out_port <= outport;
	picoint <= NOT rx;
 	
  processor: picoblaze
    port map(      address => address,
               instruction => instruction,
                   port_id => portid,
              write_strobe => writestrobe,
                  out_port => outport,
               read_strobe => readstrobe,
                   in_port => inport,
                 interrupt => picoint,
                     reset => reset,
                       clk => clk);

  program: programa_helloworld_int_FLIP
    port map(     address => address,
               	     dout => instruction,
                      clk => clk);


-- ESTO ESTA SIN TERMINAR, HAY QUE DECLARAR TODAS LAS SEALES DE ENTRADA Y SALIDA. TODO
	perixor: modulo_xor  
    port map(  
						in_port_1 => outport,
						in_port_2 => outport,
						in_port_3 => outport,
						in_port_4 => outport,
						out_result => outresult,
                   port_id => portid,
              write_strobe => writestrobe,
               read_strobe => readstrobe,
                     reset => reset,
                       clk => clk);
							  
	modulo_vga : vga
		port map (
						reset					=>	reset,
						sinc_h				=> sinc_h,
						sinc_v				=> sinc_v,
						pixel_cont			=> pixel_cont_top,
						linea_cont			=>	linea_cont_top,
						inhibicion_color	=> inhibicion_color_top,
						enable_25Mhz		=> enable_25,
						
						port_id 				=> portid,
						readstrobe			=> readstrobe -- readstrobe? o writestrobe? TODO
					);
	--registra el bit tx del puerto de salida, por si ste cambia
	txbuff:process(reset, clk)
	begin
		if (reset='1') then
			tx <= '1';
		elsif rising_edge(clk) then
			if (writestrobe = '1' and portid=x"FF") then
				tx <= outport(0);	
			end if;
		end if;
	end process;
	
	--aade 7ceros a rx para meterlos al puerto de entrada cuando se lea
	rxbuff:process(reset, clk)
	begin
		if (reset='1') then
			rxbuff_out <= (others=>'1');
		elsif rising_edge(clk) then
			if (readstrobe = '1' and portid =x"FF") then
				rxbuff_out <= rx & "0000000";	
			end if;		 
		end if;
	end process;
	
	-- Memoria RAM (escritura sincrona / lectura asincrona)
	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (writestrobe = '1' and portid<x"40") then
				RAM(to_integer(unsigned(portid))) <= outport;
			end if;
		end if;
	end process;
	RAM_out <= RAM(to_integer(unsigned(portid)));
	
-- Multiplexor inport
inport <= RAM_out when (readstrobe = '1' and portid<x"40") else
			 rxbuff_out when (readstrobe = '1' and portid=x"FF") else
			 out_result when (readstrobe = '1' and portid=x"FA") else
			 x"00";
-- Multiplexor outport
-- Creo que no es asi. remove later
-- la idea es que cuando outport sea "EF", el modulo VGA lea read_strobe para asignar un color a colorear
outport <= to_vga when (readstrobe = '1' and portid=x"EF") else -- MODULO VGA. to_vga va a ser el resultado verde o rojo para enviar a la vga
	 x"00";
	 
	 


process (reset,clk) 
	begin 
		if (reset = '1') then
			VGA_out <= (others => '0');
			--x_offset <= (others => '0');
			--y_offset <= (others => '0');
			--is_true <= '0';
			
			-- esquina final de la pantalla
			pos_x <= "1010000000"; -- 640
			pos_y <= "0111100000"; -- 480
			
			-- la escritura de la VGA es secuencial va desde (0,0) hasta (640,480) uno por uno, de derecha a izquirda, de arriba a abajo.

		elsif rising_edge(clk) then
			if (enable = '1') then
				if (inhibicion_color_top = '1') then
					VGA_out <= (others => '0');
					--x_offset <= (others => '0');
					--y_offset <= (others => '0');
				else

					if (pixel_cont_top <= pos_x) then
						if (linea_cont_top <= pos_y) then --dentro de la pantalla
							--is_true <= '1';
							--x_offset <= pixel_cont_top(3 downto 0) - pos_x; 
							--y_offset <= linea_cont_top(3 downto 0) - pos_y;
							
							--address_temp <= y_offset * 9 + x_offset;
							--address <= address_temp(6 downto 0);
							
							-- COMO ESTAMOS DENTRO DE LA PANTALLA ESCRIBIMOS
								VGA_out <= rom_data;
								
						else --columna no coincide
							VGA_out <= (others => '0');
							--is_true <= '0';
						end if;
					else --fila no coincide
						VGA_out <= (others => '0');
						--is_true <= '0';
					end if;
				end if;
				
			else --no esta enable
				VGA_out <= (others => '0');
				--is_true <= '0';
			end if;
		end if;
end process;

end behavioral;