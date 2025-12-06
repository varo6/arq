
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity modulo_xor is
    Port (
				 in_port_1 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 1 (Entra YA supuestamente cifrado)
				 in_port_2 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 2
				 in_port_3 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 3
				 in_port_4 : in std_logic_vector(7 downto 0);	--Entrada para CHAR 4
				 port_id : in std_logic_vector(7 downto 0);
				 out_result : out std_logic;
				 reset : in std_logic;
				 clk : in std_logic;
				 writestrobe: in std_logic;
				 readstrobe: in std_logic);

end modulo_xor;

architecture Behavioral of modulo_xor is

signal char_1: std_logic_vector(7 downto 0);
signal char_2: std_logic_vector(7 downto 0);
signal char_3: std_logic_vector(7 downto 0);
signal char_4: std_logic_vector(7 downto 0);

signal out_xor_1 : std_logic_vector(7 downto 0);	--Salida para CHAR 1
signal out_xor_2 : std_logic_vector(7 downto 0);	--Salida para CHAR 2
signal out_xor_3 : std_logic_vector(7 downto 0);	--Salida para CHAR 3
signal out_xor_4 : std_logic_vector(7 downto 0);	--Salida para CHAR 4

begin


    -- Proceso para leer del outport de picoblaze.
	process(reset, clk)
	begin
		if reset = '1' then
			char_1 <= (others => '0');
			char_2 <= (others => '0');
			char_3 <= (others => '0');
			char_4 <= (others => '0');
		elsif rising_edge(clk) then
			if writestrobe = '1' then
				case port_id is
					when x"FF" => char_1 <= in_port_1;  
					when x"FD" => char_2 <= in_port_2; 
					when x"FC" => char_3 <= in_port_3;  
					when x"FB" => char_4 <= in_port_4;  
					when others => null;
				end case;
			end if;
		end if;
	end process;


	-- "HOLA"
	char_1 <= "01001000";
	char_2 <= "01001111";
	char_3 <= "01001100";
	char_4 <= "01000001";

	out_xor_1 <= in_port_1 XOR char_1;
	out_xor_2 <= in_port_2 XOR char_2;
	out_xor_3 <= in_port_3 XOR char_3;
	out_xor_4 <= in_port_4 XOR char_4;

	process(clk)
	begin
		if rising_edge(clk) then
			if readstrobe = '1' then
				if (out_xor_1 = "00000000" AND out_xor_2 = "00000000" AND out_xor_3 = "00000000" AND out_xor_4 = "00000000") then
					out_result <= '1';
				else
					out_result <= '0';
				end if;
			end if;
		end if;
	end process;


end Behavioral;
