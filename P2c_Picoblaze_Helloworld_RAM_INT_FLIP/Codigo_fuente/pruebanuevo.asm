;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAMA MATRICULA: FIRMA + AUTOCLEAN + ASTERISCOS + MELODIA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CONSTANT    rs232, FF       
CONSTANT    fsm_port, DD    
CONSTANT    vga_port, EF    

CONSTANT    char1, FE
CONSTANT    char2, FD
CONSTANT    char3, FC
CONSTANT    char4, FB
CONSTANT    xor_res, FA     

NAMEREG     s1, txreg       
NAMEREG     s2, rxreg       
NAMEREG     s3, contbit     
NAMEREG     s4, cont1       
NAMEREG     s5, cont2
;
ADDRESS     00              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INICIO ABSOLUTO (Solo al encender)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISABLE INTERRUPT

inicio_total:      
    ; 1. Chequeo inicial de seguridad
    INPUT   s0, fsm_port
    AND     s0, 01          
    JUMP    NZ, inicio_total ; Si arranca bloqueado, espera.

    ; 2. IMPRIMIR FIRMA (ARQ VARO...)
    ; Esto solo se ejecuta UNA VEZ al encender la placa
    LOAD    S7,00           
print_ram_loop:     
    INPUT   txreg,S7
    ADD     txreg,00        
    JUMP    Z, ciclo_usuario ; Fin de firma -> Vamos al bucle principal
    CALL    transmite
    ADD     S7,01
    JUMP    print_ram_loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CICLO DE USUARIO (Se repite tras bloqueo)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ciclo_usuario:     
    ; 1. BORRAR PANTALLA (Magia automatica)
    CALL    cls
    
    ; 2. Imprimir "INTRO PASS: "
    CALL    msg_intro       
    
    ; 3. Activar interrupciones y esperar
    ENABLE INTERRUPT        
    
bucle_espera:     
    ; Vigilamos si el hardware nos bloquea (Fallo x3)
    INPUT   s0, fsm_port
    AND     s0, 01
    JUMP    NZ, rutina_bloqueo ; Si hay bloqueo, saltamos a la sala de espera
    
    JUMP    bucle_espera    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUTINA DE BLOQUEO (Sala de Castigo)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rutina_bloqueo:
    ; Aquí entramos cuando s_locked = 1
    ; Nos quedamos aqui dando vueltas los 5 segundos
    INPUT   s0, fsm_port
    AND     s0, 01
    JUMP    NZ, rutina_bloqueo  ; ¿Sigue bloqueado? Repetir.
    
    ; ¡SE ACABO EL CASTIGO!
    ; El hardware ha puesto s_locked a 0.
    ; Saltamos a 'ciclo_usuario' para borrar pantalla y pedir pass.
    JUMP    ciclo_usuario


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUTINAS RS232 (Drivers)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
recibe:     
    INPUT   rxreg, rs232
    AND     rxreg, 80
    JUMP    NZ, recibe
    CALL    wait_05bit
    LOAD    contbit,09
next_rx_bit: 
    CALL    wait_1bit
    SR0     rxreg
    INPUT   s0, rs232
    AND     s0, 80
    OR      rxreg, s0
    SUB     contbit, 01
    JUMP    NZ, next_rx_bit
    RETURN

transmite:  
    LOAD    s0, 00
    OUTPUT  s0, rs232
    CALL    wait_1bit
    LOAD    contbit, 08
next_tx_bit: 
    OUTPUT  txreg, rs232
    CALL    wait_1bit
    SR0     txreg
    SUB     contbit, 01
    JUMP    NZ, next_tx_bit
    LOAD    s0, FF
    OUTPUT  s0, rs232
    CALL    wait_1bit
    RETURN

wait_1bit:  LOAD    cont1, 03  
espera2:    LOAD    cont2, 22
espera1:    SUB     cont2, 01
    JUMP    NZ, espera1
    SUB     cont1, 01
    JUMP    NZ, espera2
    RETURN

wait_05bit: LOAD    cont1, 03 
espera4:    LOAD    cont2, 10
espera3:    SUB     cont2, 01
    JUMP    NZ, espera3
    SUB     cont1, 01
    JUMP    NZ, espera4
    RETURN


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MENSAJES Y UTILIDADES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hashea: 
    CALL    recibe          ; Recibe la letra REAL (ej: 'A') en rxreg
    
    ; --- CAMBIO PRO: ENMASCARAMIENTO ---
    LOAD    txreg, 2A       ; Cargamos el codigo ASCII del ASTERISCO '*'
    CALL    transmite       ; Enviamos '*' a la pantalla (ocultando la letra)
    ; -----------------------------------
    
    HASHER  rxreg           ; Hasheamos la letra REAL (rxreg), no el asterisco
    RETURN

