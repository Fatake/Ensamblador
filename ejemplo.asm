global _start

section .text

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, men
    mov rdx, 10
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
    men: db "Hola mundo",10

;yasm -f elf64 ejemplo.asm
;ld nombre -o nombre.exe
;crear un make file con las instrucciones
;lanzar make
