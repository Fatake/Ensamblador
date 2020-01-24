DATOS SEGMENT PARA 'DATA'
  REN     DB      10
  COL     DB      5
DATOS ENDS

PILA SEGMENT PARA STACK 'STACK'
  DW      100     DUP(0)
PILA ENDS

CODIGO SEGMENT PARA 'CODE'
  ASSUME  CS:CODIGO, DS:DATOS, SS:PILA, ES:NOTHING

  LIMPIA_PANTALLA PROC NEAR
     MOV AX, 0600H
     MOV BH, 07H     ; 71H Fondo=blanco frente=AZUL, 07 Fo=negro Fr=blanco
     MOV CX, 0000H   ; 35h  Fo=cyan  fr=lila?  26h fo=verde fr=amarillo
     MOV DX, 184FH
     INT 10H
     RET
  LIMPIA_PANTALLA ENDP

  POSICIONA_CURSOR PROC NEAR
     MOV DH,REN
     MOV DL,COL
     MOV AH,02
     MOV BH,00
     INT 10H
     RET
  POSICIONA_CURSOR ENDP


  ESCRIBE_AST PROC NEAR
     MOV DL,'*'
     MOV AH,02
     INT 21H
     RET
  ESCRIBE_AST ENDP


  PRINCIPAL PROC FAR
     PUSH DS
     XOR AX, AX
     PUSH AX
     MOV AX, DATOS
     MOV DS, AX
     MOV ES, AX
     CALL LIMPIA_PANTALLA
     MOV REN,2
   ciclo1:  cmp ren,10
     jg salir
     mov col,5
  ciclo2:   cmp col,13
     jg sigue
     CALL POSICIONA_CURSOR
     CALL escribe_ast
     add col,2
     jmp ciclo2
   sigue:  add ren,2
     jmp ciclo1
     mov ah,0
     int 21h
salir: RET
  PRINCIPAL ENDP

CODIGO ENDS
  END PRINCIPAL
