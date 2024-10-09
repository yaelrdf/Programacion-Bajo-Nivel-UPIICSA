;Programa sin utilizar librerias llenado constante

;Variables
conta EQU 0x20
status EQU 0x03

;Inicializado
    ORG 0x00
    goto INICIO

;Programa principal
INICIO
    ;Limpiar conta por si a caso
    CLRF conta

LOOP
    ;Incrementar conta en 1
    INCF conta, F

    ;Checar si conta es igual a 5F
    MOVLW 0x5F
    XORWF conta, W
    BTFSS status, 2  ; Checar si la comparacion dio como valor 0
    goto LOOP      ; Si no es o seguir iterando

    ;Si conta llega a 5F limpiar conta
    CLRF conta

    ;Seguir iterando infinitamente
    goto LOOP

    END
