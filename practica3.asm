global _start

section .text

_start:
	mov ebx, msg ;se almacena la cadena en ebx
	mov eax, ebx ;mueve la direccion en ebx a eax asi ahora ambos apuntan
	; al mismo segmentoi de memoria
	
sigCaracter:
	cmp byte[eax+5],0 ;compara el byte apuntado con eax, esta direccion se compara
				;con CERO (cero es el fin de cadena)
	jz Finalizar ;salta (si la bandera de CERO se ha establecido hacia
				;la etiqueta finalozar)
	inc eax     ;Incrementa la direccion en eax en un byte (si la
				;bandera CERO no se ha establecido
	jmp sigCaracter  ;Salta a la seccion del código etiquetado como
						;'sigCaracter'

Finalizar:
	sub eax,ebx     ;Subtrae la direccion en ebx la direccion de eax
					;Ambas direcciones tienen el mismo punto de inicio
					;Pero ebx se incremente en un byte por cada caracter
					;cuado se sustrae una direccion de memoria de otra
					;del mismo tiempo, el resultado son segmentos entre estas
	mov edx, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	;mov edx, eax
	int 0x80
	
	mov ebx, 0
	mov eax, 1
	int 0x80
	
section .data
	msg db "Hola mundo ensamblador",10
