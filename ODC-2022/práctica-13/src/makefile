create: asmcode ccode
	gcc -m32 P13_ASM.o P13_C.o -o P13.out
	if [ -f P13.out ]; then ./P13.out; fi;
	if [ -f P13.out ]; then rm P13.out; fi;

asmcode:
	nasm -f elf P13_ASM.asm	

ccode:
	gcc -m32 -c P13_C.c



