;yasm .f elf64 pr4.asm -o pr4.o
;ld -m elf_i386 pr4.o -o pr4.out

;Genera ciclos for 

%include 'funciones.asm'

GLOBAL _start

SECTION   .text
_start:
	mov ecx, 0
	
nextNumber:
	mov eax,ecx ;ecx es iniciado en 0
	inc ecx ;se incrementa en uno el valor de ecx, ek vakir de ecx es 49=1
	add eax, 48 ;se suma 48 en el direcctorio 48+0 que en ascci es 0
	push eax ;se almacena eax a la pila
	mov eax, esp ;se mueve el valor de eax a la pila
	call imprimirLF
	pop eax ; limpia a pia para que no tenga valores inecesarios ocupandoespacio
	cmp ecx, 256 ;ya llegamos a 10? compara nuestro contador con decimal 10
	jne nextNumber ;salta si no es 10, y sigue contand
	call salir
	
SECTION .data
	msg1 db "Hola, mundo cruel",10,0,7
	msg2 db "Reciclando codigo asm",10,0
