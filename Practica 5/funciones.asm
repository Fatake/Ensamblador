cadenalon:
	push ebx
	mov ebx, eax
	
nextCaracter:
	cmp byte[eax],0
	jz finalizar
	inc eax
	jmp nextCaracter
	
finalizar:
	sub eax,ebx
	pop ebx  ;saca un elemento de la pila
	ret
	
imprimir:
	push edx ;mete elementos a la memoria a la pila
	push ecx
	push ebx
	push eax
	call cadenalon
	
	mov edx,eax
	pop eax
	
	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80H
	
	pop ebx
	pop ecx
	pop edx
	ret

imprimirLF:
	call imprimir
	push eax ;se mete en la pila para reservar el valor mientras se usa e registro
	mov eax,10 ;se pone el salto de line cuyo numero es el 10 ascii
	push eax ;Mete el salto de linea en a pila
	mov eax, esp ;mueve el contenido completo de la pila a eax
	call imprimir ;llamada a imprimir cada caracter
	pop eax ;elimina el caracter de salto de line de la pila
	pop eax ;se restaura el valor de eax al valor antes de que imprimirLF fuera llamada
	ret
	
salir:
	mov ebx,0
	mov eax,1
	int 0x80
	ret
