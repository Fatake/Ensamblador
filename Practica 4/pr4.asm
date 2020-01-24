;yasm .f elf64 pr4.asm -o pr4.o
;ld -m elf_i386 pr4.o -o pr4.out

%include 'funciones.asm'

GLOBAL _start

SECTION .data
	msg1 db "Hola, mundo cruel",10,0,7
	msg2 db "Reciclando codigo asm",10,0
	
SECTION   .text
_start:
	mov eax, msg1
	call imprimir
	
	mov eax, 0       ;llama a syscall para leer de teclado
	mov edi, 0       ;0 recive una entrada stin
	mov esi, nombre  ;la direccion de memoria donde se guara nombre
	mov edx, nomLong ;la cantidad de bits que tiene nombre  db $-nombre
	syscall
	
	mov eax, msg2
	call imprimir
	
	mov eax, nombre
	call imprimir
	
	call salir
	
section .bss
	;variables no inicializadas
	;solo se declaran pero no usa espacio de moria
	;hasta sedr utilizadas
	nombre resb 16       ;resb reserva 16 bits
	nomLong equ $-nombre ;equ igual
