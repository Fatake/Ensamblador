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
	
salir:
	mov ebx,0
	mov eax,1
	int 0x80
	ret
