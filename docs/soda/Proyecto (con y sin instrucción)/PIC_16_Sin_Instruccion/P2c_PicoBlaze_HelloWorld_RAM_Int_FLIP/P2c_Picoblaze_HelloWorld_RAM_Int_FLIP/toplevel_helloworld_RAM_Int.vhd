library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity toplevel is
   Port (     -- port_id : out std_logic_vector(15 downto 0);	--solo para depurar
--           write_strobe : out std_logic;	 						--solo para depurar
--            read_strobe : out std_logic;							--solo para depurar
--               out_port : out std_logic_vector(15 downto 0);	--solo para depurar
--                in_port : out std_logic_vector(15 downto 0);	--solo para depurar
						reset : in std_logic;
						  clk : in std_logic;
						   rx : in std_logic;
				         tx : out std_logic;
		     		      LED : out std_logic);	 --led de comprobacion y reset
end toplevel ;

architecture behavioral of toplevel is
----------------------------------------------------------------
-- declaracion del picoblaze
----------------------------------------------------------------
  component picoblaze
    Port (      address : out std_logic_vector(15 downto 0);
            instruction : in std_logic_vector(25 downto 0);
                port_id : out std_logic_vector(15 downto 0);
           write_strobe : out std_logic;
               out_port : out std_logic_vector(15 downto 0);
            read_strobe : out std_logic;
                in_port : in std_logic_vector(15 downto 0);
              interrupt : in std_logic;
                  reset : in std_logic; 
						  clk : in std_logic);
    end component;

-----------------------------------------------------------------
-- declaración de la ROM de programa
-----------------------------------------------------------------
  component programa_helloworld_int_FLIP
    Port (      address : in std_logic_vector(15 downto 0);
            		   dout : out std_logic_vector(25 downto 0);
                    clk : in std_logic);
    end component;
	 
-----------------------------------------------------------------
-- Signals usadas para conectar el picoblaze y la ROM de programa
-----------------------------------------------------------------
signal     address : std_logic_vector(15 downto 0);
signal instruction : std_logic_vector(25 downto 0);
		
-----------------------------------------------------------------
-- Signals para debugging 
-----------------------------------------------------------------
signal readstrobe: std_logic;															--Señal para leer sobre los perifericos
signal writestrobe: std_logic;														--Señal para escribir sobre los perifericos
signal portid: std_logic_vector(15 downto 0);										--Indica la direccion a la que se esta apuntando en el espacio E/S del dato que se quiere utilizar
signal inport: std_logic_vector(15 downto 0);										
signal outport: std_logic_vector(15 downto 0);									--Sera la que guarde los datos
signal picoint: std_logic;

type ram_type is array (0 to 63) of std_logic_vector (15 downto 0);      --Parte Declarativa  (se define un tipo) de la memoria RAM (le damos en la Bombilla, Sintesis, coding example, RAM, Distributed RAM)
signal RAM : ram_type := (																--Mirar siempre los templates
x"0050", x"0049", x"0043", x"0020", x"0031", x"0036", x"0020", x"0042",						
x"0049", x"0054", x"0053", x"0020", x"002D", x"0020", x"0032", x"0030",						
x"0032", x"0035", x"000A", x"000D", x"004A", x"004F", x"0053", x"0045",
x"0044", x"0041", x"0020", x"003A", x"0029", x"0020", x"0045", x"004E",
x"0052", x"0049", x"0051", x"0055", x"0045", x"0020", x"000A", x"000D",
x"0050", x"0052", x"0045", x"0053", x"0053", x"0020", x"0041", x"004E",
x"0059", x"0020", x"004B", x"0045", x"0059", x"0020", x"0054", x"004F",
x"0020", x"0053", x"0054", x"0041", x"0052", x"0054", x"000A", x"000D");
																													--En esta parte se declara el contenido de la RAM, cada celda tendra un valor inicial (en HEX)
																													--Creamos una matriz de celdas de 0 a 64 bytes (En HEX de 0x00 a 0x3F), formadas por celdas de 8 bits
signal rxbuff_out,RAM_out: std_logic_vector(15 downto 0);

begin

	LED <= reset; 	-- para comprobar la programacion encendemos
						--	un led cada vez que reseteamos

--	read_strobe <= readstrobe;
--	write_strobe <= writestrobe;
--	port_id <= portid;
--	in_port <= inport;
--	out_port <= outport;
	picoint <= NOT rx;						--Implementado nuevo, esto conecta una señal a la señal de interrupcion (del puerto "rx" en entity lo llevamos a una puerta NOT
													--que va a una señal de interrupcion picoint (este primero es el "cable") que abajo juntamos con la señal interrupt
  processor: picoblaze
    port map(      address => address,
               instruction => instruction,
                   port_id => portid,
              write_strobe => writestrobe,
                  out_port => outport,
               read_strobe => readstrobe,
                   in_port => inport,
                 interrupt => picoint,	--Aqui juntamos rx con interrupt mediante picoint ("cable imaginario que une ambos puertos")
                     reset => reset,
                       clk => clk);

  program: programa_helloworld_int_FLIP
    port map(     address => address,
               	     dout => instruction,
                      clk => clk);

	--registra el bit tx del puerto de salida, por si éste cambia
	txbuff:process(reset, clk)
	begin
		if (reset='1') then
			tx <= '1';
		elsif rising_edge(clk) then
			if (writestrobe = '1' and portid=x"00FF") then
				tx <= outport(0);	
			end if;
		end if;
	end process;
	
	--añade 7ceros a rx para meterlos al puerto de entrada cuando se lea
	rxbuff:process(reset, clk)
	begin
		if (reset='1') then
			rxbuff_out <= (others=>'1');
		elsif rising_edge(clk) then
			if (readstrobe = '1' and portid =x"00FF") then
				rxbuff_out <= rx & "000000000000000";	---anadir mas ceros duda
			end if;		 
		end if;
	end process;
	
	-- Memoria RAM (escritura sincrona / lectura asincrona)				--Aqui instanciamos la memoria RAM (previamente declarada en la zona Declarativa antes del begin)
	process (clk)																		--Si se declara y no se instancia, no se puede utilizar
	begin
		if (clk'event and clk = '1') then
			if (writestrobe = '1' and portid<x"0040") then
				RAM(to_integer(unsigned(portid))) <= outport;				--En todo este proceso escribimos valores de "outport" en nuestra memoria RAM
			end if;
		end if;
	end process;																		--Desde el principio es un proceso sincrono
	RAM_out <= RAM(to_integer(unsigned(portid)));							--Este es asincrono, es la linea que se utiliza para LEER de la RAM
	
-- Multiplexor inport
inport <= RAM_out when (readstrobe = '1' and portid<x"0040") else		--Creamos un nuevo Multiplexor (MUX) haciendo uso de las plantillas (es el de 2-to-1(assign)) es como un conmutador
			 rxbuff_out when (readstrobe = '1' and portid=x"00FF") else	--La salida del multiplexor (input) sera RAM_out (de la memoria RAM) mediante una serie de condiciones (selector)
			 x"0000";

end behavioral;