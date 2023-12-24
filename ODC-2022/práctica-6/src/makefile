t1:
	nasm -f elf t1.asm
	ld -m elf_i386 t1.o ./lib/libpc_io.a -o t1

entrada:
	nasm -f elf captura.asm
	ld -m elf_i386 captura.o ./lib/libpc_io.a -o entrada
