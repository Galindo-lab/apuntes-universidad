;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
    
section .data
    testmsg db "test aaaaaaaa",0xa, 0x0
    a db "P19.txt",0x0
    
section .bss
    descriptor resb 4 
    buffer resb 255
    
    testimp resb 10
    testimplenght resb 10

section .text
global _start

_start:

    call myreadfile2

    ; mov ecx, testmsg
    ; call myputs
 
    ; mov ecx, testimp
    ; mov edx, testimplenght
    ; call mygets

    ; call myputs
    
	mov	eax, 1                  ;terminar programa
	mov ebx, 0
	int 80h


myreadfile2:
    pushad	
	mov	eax, 5
	mov	ebx, a
	mov	ecx, 0
	mov	edx, 0
	int	80h

    mov esi,eax

    mov eax, 3
    mov ebx, esi       ;your file descriptor
    mov ecx, buffer             ;read to buffer
    mov edx, 255
    int 80h

    mov ecx,buffer
    call myputs


    mov eax,6 
    mov ebx,esi
    int 80h 
    
    popad    
    ret

    

    
myreadfile:
    pushad	
	mov	eax, 5
	mov	ebx, a
	mov	ecx, 0
	mov	edx, 0
	int	80h

    mov [descriptor],eax

    mov eax, 3
    mov ebx, [descriptor]       ;your file descriptor
    mov ecx, buffer             ;read to buffer
    mov edx, 255
    int 80h

    mov ecx,buffer
    call myputs


    mov eax,6 
    mov ebx,[descriptor] 
    int 80h 
    
    popad    
    ret
    

    
;; mygets
;; ======
;; captura un string en una seccion reservada de memoria
;;
;; Entradas:
;; - ecx, puntero a el string
;; - edx, tamaño maximo de entrada
;;
mygets:
    mov eax, 3                  ;numero de la interrupción
    mov ebx, 0                  ;unidad de salida
	int 80h    
    ret
    
;; myputs
;; ====
;; Imprime el string en ecx
;;
;; Entradas:
;; - ecx, puntero a el string
;;
myputs:
    pushad
    call string_lenght          ;mueve el tamaño del ecx en edx
    mov eax, 4
    mov ebx, 1
	int 80h
    popad
    ret


;; string_lenght
;; =============
;; Cuenta el numero de caracteres hasta el terminado de cadena
;; y lo almacena en edx.
;; 
;; NOTE:
;; si el string no tiene terminador esto se queda en un bucle
;; infinito.
;;
;; Entradas:
;; - ecx, puntero a el string
;;
;; Salidas:
;; - edx, numero de caracteres
;;
string_lenght:
    mov edx, 0
    mov eax, ecx
    
.contloop:
    cmp byte[ecx], 0            ;si el contenido en ecx es 0
    jz .endloop                 ;termina el contador
    
    inc ecx                     ;incrementa la posicion del puntero
    inc edx                     ;incrementa el numero de caracteres
    jmp .contloop               ;continua 

.endloop:
    mov ecx, eax
    ret
