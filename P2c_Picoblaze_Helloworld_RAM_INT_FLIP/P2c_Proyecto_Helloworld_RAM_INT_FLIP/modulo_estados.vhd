library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity estados is
    Port ( 
        clk             : in  STD_LOGIC;
        reset           : in  STD_LOGIC;
        
        -- Comunicación PicoBlaze
        pb_write_strobe : in  STD_LOGIC;
        pb_port_id      : in  STD_LOGIC_VECTOR(7 downto 0);
        pb_out_port     : in  STD_LOGIC_VECTOR(7 downto 0);
        
        -- Salida
        system_locked   : out STD_LOGIC 
    );
end estados;

architecture Behavioral of estados is

    -- 1. Definición de Estados
    type state_type is (estado_bloqueo, estado_escucha, estado_error1, estado_error2, estado_bien, estado_error3);
    
    -- 2. Señales de Estado (Actual y Siguiente)
    signal current_state : state_type;
    signal next_state    : state_type;
    
    -- Configuración del Timer (5 segundos a 50 MHz)
    constant CLK_FREQ  : integer := 50000000; 
    constant MAX_COUNT : integer := 5 * CLK_FREQ; 
    signal timer_counter : integer range 0 to MAX_COUNT;
    
    -- Puerto de comunicación (x"DD")
    constant PORT_CMD : std_logic_vector(7 downto 0) := x"DD";

begin

    -------------------------------------------------------------------------
    -- PROCESO 1: SÍNCRONO (Memoria y Contadores)
    -- Se encarga de mover current_state <= next_state
    -- Y de contar el tiempo.
    -------------------------------------------------------------------------
    sync_proc: process(clk, reset)
    begin
        if reset = '1' then
            current_state <= estado_bloqueo;
            timer_counter <= 0;
            
        elsif rising_edge(clk) then
            -- Actualizamos el estado
            current_state <= next_state;
            
            -- Lógica del Contador (Solo cuenta si estamos en BLOQUEO)
            if current_state = estado_bloqueo then
                if timer_counter < MAX_COUNT then
                    timer_counter <= timer_counter + 1;
                end if;
            else
                timer_counter <= 0; -- Resetear contador al salir del bloqueo
            end if;
        end if;
    end process;

    -------------------------------------------------------------------------
    -- PROCESO 2: COMBINACIONAL (Lógica de Transición y Salida)
    -- Decide next_state basándose en current_state y entradas.
    -------------------------------------------------------------------------
    comb_proc: process(current_state, pb_write_strobe, pb_port_id, pb_out_port, timer_counter)
    begin
        -- Valores por defecto (para evitar latches)
        next_state    <= current_state;
        system_locked <= '0';

        case current_state is
            
            -- 1. ESTADO DE BLOQUEO (Esperando al Timer)
            when estado_bloqueo =>
                system_locked <= '1'; -- Salida a 1
                
                -- Si el contador del otro proceso ha terminado, cambiamos
                if timer_counter >= MAX_COUNT then
                    next_state <= estado_escucha;
                else
                    next_state <= estado_bloqueo;
                end if;

            -- 2. ESTADO DE ESCUCHA
            when estado_escucha =>
                system_locked <= '0';
                
                if (pb_write_strobe = '1' and pb_port_id = PORT_CMD) then
                    if pb_out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif pb_out_port = x"FF" then   -- Fallo
                        next_state <= estado_error1;
                    end if;
                end if;

            -- 3. ERROR 1 (Quedan 2 intentos)
            when estado_error1 =>
                system_locked <= '0';
                
                if (pb_write_strobe = '1' and pb_port_id = PORT_CMD) then
                    if pb_out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif pb_out_port = x"FF" then   -- Fallo
                        next_state <= estado_error2;
                    end if;
                end if;

            -- 4. ERROR 2 (Queda 1 intento)
            when estado_error2 =>
                system_locked <= '0';
                
                if (pb_write_strobe = '1' and pb_port_id = PORT_CMD) then
                    if pb_out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif pb_out_port = x"FF" then   -- Fallo
                        next_state <= estado_error3;
                    end if;
                end if;

            -- 5. ERROR 3 (Fallo final -> Ir a bloqueo)
            when estado_error3 =>
                -- Transición incondicional al bloqueo
                next_state <= estado_bloqueo;

            -- 6. BIEN (Acierto -> Ir a bloqueo)
            when estado_bien =>
                -- Transición incondicional al bloqueo
                next_state <= estado_bloqueo;
                
        end case;
    end process;

end Behavioral;