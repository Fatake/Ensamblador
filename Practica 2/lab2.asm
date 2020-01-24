global _start

section .text

_start:

	call _mensaje
	call _leer
	call _saludo
	call _nombre
	
	mov rax, 60  ;llama a syscall para salir
	xor rdi, rdi ;exit retorna un numero deseadp para saver si salio bien o no 
	syscall
	
_mensaje:
	mov rax, 1   ;llama al syscall para escribir en comando 1 escritura 0 lectura
	mov rdi, 1   ;retorna maneja un archi y salida estandar stout
	mov rsi, MENSAJE ;La direccion donde guardo mensaje
	mov rdx, menLong ;numero de bits que necesita
	syscall      ;llama a sistema
	ret      ;retorna
	
_saludo:	
	mov rax, 1  ;permite mostrar en pantalla 
	mov rdi, 1
	mov rsi, men
	mov rdx, tam
	syscall
	ret
	
_nombre:	
	mov rax, 1
	mov rdi, 1
	mov rsi, nombre
	mov rdx, nomLong
	syscall
	ret

_leer:
	mov rax, 0       ;llama a syscall para leer de teclado
	mov rdi, 0       ;0 recive una entrada stin
	mov rsi, nombre  ;la direccion de memoria donde se guara nombre
	mov rdx, nomLong ;la cantidad de bits que tiene nombre  db $-nombre
	syscall
	ret
	
section .data
	MENSAJE db "¿Cual es tu nombre?",10
	menLong equ $-MENSAJE
	men db "Hola "
	tam equ $-men
	
section .bss
	;variables no inicializadas
	;solo se declaran pero no usa espacio de moria
	;hasta sedr utilizadas
	nombre resb 16       ;resb reserva 16 bits
	nomLong equ $-nombre ;equ igual
