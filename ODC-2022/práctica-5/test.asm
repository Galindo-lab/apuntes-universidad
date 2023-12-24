
;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 22-09-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:      
;;   OUTPUT: 

section .data
    captura_de_caracter db 'captura de caracter', 0xA, 0x0
    

section .text
global _start

_start:
    mov edx, captura_de_caracter ;captura_de_caracter
    call puts

    mov edx, gola               ;gola
    call puts
    
