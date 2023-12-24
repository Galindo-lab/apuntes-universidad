;;
;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 07-10-2022
;; ASSEMBLE: nasm -f elf print_hex.asm
;;     LINK: ld -m elf_i386 P7.o print_hex.o libpc_io.a -o p7
;;      RUN: ./p7
;;

%include "./pc_io.inc"
    
section .data                   ;datos inicialiazdos
    salto_de_linea db 0xa, 0x0

section .bss                    ;datos no inicializados
    hex_string resb 255
    n resb 4                   
    n_foo resb 4
    dividendo resb 4
    cociente resb 4
    residuo resb 4

section .text
    global _start:              

_start:
    ;A) COLOQUE EN EBX EL VALOR 0X5C4B2A60. SUME SU MATRÍCULA
    ;   COMO VALOR HEXADECIMAL. SI SU MATRÍCULA ES 12345678
    ;   EXPRESARLA COMO 0X12345678. ALMACENE EL RESULTADO EN EBX

    mov ebx, 0X5C4B2A60
    add ebx, 0x1274895

    mov eax, ebx
    mov esi, hex_string
    call print_hex              ;Salida: 0x5D7272F5

    ;B) COLOQUE LOS 16 BITS MENOS SIGNIFICATIVOS DE EBX EN LA
    ;   PILA. 

    push bx
    pop ebx

    mov eax, ebx
    mov esi, hex_string
    call print_hex

    ;C) DEFINA UNA VARIABLE N DE 2 BYTES DE LONGITUD. EN
    ;   ELLA, GUARDE EL RESULTADO DE LA MULTIPLICACIÓN DE BL
    ;   POR 8, SIN CONSIDERAR LOS SIGNOS.

    mov al, 8
    mul bl
    mov [n], ax
    mov ebx, [n]
    
    mov eax, ebx
    mov esi, hex_string
    call print_hex              ;Salida: 0x000007A8

    ;D) INCREMENTAR EN 1 EL VALOR GUARDADO EN N.

    inc word[n]
    mov eax, [n]
    
    mov esi, hex_string
    call print_hex              ;Salida: 0x000007A9

    ;E) DIVIDA EL VALOR ALMACENADO EN BX ENTRE 0XFF. IMPRIMA
    ;   TANTO EL COCIENTE COMO EL RESIDUO DE LA OPERACIÓN.

    mov [dividendo], bx         ;el ultimo valor es n antes del
                                ;incremento del inciso D
    
    mov eax, [dividendo]
    mov esi, hex_string
    call print_hex              ;Salida: 0x000007A8
    
    mov ax, [dividendo]
    
    mov bl, 0x00ff              ;division
    div bl
    
    mov [cociente], al
    mov [residuo], ah

    mov eax, [cociente]         ;      Salida
    mov esi, hex_string        
    call print_hex              ;esperada: 0x00000007
                                
    mov eax, [residuo]
    mov esi, hex_string         
    call print_hex              ;Salida: 0x000000AF

    ;F) REALICE LA SUMA ENTRE EL VALOR ALMACENADO EN N Y EL
    ;   RESIDUO DE LA DIVISIÓN ANTERIOR. GUARDE EL VALOR EN N Y
    ;   DECREMENTE N.
    
    mov ax, [n]                 ;valor previo de n antes de
    mov [n_foo], ax             ;cualquier operacion

    mov eax, [n_foo]            
    mov esi, hex_string        
    call print_hex              ;salida: 0x000007A9
    
    mov bx, [residuo]           ;suma del resiudo anterior
    add ax, bx                  ;el valor del residuo es: 0xAF
    mov [n], ax                 ;0x000007A9 + 0xAF = 0x00000858

    mov eax, [n]                
    mov esi, hex_string         
    call print_hex              ;obtenido: 0x00000858

    sub ax, [n_foo]             ;0x00000858 - 0x000007A9 = 0xAF
    mov [n], ax
    
    mov eax, [n]
    mov esi, hex_string        
    call print_hex              ;obtenido: 0x000000AF

    ;REALICE LAS OPERACIONES NECESARIAS PARA IMPRIMIR EL
    ;REGISTRO DE BANDERAS Y EXPLIQUE QUE BANDERAS ESTÁN ACTIVAS
    ;Y PORQUE.
    
    pushfd                      ;guarda las banderas en el stack
    pop ebx                     ;saca las banderas del stack

    mov eax, ebx
    mov esi, hex_string         
    call print_hex              ;obtenido: 0x00000246

    ;                         ODIT SZ   AP C
    ;0000 0000 0000 0000 0000 0010 0100 0110
    ;
    ;C: No hay acarreo
    ;P: AF es un numero impar
    ;A: No hay acarreo auxiliar
    ;Z: No es cero
    ;S: Es positivo
    ;T: ?
    ;I: Las interrupciones estan habilitadas
    ;D: No es una direccion
    ;O: No hay sobreflujo
    
    ;G) SAQUE UN DATO DE 16 BITS DE LA PILA.

    pop eax                     ;guarda las banderas en el stack

    mov esi, hex_string         
    call print_hex              ;obtenido: 0xF9180000
    
    
    mov eax, 1                  ;TERMINAR PROGRAMA
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
