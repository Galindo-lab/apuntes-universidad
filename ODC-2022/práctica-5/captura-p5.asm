
%include "./pc_io.inc"
    
section .text
global _start
    
_start:
    mov edx, msg0
    call puts
    
    call getch                  ; CAPTURA CARACTER
    push eax
    call putchar                ; MUESTRA CARACTER
    mov edx, msg1
    call puts
    
    mov eax, 1                  ; TERMINAR PROGRAMA
    int 0x80                    
    
section .data
    CAPTURA_CARACTER db 'Captura caracter', 0xA, 0x0
    TERMINAR_CADENA  db 0xA, 0x0           


