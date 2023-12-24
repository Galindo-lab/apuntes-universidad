;;
;;AUTHOR:   Luis Eduardo Galindo Amaya
;;DATE:     23-09-2022
;;ASSEMBLE: nasm -f elf t1.asm
;;LINK:     ld -m elf_i386 t1.o ./lib/libpc_io.a -o entrada 
;;RUN:      ./entrada
;;
    
%include "./lib/pc_io.inc"
    
section .data
    ingrese_una_cadena  db 'ingrese una cadena', 0xA, 0x0
    ingrese_un_caracter db 'ingrese un caracter', 0xA, 0x0
    salto_de_linea      db 0xa, 0x0
    asterisco           db '*'
    arroba              db '@'

section .bss
    ;A) RESERVAR DOS ESPACIOS EN MEMORIA NO INICIALIZADOS, UNO
    ;   DE 32 BYTES ETIQUETADO COMO A Y EL OTRO DE 1 BYTE
    ;   ETIQUETADO COMO N.
    
    A resb 32                   ;variable de 32 bytes
    N resb 1                    ;variable de 1 byte
    
section .text
global _start

_start:
    mov edx, ingrese_una_cadena ;ingrese_una_cadena
    call puts

    ;B) SOLICITAR UNA CADENA QUE SE ALMACENE EN A.
    
    mov ebx, A                  ;mover 'A' al registro de
                                ;direccion
    
capturar:
    call getche                 ;capturar el caracter em 'al'
    mov byte [ebx], al          ;mover el contenido a AL
    inc ebx                     ;incrementar la posiscion de EBX
    cmp al,10
    jne capturar                ;saltar cuando es diferente a 0
    mov byte [ebx], 0

    mov edx, A                  ;mostrar el string 
    call puts

    ;C) COPIAR EL CARACTER EN LA POSICIÓN 0 DE A EN LA VARIABLE
    ;   N. USE UN MODO DE DIRECCIONAMIENTO BASE.

    mov bl, [A]
    mov byte[N], bl

    mov edx, N                  ;mostrar el valor de 'N'
    call puts

    mov edx, salto_de_linea
    call puts    

    ;D) REEMPLAZAR EL CARACTER EN LA POSICIÓN 3 DE A POR UN
    ;   ASTERISCO, USANDO UN MODO DE DIRECCIONAMIENTO BASE
    ;   CON DESPLAZAMIENTO.

    mov eax, A                  
    mov bl, [asterisco]
    mov byte[eax+3], bl

    mov edx, A                  ;mostrar A
    call puts

    ;E) REEMPLAZAR EL CARACTER EN LA POSICIÓN 6 DE A POR UN
    ;   ARROBA @ USANDO UN DIRECCIONAMIENTO BASE CON ÍNDICE
    ;   ESCALADO.

    mov esi, 3
    mov bl, [arroba]
    mov byte[A+esi*2], bl

    mov edx, A                  ;muestra A
    call puts
    
    ;F) COPIAR EL CARACTER EN LA POSICIÓN 1 DE A Y ALMACENARLO
    ;   EN LOS BITS 15-8 DEL ACUMULADOR.

    mov bl, byte[A+1]
    mov ah, bl
    
    ;G) REEMPLAZAR EL CARACTER EN LA POSICIÓN 9 DE A POR EL
    ;   CARACTER EN LOS BITS 15-8 DEL ACUMULADOR, USANDO UN
    ;   DIRECCIONAMIENTO BASE CON ÍNDICE ESCALADO Y
    ;   DESPLAZAMIENTO.

    mov esi, 2
    mov byte[A+1+esi*4], ah

    mov edx, A                  ;muestra A
    call puts
    
    ;H) SOLICITE UN CARACTER AL USUARIO Y GUÁRDELO EN LA
    ;   POSICIÓN 5 DE A. 

    mov edx, ingrese_un_caracter 
    call puts
    
    call getche                 ;captura caracter
    push eax

    mov [N], eax                ;eliminar el terminador
    mov bl, [N]
    
    mov byte[A+5], bl

    mov edx, A                  ;muestra A
    call puts
    
    ;TERMINAR PROGRAMA
    
    mov eax, 1
    mov ebx, 0
    int 80h



