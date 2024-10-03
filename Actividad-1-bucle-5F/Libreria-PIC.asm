;Programa conta
LIST P=16F84A

;Inluir libreria del microchip para hacer uso de los registros de estado y proposito especifico
;Asi como poder inluir los bits de configuracion
#include <p16f84a.inc>

;Bits de configuracion
__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_OFF & _XT_OSC

;Declaracion del contador
conta EQU 0x20

;Inicializado
 ORG 0x00
 goto START

;Programa principal
START
    ;Limpiar el contador
    CLRF conta

LOOP
    ;Incremento del contador en 1
    INCF conta, F

    ;Comprobar si el contador ha llegado al valor deseado
    MOVLW 0x5F
    XORWF conta, W
    BTFSS STATUS, Z
    ;Volver a iterar si el contador todavia no llega al valor deseado
    goto LOOP

    ;Si el contador a llegado al valor deseado limpiar el contador
    CLRF conta
    ;Volver al loop inicial
    goto LOOP

    END