
%include "./pc_io.inc"

section .text       
global _start               
    
_start:                         ; TELL LINKER ENTRY POINT 
    mov edx, msg
    call puts
    
    mov eax, 1                  ; SYSTEM CALL NUMBER (SYS_EXIT)
    int 0x80                    ; CALL KERNEL

section .data
    ;; OUR DEAR STRING    
    msg db 'Hello, world!', 0xA, 0x0



