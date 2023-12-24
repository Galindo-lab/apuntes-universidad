%include "./pc_io.inc"

section .data   ;Datos inicializados


section .bss    ;Datos no inicializados
    hex_string   resb  8

section .text
    global _start:

_start:
    mov eax, 0x00bbccdd
    mov esi, hex_string
    call print_hex

    mov eax, 1
    mov ebx, 0
    int 80h

print_hex:
    pushad  ;Meter a la pila todos los registros de proposito general
    mov cl, 28  ;CL sera el registro para desplazar
.next:
    mov ebx, eax    ;Utilizamos EBX para almacenar el dato original
    shr ebx, cl     ;Desplazamos EBX a la derecha para colocar en los 4 bits mas a la derecha, los bits a analizar
    and ebx, 0xf    ;Utilizamos una AND y una mascara para determinar el estado de los 4 bits menos significativos
    cmp bl, 9       ;Comparamos si el resultado es 9 o menos
    jbe .menor
    add bl, 7       ;Si el resultado es 10 o mas se representa con 'A-F'

.menor:
    add bl, '0'     ;Convertir al valor de los caracteres ASCII
    mov byte [esi], bl
    inc esi         ;Almacenar caracter en [esi] e incrementar ESI
    sub cl, 4       ;Actualizar numero de bits a desplazar
    cmp cl, 0       ;Comprobar si se deben seguir convirtiendo datos o no
    jl .print
    jmp .next
.print:
    mov edx, hex_string
    call puts

    popad
    ret




