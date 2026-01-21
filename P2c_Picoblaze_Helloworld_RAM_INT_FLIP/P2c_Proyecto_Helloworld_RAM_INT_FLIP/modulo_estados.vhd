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
    signal timer_1s : unsigned(25 downto 0); -- "10111110101111000010000000" = 50.000.000 = 1 segundo
    signal count_5  : unsigned(2 downto 0); -- "101" = 5
    
    signal flag : std_logic_vector(1 downto 0); -- "01" si viene de error, "10" si viene de acierto, "00" si acaba de arrancar
    signal timer_done : std_logic;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            estado_actual <= estado_bloqueo;
            flag <= "00";
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
        next_state    <= estado_actual;
        out_result <= "11111111";

        case estado_actual is
            
            -- ESTADO DE BLOQUEO (Esperando al Timer)
            when estado_bloqueo =>
                out_result <= "100000" AND flag;
                
                if rising_edge(timer_done) then
                    next_state <= estado_escucha;
                else
                    next_state <= estado_bloqueo;
                end if;

            -- ESTADO DE ESCUCHA
            when estado_escucha =>
                out_result <= "00000000";
                
                if (write_strobe = '1' and port_id = x"DD") then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error1;
                    end if;
                end if;

            -- ERROR 1 (Quedan 2 intentos)
            when estado_error1 =>
                flag <= "01";
                out_result <= "00000001";
                
                if (write_strobe = '1' and port_id = x"DD") then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error2;
                    end if;
                end if;

            -- ERROR 2 (Queda 1 intento)
            when estado_error2 =>
                flag <= "01";
                out_result <= "00000010";
                
                if (write_strobe = '1' and port_id = x"DD") then
                    if out_port = x"00" then      -- Acierto
                        next_state <= estado_bien;
                    elsif out_port = x"FF" then   -- Fallo
                        next_state <= estado_error3;
                    end if;
                end if;

            -- ERROR 3
            when estado_error3 =>
                flag <= "01";
                out_result <= "00000100";
                next_state <= estado_bloqueo;

            -- 6. BIEN (Acierto -> Ir a bloqueo)
            when estado_bien =>
                flag <= "10";
                out_result <= "00001000";
                next_state <= estado_bloqueo;
                
        end case;
    end process;

end Behavioral;