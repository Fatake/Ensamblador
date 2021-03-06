
DATOS SEGMENT PARA 'DATA'
  REN     DB    0
  COL     DB    0 
DATOS ENDS

PILA SEGMENT PARA STACK 'STACK'
  DW      100     DUP(0)
PILA ENDS

CODIGO SEGMENT PARA 'CODE'
  ASSUME  CS:CODIGO, DS:DATOS, SS:PILA, ES:NOTHING

  POSICIONA_CURSOR PROC NEAR
     MOV AH,02
     MOV BH,00
     MOV DH,REN
     MOV DL, COL
     INT 10H
     RET
  POSICIONA_CURSOR ENDP
  DIGITO PROC NEAR
     CMP AL,'0'
     JL FDIG
     CMP AL,'9'
     JG FDIG
     MOV AH,01
     JMP FDIG2
  FDIG: MOV AH,0
  FDIG2: RET
  DIGITO ENDP
  LEECARACTER PROC NEAR
  MOV AH,08
  MOV BH,0
  INT 10H
  RET
  LEECARACTER ENDP

  COLOR PROC NEAR
  MOV AH,9
  MOV BH,0
  MOV BL,0AFH
  MOV CX,1
  INT 10H
  RET
  COLOR ENDP

  PRINCIPAL PROC FAR
     PUSH DS
     XOR AX, AX
     PUSH AX
     MOV AX, DATOS
     MOV DS, AX
     MOV ES, AX

CON1:
     CMP REN, 24
     JG FIN
     MOV COL, 0
CON2:
     CMP COL, 79
     JG INCREN

     CALL POSICIONA_CURSOR
     CALL LEECARACTER
     CALL DIGITO
     CMP AH, 0
     JE SALTA
     CALL COLOR
SALTA:
     INC COL
     JMP CON2
INCREN:
     INC REN
     JMP CON1

FIN: RET
  PRINCIPAL ENDP

CODIGO ENDS
  END PRINCIPAL
