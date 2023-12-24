;;
;;   Author: Luis Eduardo Galindo Amaya
;;     DATE: 14-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
;;

%include "./pc_io.inc"

section .data                   ;datos inicialiazdos
    salto_de_linea db 0xa, 0x0

section .bss                    ;datos no inicializados
    hex_string resb 10
    eax_inciso_a resb 4
    ecx_inciso_b resb 4
    esi_inciso_c resb 4

section .text
global _start

_start:
    ; A. COLOQUE EN EAX EL VALOR 0X22446688 Y POR MEDIO DE
    ;    ROTACIONES OBTENER 0X82244668.

    mov eax, 0x22446688
    ror eax, 4

    mov [eax_inciso_a], eax     ;lo ocuparemos en el inciso H
    
    mov esi, hex_string
    call print_hex              ;salida: 82244668
    
    ; B. COLOQUE EN CX EL VALOR 0X3F48 Y POR MEDIO DE 
    ;    CORRIMIENTOS OBTENER 0XFA40.

    mov cx, 0x3F48
    shl cx, 3

    mov [ecx_inciso_b], ecx     ;lo ocuparemos en el inciso I
    
    mov eax, 0                  
    mov ax, cx                  
    mov esi, hex_string         ; 0x3F48: 0011'1111'0100'1000 
    call print_hex              ; 0xFA40: 1111'1010'0100'0000
    
    ; C. COLOCAR EN EL REGISTRO ESI EL VALOR 0X20D685F3 Y
    ;    POR MEDIO DE ENMASCARAMIENTO INVERTIR LOS BITS
    ;    0, 5, 13, 18 Y 30, SIN MODIFICAR LOS DEMÁS.

    mov esi, 0x20D685F3
    xor esi, 0x40042021

    mov [esi_inciso_c], esi     ;lo ocuparemos en el inciso D

    ; 0x20D685F3: 00100000110101101000010111110011b
    ; 0x40042021: 01000000000001000010000000100001b
    ; ---------------------------------------------
    ; 0x60D2A5D2: 01100000110100101010010111010010b
    
    mov eax, [esi_inciso_c]
    mov esi, hex_string
    call print_hex
    
    ; D. GUARDAR ESI EN LA PILA

    mov esi, [esi_inciso_c]
    push esi
    
    ; E. COLOCAR EN EL REGISTRO CH EL VALOR 0XA7 Y POR MEDIO
    ;    DE ENMASCARAMIENTO ACTIVAR LOS BITS 3 Y 6, SIN 
    ;    MODIFICAR LOS DEMÁS.

    mov ch, 0xA7
    or ch, 0x48

    mov eax, 0                  ; 0xA7: 10100111
    mov al, ch                  ; 0x48: 01001000
    mov esi, hex_string         ; --------------
    call print_hex              ; 0xEF: 11101111
    
    ; F. COLOCAR EN EL REGISTRO BP EL VALOR 0X67DA Y POR
    ;    MEDIO DE ENMASCARAMIENTO DESACTIVAR LOS BITS
    ;    1, 4, 6, 10 Y 14, SIN MODIFICAR LOS DEMÁS

    mov bp, 0x67DA
    and bp, 0xBBAD

    mov eax, 0                  ; 0x67DA: 0110011111011010 
    mov ax, bp                  ; 0xBBAD: 1011101110101101
    mov esi, hex_string         ; ------------------------
    call print_hex              ; 0x2388: 0010001110001000
    
    ; G. DIVIDIR BP ENTRE 8 USANDO OPERACIONES DE
    ;    MANIPULACIÓN DE BITS.

    shr bp, 3

    mov eax, 0                  ; 0x2388 / 0x8:    0x471
    mov ax, bp                  ; ----------------------
    mov esi, hex_string         ; 0x2388: 10001110001000 
    call print_hex              ;  0x471:    10001110001
    
    ; H. DIVIDIR EAX ENTRE 32 USANDO OPERACIONES DE
    ;    MANIPULACIÓN DE BITS.

    mov eax, [eax_inciso_a]
    shr eax, 5

    ; 0x82244668: 10000010001001000100011001101000
    ;       0x20: 100000
    ; --------------------------------------------
    ; 0x4112233: 100000100010010001000110011
    
    mov esi, hex_string
    call print_hex
    
    ; I. MULTIPLICAR CX POR 8 USANDO OPERACIONES DE
    ;    MANIPULACIÓN DE BITS.

    mov ecx, [ecx_inciso_b]
    shl ecx, 3

    mov eax, ecx
    mov esi, hex_string         ;  0xFA40: 1111101001000000
    call print_hex              ; 0x7D200: 01111101001000000000
    
    ; J. SACAR UN VALOR DE LA PILA Y GUARDARLO EN ESI.

    pop esi

    mov eax, esi
    mov esi, hex_string         
    call print_hex              ; 0x60D2A5D2

    mov esi, eax                ; restaurar el valor 

    
    ; K. MULTIPLICAR ESI POR 10 USANDO OPERACIONES DE
    ;    MANIPULACIÓN DE BITS.

    mov eax, esi
    mov ebx, eax
    
    shl eax, 3                  ; 2^3 = 8
    mov ecx, eax
    mov eax, ebx
    shl eax, 1                  ; 2^1 = 2

    or eax, ecx                 ; eax * 2^3 + eax * 2^1

    
    ;  0x60D2A5D2: 100000110100101010010111010010
    ; 0x306952E90: 001100000110100101010010111010010000
    ; -------------------------------------------------
    ; 0x3C83A7A34: 001111001000001110100111101000110100
    
    
    mov esi, hex_string         
    call print_hex

    
    ; TERMINAR PROGRAMA
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

