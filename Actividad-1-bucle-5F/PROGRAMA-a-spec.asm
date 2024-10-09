;Programa a especificacion rajatabla

;Variables
conta EQU 0x20
status EQU 0x03

;Inicializado
    ORG 0x00
    goto INICIO

;Programa principal
INICIO
    ;Limpiar el contador por si acaso
    CLRF conta

LOOP
    ;Incrementar conta en 1
    INCF conta, F

    ;Revisar si conta ha llegado a 5F
    MOVLW 0x5F
    XORWF conta, W
    BTFSS status, 2  ; Checar si la comparacion da 0
    goto LOOP      ; Si no es 0 seguir iterando

    ;Cuando conta llega a 5F entrar en un bucle infinito no operativo
LOOP_INIFINITO
    goto LOOP_INIFINITO

    END
