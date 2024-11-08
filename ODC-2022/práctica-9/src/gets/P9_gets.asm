;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: nasm -f elf P9_gets.asm	
;;     LINK: ld -m elf_i386 P9_gets.o libpc_io.a -o p9_gets.out
;;      RUN: ./p9_gets.out

%include "./lib/pc_io.inc"
    
section .data
    gets_message db 'Prueba de gets: ', 0xA, 0x0
    getsAlpha_message db 'Prueba de getsAlpha: ', 0xA, 0x0

section .bss
    string_captura_gets resb 255
    string_captura_getAlpha resb 255

section .text
global _start

_start:
    ;-------------------------------------------- Test getsAlpha
    mov edx, getsAlpha_message  
    call puts
    
    mov	ebx, string_captura_getAlpha
    call getsAlpha
    
    mov edx, string_captura_getAlpha 
    call puts                   ;mostrar el valor 

    mov al, 10                  ;salto de linea
    call putchar

    ;------------------------------------------------- Test gets
    mov edx, gets_message       
    call puts
    
    mov ebx, string_captura_gets
    call gets
    
    mov edx, string_captura_gets
    call puts                   ;mostrar el valor capturado

    mov al, 10
    call putchar                ;salto de linea

    ;-------------------------------------------- Test asterisks
    mov cx, 5                  
    call asterisks
    
    ; TERMINAR PROGRAMA
	mov eax, 1
	mov ebx, 0
	int 80h


;; asterisks
;; =========
;; - CX maximo numero de astericos
;;    
;; Imprime un triangulo de asteriscos hasta llegar a el
;; numero que indica CX
asterisks:
    mov dx, 0                   ;numero de lineas inicial
    mov bx, 0                   ;numero de asteriscos inicial
    
.loopLines:                     ;-------------- inicio loopLines
    mov dx, cx                  ;guardar el numero de lineas 
                                ;en el iterador (cx)
    
    inc bx                      ;incrementar el numero de
                                ;asteriscos
    
    mov cx, bx                  ;guardar el numero de asteriscos
                                ;en el iterador
    
.loopAsterisks:                 ;---------- inicio loopAsterisks
    mov al, '*'
    call putchar                ;imprimir un asterisco
    loop .loopAsterisks         ;------------- fin loopAsterisks
    
    mov cx, dx                  ;recargar el numero de lineas en
                                ;el iterador
    mov al, 10                  
    call putchar                ;imprimir un salto de linea
    loop .loopLines             ;------------- fin loopLines
    
    ret	
    

;; getsAlpha
;; =========
;; - EBX direccion del string
;;    
;; Esta funcion captura un string en una direccion de memoria
;; almacenada en EBX. solamente toma caracteres en [A-Z] y [a-z]
;; y el espacio
getsAlpha:
    call getche                 ;capturar un caracter en al
    
    cmp al, 8                   ;si el caracter es backspace
    jz .clear_backspace_alpha
    
    cmp al, 10                  ;si el caracter es return
    jz .end_gets_alpha

    cmp al, ' '                 ;si es espacio
    jz .putchar_ebx_alpha
    
;; alpha_numeric ----------------------------------------------
    mov ah, al                  ;convertir el valor de AH a
    or ah, 32                   ;minuscula

    cmp ah, 'a'                 
    jl .invalid_char
    
    cmp ah, 'z'                 
    jg .invalid_char
;; end alpha_numeric ------------------------------------------
    
    jmp .putchar_ebx_alpha

.invalid_char:                  ;borrar el char si no es valido
    mov al, 8                   ;caracter backspace
    call putchar
    
    mov al, ' '
    call putchar                ;imprimir un espacio
    
    mov al, 8                   ;caracter backspace
    call putchar
    
    jmp getsAlpha

.putchar_ebx_alpha:             ;poner AL caracter en ebx
    mov byte[ebx], al
    inc ebx
    
    jmp getsAlpha

.clear_backspace_alpha:
    call clean_backspace        ;limipiar el backspace
    mov byte[ebx], 0            ;poner un null en el caracter
    
    cmp ebx, 0                  ;revisar si hay mas caracteres
    jz getsAlpha                ;si esta vacia volver a gets
    
    dec ebx                     ;moverse un caracter hacia atras
    jmp getsAlpha
   
.end_gets_alpha:
    mov byte[ebx], 0            ;poner un null al final
    mov al, 0                   ;limpiar el valor de al
    ret    

;; gets
;; ====
;; - EBX direccion del string
;;    
;; Esta funcion captura un string en una direccion de memoria
;; almacenada en EBX.
gets:
    call getche                 ;capturar un caracter en al
    
    cmp al, 8                   ;si el caracter es backspace
    jz .clear_backspace
    
    cmp al, 10                  ;si el caracter es return
    jz .end_gets
    
    jmp .putchar_ebx

.putchar_ebx:                   ;poner AL caracter en ebx
    mov byte[ebx], al
    inc ebx
    jmp gets

.clear_backspace:               
    call clean_backspace        ;limipiar el backspace
    mov byte[ebx], 0            ;poner un null en el catacter
    
    cmp ebx, 0                  ;revisar si hay mas caracteres
    jz gets                     ;si esta vacia volver a gets
    
    dec ebx                     ;moverse un caracter hacia atras
    jmp gets
   
.end_gets:
    mov byte[ebx], 0            ;poner un null
    mov al, 0                   ;reiniciar el valor de al
    ret

;; clean_backspace
;; ===============
;;    
;; Esta función elimina el caracter '^H' al precionar CTRL+h
;; en el teclado (backspace).
;; - CHR_BACKSPACE = 8
;; - CHR_SPACE = 32
clean_backspace:
    mov cx, 3                   ;iterar 3 veces
    
.out:                           ;-------------- inicio bucle
    mov al, ' '
    call putchar                ;imprimir un espacio
    
    mov al, 8                   ;caracter backspace
    call putchar
    call putchar                ;moverse a la derecha 2 veces

    loop .out                   ;------------ terminar bucle

    mov al, ' '                 ;esto no es necesario pero 
    call putchar                ;hace que se vea fancy

    mov al, 8
    call putchar
    ret
