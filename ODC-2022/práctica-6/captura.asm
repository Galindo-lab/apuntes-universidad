;;
;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 27-09-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
;;

%include "./lib/pc_io.inc"
    
section .data
    ingrese_una_cadena db 'Nombre? ', 0x0
    saludo  db 'Hola ', 0x0

section .bss
    NOMBRE resb 255             ;para el nombre del usuario

section .text
global _start

_start:
    mov	edx, ingrese_una_cadena ;ingrese_una_cadena
    call puts
    
    mov ebx, NOMBRE             ;mover al registro de
                                ;direccion
    
capturar:
    call getche                 ;capturar el caracter em 'al'
    mov byte [ebx], al          ;mover el contenido a AL
    inc ebx                     ;incrementar la posiscion de EBX
    cmp al,10
    jne capturar                ;saltar cuando es diferente a 0
    mov byte [ebx], 0

    mov edx, saludo             ;mostrar "hola "
    call puts

    mov edx, NOMBRE             ;NOMBRE
    call puts

    
    ; TERMINAR PROGRAMA
	mov eax, 1
	mov ebx, 0
	int 80h
