# Aufgabe 2 - Konstanten, Variablen und Operationen auf Daten

## Anw01
 - Load Register lädt die Adresse von VariableA in R0
 - R0 erhält die Adresse 0x2000000c, an der die Bytes ef be	34	12	00	00	00	00 liegen
 
 ## Anw02
 - Load Register Byte R0 lädt 8 Bit aus dem Speicher in das Register 
 - R2 = 0xef

 ## Anw 03
 - Load Register Byte lädt das Byte an Offset 1 an die Speicheradresse R0 in R3  ef (0. Offset) be (1. Offset)	34 (2. Offset)
 - R3 0xbe

 ## Anw 04
 - Logical Shift Left multipliziert das 0xef (239) mit 2^8 (256), heißt das Register erhält den Wert 0xef00 (61184) 

 ## Anw 05
 - orr verknüpft die Bits beider Operanden
   R2 1110 1111 0000 0000 
             R3 1011 1110 (0xbe)
   R2 1110 1111 1011 1110 Sie werden verknüpft somit bekommt man 0xefbe

 ## Anw 06
 - Store Register Halfword nimmt den Wert von R2 und speichert den im Speicher von R0, die Reihenfolge wird vom Little Endian bestimmt.
 - be  ef  34  12  00  00  00

 ## Anw07
 - Move Lädt die Konstante #ConstByteA in R5
 - R5 = 0xaffe

 ## Anw08
 - Legt ebenfalls affe im Speicher ab und ersetzt be ef
 - fe af 34	12	00	00	00

 ## Anw09
 - Load Register lädt VariableB (0x1234) in R1
 - R1 = 0x2000000e

 ## Anw0A
 - Load Register Halfword lädt 16 Bit aus dem Speicher von R1 in R6
 - R6 erhält daher nun den Wert 0x1234

 ## Anw0B
 - Lädt den Wert 0x30ED in das Register R7
 - R7 = 0x30ED
 - Zur Lösung der Aufgabe konnte man hier die Konstante 0x21DE einsetzen. Diese erhält man durch Differenz von 3412 - 1234 = 21DE

 ## Anw 0C
 - Addiert die Werte von R6 und R7 und das Ergebnis in R6
 - R6 = 01234 + 030ED 0x4321

 ## Anw0D
 - Store Register Halfword speichert den Wert von R6 an der Speicheradresse von R1
 - 34 12 00	00 wird durch 12 34	00	00 ersetzt

 ## Anw0E
 - Endlosschleife

 ## Op01
 - Load Register lädt die Adresse von VariableC in das Register R8
 - R8 = 0x20000010

 ## Op02
 - Load Register Byte lädt das Byte an Offset 1 von VariableC in R10
 - FE AF
 - R10 = 0xAF

 ## Op03
 - Load Register Byte lädt das Byte vom Speicher in R9
 - R9 = 0xFE

 ## Op04 
 - Logical Shift Left verschiebt R9 um 8 Bit nach links
 - R9 = 0xFE00

 ## Op05
 - ORR verknüpft R9 und R10 (siehe Anw05)
 - R9 = 0XFEAF

 ## Op06
- Store Register Halfword speichert den 16Bit Wert aus R9 an der Speicheradresse von VariableC R8
- Durch die Bestimmung von Little Endian haben die Bytes folgende Anordnung:
  0x20000010	af	fe	00	00	00











Konstante 0x21DE durch Differenz von 3412 - 1234 = 21DE
VariableC so eingeleitet wie beim Schema oben

