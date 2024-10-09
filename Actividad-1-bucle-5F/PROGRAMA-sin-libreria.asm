; Program: Counter
; Microcontroller: PIC16F84A

; Configuration bits
;__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_OFF & _XT_OSC

; Define counter variable
#define conta 0x20

; Reset vector
    ORG 0x00
    goto START

; Main program
START
    ; Clear the counter
    CLRF conta

LOOP
    ; Increment the counter by 1
    INCF conta, F

    ; Check if the counter has reached the desired value (0x5F)
    MOVLW 0x5F
    XORWF conta, W
    BTFSS 0x03, 2  ; Check Zero flag in STATUS register (0x03)
    goto LOOP      ; If not equal, continue loop

    ; If counter reached desired value, clear it
    CLRF conta

    ; Return to the beginning of the loop
    goto LOOP

    END