saltolinea:
    LOAD    txreg,0D
    CALL    transmite
    LOAD    txreg,0A
    CALL    transmite
    RETURN

; --- RUTINA LIMPIAR PANTALLA (ANSI CLEAR) ---
cls:
    LOAD    txreg, 1B       ; ESC
    CALL    transmite
    LOAD    txreg, 5B       ; [
    CALL    transmite
    LOAD    txreg, 32       ; 2
    CALL    transmite
    LOAD    txreg, 4A       ; J
    CALL    transmite
    ; Mover cursor al inicio
    LOAD    txreg, 1B       ; ESC
    CALL    transmite
    LOAD    txreg, 5B       ; [
    CALL    transmite
    LOAD    txreg, 48       ; H
    CALL    transmite
    RETURN

msg_intro:
    CALL    saltolinea
    LOAD    txreg, 49   ; I
    CALL    transmite
    LOAD    txreg, 4E   ; N
    CALL    transmite
    LOAD    txreg, 54   ; T
    CALL    transmite
    LOAD    txreg, 52   ; R
    CALL    transmite
    LOAD    txreg, 4F   ; O
    CALL    transmite
    LOAD    txreg, 20   ; space
    CALL    transmite
    LOAD    txreg, 50   ; P
    CALL    transmite
    LOAD    txreg, 41   ; A
    CALL    transmite
    LOAD    txreg, 53   ; S
    CALL    transmite
    LOAD    txreg, 53   ; S
    CALL    transmite
    LOAD    txreg, 3A   ; :
    CALL    transmite
    LOAD    txreg, 20   ; space
    CALL    transmite
    RETURN

msg_error:
    CALL    saltolinea
    
    ; 1. BEEP DE ERROR (1 pitido)
    LOAD    txreg, 07       ; Bell ASCII
    CALL    transmite
    
    ; 2. Texto ERROR
    LOAD    txreg, 20   ; space
    CALL    transmite
    LOAD    txreg, 45   ; E
    CALL    transmite
    LOAD    txreg, 52   ; R
    CALL    transmite
    LOAD    txreg, 52   ; R
    CALL    transmite
    LOAD    txreg, 4F   ; O
    CALL    transmite
    LOAD    txreg, 52   ; R
    CALL    transmite
    CALL    saltolinea
    RETURN

msg_felicidades:
    CALL    saltolinea

    ; --- CAMBIO PRO: MELODIA VICTORIA (3 Beeps) ---
    LOAD    txreg, 07       ; Beep 1
    CALL    transmite
    LOAD    txreg, 07       ; Beep 2
    CALL    transmite
    LOAD    txreg, 07       ; Beep 3
    CALL    transmite
    ; ----------------------------------------------

    LOAD    txreg, 20   ; space
    CALL    transmite
    LOAD    txreg, 46   ; F
    CALL    transmite
    LOAD    txreg, 45   ; E
    CALL    transmite
    LOAD    txreg, 4C   ; L
    CALL    transmite
    LOAD    txreg, 49   ; I
    CALL    transmite
    LOAD    txreg, 43   ; C
    CALL    transmite
    LOAD    txreg, 49   ; I
    CALL    transmite
    LOAD    txreg, 44   ; D
    CALL    transmite
    LOAD    txreg, 41   ; A
    CALL    transmite
    LOAD    txreg, 44   ; D
    CALL    transmite
    LOAD    txreg, 45   ; E
    CALL    transmite
    LOAD    txreg, 53   ; S
    CALL    transmite
    LOAD    txreg, 21   ; !
    CALL    transmite
    LOAD    txreg, 21   ; !
    CALL    transmite
    CALL    saltolinea
    RETURN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INTERRUPCION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
interrup:   
    DISABLE INTERRUPT

    ; Ahora hashea imprime asteriscos automaticamente
    CALL    hashea 
    OUTPUT  rxreg, FE
    CALL    hashea 
    OUTPUT  rxreg, FD
    CALL    hashea 
    OUTPUT  rxreg, FC
    CALL    hashea
    OUTPUT  rxreg, FB

    call    wait_05bit

    INPUT   rxreg, FA       ; Leer resultado XOR
    OUTPUT  rxreg, fsm_port ; Informar FSM
    OUTPUT  rxreg, EF       ; Informar VGA (Verde/Rojo)
    
    OR      rxreg, 00            
    CALL    Z, msg_felicidades   
    CALL    NZ, msg_error        

    RETURNI ENABLE
    
    ADDRESS FF
    JUMP    interrup