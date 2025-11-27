------------------------------------------------------------------------------------
--
-- Definition of an 16-bit flip process
-- Operation
--
-- The input operand is flipped
--
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip is														--Resolucion de la instruccion flip
    Port (operand : in std_logic_vector(15 downto 0);	--operand es el S3 que sale en FLIP S3 (el registro que cambiamos de valor)
          Y : out std_logic_vector(15 downto 0);
          clk : in std_logic);
end flip;
--
architecture low_level_definition of flip is
begin
  bus_width_loop: for i in 0 to 15 generate				--cuando i vale 0, el valor del bit pasa al 7 con la instruccion de abajo_			
  begin
     FF:
     process (clk)
      begin
  		if (clk'event and clk = '1') then
         Y(i) <= operand(15-i);								--_Aqui pasamos el valor a su lugar espejo
		end if;
     end process FF;
  end generate bus_width_loop;
--
end low_level_definition;
