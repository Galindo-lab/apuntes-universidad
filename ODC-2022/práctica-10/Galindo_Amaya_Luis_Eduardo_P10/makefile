
FILE = P10
INCLUDES = ./lib/libpc_io.a

create:
	nasm -f elf ${FILE}.asm	
	ld -m elf_i386 ${FILE}.o ${INCLUDES} -o ${FILE}.out

clean:
	rm ${FILE}.out
	rm ${FILE}.o

test:
	./${FILE}.out

