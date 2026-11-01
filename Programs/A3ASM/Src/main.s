;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                mov   r0,#0x12                      ; Anw-01 lädt den Wert 0x12 in R0
                mov   r1,#-128                      ; Anw-02 lädt den Wert -128 in R1
                ldr   r2,=0x12345678                ; Anw-03 lädt den Wert 0x12345678 in R2

; Zugriff auf Variable
                ldr   r0,=VariableA                 ; Anw-04 lädt die Adresse von VariableA in R0
                ldrh  r1,[r0]                       ; Anw-05 liest 2 Byte der Adresse in R0 nach R1
                ldr   r2,[r0]                       ; Anw-06 liest 4 Bytes der Adresse in R0 nach R2
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07 schreibt den Inhalt von R2 an die Adresse von VariableC

; Zugriff auf Felder (Speicherzellen)
                ldr   r0,=MeinHalbwortFeld          ; Anw-08 lädt Startadresse in R0
                ldrh  r1,[r0]                       ; Anw-09 2 Bytes aus der Speicheradresse R0 in R1
                ldrh  r2,[r0,#2]                    ; Anw-10 Offset 2 2B ytes in R2
                mov   r3,#10                        ; Anw-11 Konstante 10 in R3 geladen
                ldrh  r4,[r0,r3]                    ; Anw-12 2 Bytes aus R0 + R3 gelesen und in R4 gespeichert

                ldrh  r5,[r0,#2]!                   ; Anw-13 liest 2 Bytes ab R0 + 2 nach R5 und erhöht R0 um 2
                ldrh  r6,[r0,#2]!                   ; Anw-14 liest 2 Bytes ab R0 + 2 nach R6 und erhöht R0 erneut um 2
                strh  r6,[r0,#2]!                   ; Anw-15 schreibt die unteren 2 Bytes von R6 nach R0 + 2 und erhöht R0 um 2

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ldr  r0,=MeinWortFeld               ; Anw-16 lädt die Startadresse von MeinWortFeld in R0
                ldr  r1,[r0]                        ; Anw-17 liest 4 Bytes ab R0 nach R1 
                ldr  r2,[r0,#4]                     ; Anw-18 liest 4 Bytes ab R0 + 4 nach R2 
                adds r3,r1,r2                       ; Anw-19 addiert R1 und R2, speichert das Ergebnis in R3 

                ldr  r4,[r0,#8]                     ; Anw-20 liest 4 Bytes ab R0 + 8 nach R4
                ldr  r5,[r0,#12]                    ; Anw-21 liest 4 Bytes ab R0 + 12 nach R5
                subs r6,r4,r5                       ; Anw-22 subtrahiert R5 von R4, speichert das Ergebnis in R6

                ldr  r7,[r0,#16]                    ; Anw-23 liest 4 Bytes ab R0 + 16 nach R7 
                ldr  r8,[r0,#20]                    ; Anw-24 liest 4 Bytes ab R0 + 20 nach R8
                subs r9,r7,r8                       ; Anw-25 subtrahiert R8 von R7, speichert das Ergebnis in R9
                  mrs r10, APSR
forever         b   forever                         ; Anw-26
                ENDP
                END