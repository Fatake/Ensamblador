ejemplo.exe: ejemplo.o
			 ld ejemplo.o -o ejemplo.exe

ejemplo.o: ejemplo.asm
		   nasm -f elf64 ejemplo.asm -o ejemplo.o
