library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity estados is
    Port ( 
        clk             : in  STD_LOGIC;
        reset           : in  STD_LOGIC;
        
        write_strobe : in  STD_LOGIC;
        read_strobe: in std_logic;
        port_id      : in  STD_LOGIC_VECTOR(7 downto 0);
        out_port     : in  STD_LOGIC_VECTOR(7 downto 0);
        out_result : out std_logic_vector(7 downto 0)
    );
end estados;

architecture Behavioral of estados is

    -- Estados FSM
    type state_type is (estado_bloqueo, estado_escucha, estado_error1, estado_error2, estado_error3, estado_bien);
    
    signal estado_actual : state_type;
    signal next_state    : state_type;
    
    -- 5 segundos a 50000000 MHz = 250000000 ciclos
    signal timer_1s : std_logic_vector(25 downto 0); -- "10111110101111000010000000" = 50.000.000 = 1 segundo
    signal count_5 : std_logic_vector(2 downto 0); -- "101" = 5
    
    signal flag : std_logic_vector(1 downto 0); -- "01" si viene de error, "10" si viene de acierto
    signal timer_done : std_logic;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            estado_actual <= estado_bloqueo;

            
        elsif rising_edge(clk) then
            estado_actual <= next_state;
        end if;
    end process;

begin
    process(clk, reset,estado_actual)
    begin
        if (reset = '1') then
            timer_1s <= (others =>'0');
            count_5 <= (others =>'0');
            
        elsif rising_edge(clk) then
            if (estado_actual = estado_bloqueo) then
                timer_done <= '0';
                if (count_5 < 5) then
                    if (timer_1s = "10111110101111000010000000") then
                        timer_1s <= (others => '0');
                        count_5  <= count_5 + 1;
                    else
                        timer_1s <= timer_1s + 1;
                    end if;
                else
                    count_5 <= (others => '0');
                    timer_1s <= (others => '0');
                end if;
                
            else
                timer_done <= '1';
                timer_1s <= (others => '0');
                count_5  <= (others => '0');
            end if;
        end if;
    end process;

    process(estado_actual, write_strobe, port_id, out_port, timer_counter)
    begin
        -- Valores por defecto (para evitar latches)
        next_state    <= estado_actual;
        system_locked <= '0';

        case estado_actual is
            
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
                
                if (write_strobe = '1' and port_id = PORT_CMD) then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error1;
                    end if;
                end if;

            -- 3. ERROR 1 (Quedan 2 intentos)
            when estado_error1 =>
                system_locked <= '0';
                
                if (write_strobe = '1' and port_id = PORT_CMD) then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error2;
                    end if;
                end if;

            -- 4. ERROR 2 (Queda 1 intento)
            when estado_error2 =>
                system_locked <= '0';
                
                if (write_strobe = '1' and port_id = PORT_CMD) then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error3;
                    end if;
                end if;

            -- 5. ERROR 3 (Fallo final -> Ir a bloqueo)
            when estado_error3 =>
                -- Transici�n incondicional al bloqueo
                next_state <= estado_bloqueo;

            -- 6. BIEN (Acierto -> Ir a bloqueo)
            when estado_bien =>
                -- Transici�n incondicional al bloqueo
                next_state <= estado_bloqueo;
                
        end case;
    end process;

end Behavioral;