;;
;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 13-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
;;

%include "./pc_io.inc"
    
section .data
    salto_de_linea db 0xa, 0x0

section .bss
    hex_string resb 11
    
section .text
global _start

_start:
    mov ebx, 1100_1111_0011_1010b
    mov eax, ebx
    mov esi, hex_string         ;1100'1111'0011'1010
    call print_hex              ;valor sin cambios

    shl ebx, 2
    mov eax, ebx
    mov esi, hex_string         ;0011'0011'1100'1110'1000
    call print_hex              ;dos a la izquierda

    rcr ebx, 3
    mov eax, ebx
    mov esi, hex_string         ;0110'0111'1001'1101
    call print_hex              ;rotar con la bandera de acarreo

    xor ebx, 0100_0001_0000_0100b
    mov eax, ebx
    mov esi, hex_string         ;0010'0110'1001'1001
    call print_hex              ;Invertir bits 2,8,14

    or ebx, 0000_0001_1000_0001b
    mov eax, ebx
    mov esi, hex_string         ;0010'0111'1001'1001
    call print_hex              ;Activar 0,7,10

    and ebx, 0111_1110_1110_1111b
    mov eax, ebx
    mov esi, hex_string         ;0010'0110'1000'1001
    call print_hex              ;Desactivar 4,9,15
    
    ;TERMINAR PROGRAMA
	mov eax, 1
	mov ebx, 0
	int 80h


; ----------------------------------------------------------------

print_hex:
    ;Imprime el valor hexadecimal en de eax
    
    pushad                      ;Meter a la pila todos los
                                ;registros de proposito general
    
    mov cl, 28                  ;CL sera el registro para
                                ;desplazar
    
.next:
    mov ebx, eax                ;Utilizamos EBX para almacenar
                                ;el dato original
    
    shr ebx, cl                 ;Desplazamos EBX a la derecha
                                ;para colocar en los 4 bits
                                ;mas a la derecha, los bits a
                                ;analizar 
    
    and ebx, 0xf                ;Utilizamos una AND y una
                                ;mascara para determinar el
                                ;estado de los 4 bits menos
                                ;significativos
    
    cmp bl, 9                   ;Comparamos si el resultado es 9
                                ;o menos
    jbe .menor
    add bl, 7                   ;Si el resultado es 10 o mas
                                ;se representa con 'A-F'     
    
.menor:
    add bl, '0'                 ;Convertir al valor de los
                                ;caracteres ASCII
    mov byte [esi], bl
    inc esi                     ;Almacenar caracter en [esi] e
                                ;incrementar ESI
    
    sub cl,4                    ;Actualizar numero de bits
                                ;a desplazar
    
    cmp cl, 0                   ;Comprobar si se deben seguir
                                ;convirtiendo datos o no     
    jl .print
    jmp .next
    
.print:
    mov edx, hex_string         ;string con la representacion
                                ;hexadecimal
    call puts

    mov edx, salto_de_linea     ;salto de linea
    call puts    
    
    popad                       ;recarga los datos en la pila en
                                ;los registros de uso general
    ret 
