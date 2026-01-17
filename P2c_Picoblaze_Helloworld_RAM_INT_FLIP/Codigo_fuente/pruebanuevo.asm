;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAMA DE SEGURIDAD CON FSM Y LED DE BLOQUEO
; Mantiene estructura original + Comunicación Hardware
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;declaracion de constantes y variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  
CONSTANT    rs232, FF       ; Puerto serie
CONSTANT    fsm_port, DD    ; NUEVO: Puerto para hablar con la FSM (Hardware)
CONSTANT    vga_port, EF    ; Puerto para VGA (opcional)

; Puertos de caracteres para el XOR
CONSTANT    char1, FE
CONSTANT    char2, FD
CONSTANT    char3, FC
CONSTANT    char4, FB
CONSTANT    xor_res, FA     ; Resultado del XOR

NAMEREG     s1, txreg       
NAMEREG     s2, rxreg       
NAMEREG     s3, contbit     
NAMEREG     s4, cont1       
NAMEREG     s5, cont2
;
ADDRESS     00              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Inicio del programa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISABLE INTERRUPT

start:      
    ; --- NUEVO: CHEQUEO DE BLOQUEO (LED) ---
    ; Antes de imprimir nada, miramos si el hardware nos tiene castigados
    INPUT   s0, fsm_port
    AND     s0, 01          ; Miramos el bit 0 (s_locked)
    JUMP    NZ, start       ; Si es 1 (LED encendido), volvemos a empezar (espera)

    ; --- SI LLEGAMOS AQUI, EL SISTEMA ESTA LIBRE ---

    ; Instrucciones para la parte1 (Imprimir RAM / Vuestra firma)
    LOAD    S7,00
parte1:     
    INPUT   txreg,S7
    ADD     txreg,00
    JUMP    Z, parte2       ; Si es 00 (fin de cadena), vamos a esperar input
    CALL    transmite
    ADD     S7,01
    JUMP    parte1

; Instrucciones para la parte2 (Bucle de espera de usuario)
parte2:     
    ENABLE INTERRUPT        ; Activamos interrupcion para poder escribir
bucle_espera:     
    ; Comprobamos constantemente si el hardware nos bloquea de repente
    INPUT   s0, fsm_port
    AND     s0, 01
    JUMP    NZ, start       ; Si nos bloquean, saltamos al inicio (desactiva int)
    
    JUMP    bucle_espera    ; Si no, seguimos esperando


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rutina de recepcion de caracteres
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rutina de transmision de caracteres
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rutinas de Tiempos (Drivers)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
; RUTINA HASHEA (Recibe, Eco, Hash)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hashea: 
    CALL    recibe
    LOAD    txreg, rxreg
    CALL    transmite
    HASHER  rxreg
    RETURN

saltolinea:
    LOAD    txreg,0D        ; CR
    CALL    transmite
    LOAD    txreg,0A        ; LF
    CALL    transmite
    RETURN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MENSAJES (Mal / Bien)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rutinamal:
    CALL    saltolinea
    LOAD    txreg,6D        ; 'm'
    CALL    transmite
    LOAD    txreg,61        ; 'a'
    CALL    transmite
    LOAD    txreg,6C        ; 'l'
    CALL    transmite
    JUMP    fin

rutinabien:
    CALL    saltolinea
    LOAD    txreg,62        ; 'b'
    CALL    transmite
    LOAD    txreg,69        ; 'i'
    CALL    transmite
    LOAD    txreg,65        ; 'e'
    CALL    transmite
    LOAD    txreg,6E        ; 'n'
    CALL    transmite
    JUMP    fin 

fin:
    ; (Opcional) Imprimir el código de error si quieres debug
    ; LOAD    txreg, rxreg
    ; CALL    transmite
    RETURN


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUTINA DE ATENCION A LA INTERRUPCION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
interrup:   
    DISABLE INTERRUPT

    ; Recibimos y hasheamos los 4 caracteres
    CALL        hashea 
    OUTPUT      rxreg, FE

    CALL        hashea 
    OUTPUT      rxreg, FD

    CALL        hashea 
    OUTPUT      rxreg, FC

    CALL        hashea
    OUTPUT      rxreg, FB

    call        wait_05bit

    ; --- LEER RESULTADO DEL XOR ---
    INPUT       rxreg, FA     ; Leemos resultado (00 o FF)
    
    ; --- NUEVO: AVISAR AL HARDWARE ---
    ; Esto es vital: le decimos a la FSM si hemos acertado o fallado
    OUTPUT      rxreg, fsm_port 
    
    ; Tambien lo mandamos al VGA (codigo original)
    OUTPUT      rxreg, EF           
                      
    ; Comprobamos resultado para el usuario
    OR    		 rxreg, 00           
    CALL        Z, rutinabien       ; Si es 0 -> Bien
    CALL        NZ, rutinamal       ; Si no es 0 -> Mal (use CALL NZ para seguridad)

    ; Volvemos al start para comprobar si el hardware nos ha bloqueado
    RETURNI     ENABLE
    
    ADDRESS     FF
    JUMP        interrup