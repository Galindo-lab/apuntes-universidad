;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
    
section .data
    msg db "TENTEMPIÉ!",0xA,0x0
    
section .bss
section .text
global _start

_start:
    mov ecx, msg                ;imprimir un string
    call puts
    
    mov eax, 1                  ;terminar programa
    mov ebx, 0
    int 80h
    
;; myputs
;; ====
;; Imprime el string en ecx.
;;
;; Entradas:
;; - ecx, puntero a el string
;;
puts:
    mov edx, 0
    mov eax, ecx
    
.loop:
    cmp byte[ecx], 0            ;si el contenido en ecx es 0
    jz .end                     ;termina el contador
    
    inc ecx                     ;inc. la posicion del puntero
    inc edx                     ;inc. el numero de caracteres
    jmp .loop                   ;continua 

.end:
    mov ecx, eax
    mov eax,4
    mov ebx,1
    int 80h
    ret
    

