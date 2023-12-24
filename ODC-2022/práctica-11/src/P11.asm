;; AUTHOR: Luis Eduardo Galindo Amaya
;; DATE: 21-10-2022
;; ASSEMBLE:
;; LINK:
;;

%include "./lib/pc_io.inc"

;; Imprime %1 ". " al inicio de un string
%macro INDEX 1
    mov    al, ' '
    call   putchar
    mov    al, %1
    call   putchar
    mov    al, '.'
    call   putchar
    mov    al, ' '
    call   putchar
%endmacro

;; imprime el menu
%macro PRINT_MENU 4
    mov    edx, %1
    call   puts
    INDEX '1'
    mov    edx, %2
    call   puts
    INDEX '2'
    mov    edx, %3
    call   puts
    INDEX '0'
    mov    edx, %4
    call   puts
%endmacro

section  .data
    MENU db "MENU",10,0
    SALIR db "SALIR", 10, 0
    REGRESAR db "REGRESAR", 10, 0
    
    OPERACIONES_ARIMETICAS db "OPERACIONES ARIMETICAS",10,0
    SUMA db "SUMA", 10, 0
    RESTA db "RESTA", 10, 0

    OPERACIONES_BINARIAS db "OPERACIONES BINARIAS",10,0
    SAND db "AND", 10, 0
    SOR db "OR", 10, 0

section .bss

section .text
global  _start

_start:
    PRINT_MENU MENU, OPERACIONES_ARIMETICAS, OPERACIONES_BINARIAS, SALIR

    call getch                  ;captura en eax
    
    cmp eax, '0'
    je terminar_programa
    cmp eax, '1'
    je menu_operaciones_arimeticas
    cmp eax, '2'
    je menu_operaciones_binarias

    jmp _start

    
menu_operaciones_arimeticas:
    PRINT_MENU OPERACIONES_ARIMETICAS, SUMA, RESTA, REGRESAR
    
    call getch
    
    cmp eax, '1'                ;case 1
    je .ar_case_1
    cmp eax, '2'                ;case 2
    je .ar_case_2
    cmp eax, '0'                ;case 0
    je _start

    jmp menu_operaciones_arimeticas ;default

.ar_case_1:
    mov edx, SUMA
    call puts
    jmp menu_operaciones_arimeticas

.ar_case_2:
    mov edx, RESTA
    call puts
    jmp menu_operaciones_arimeticas

    
menu_operaciones_binarias:
    PRINT_MENU OPERACIONES_BINARIAS, SAND, SOR, REGRESAR
    
    call getch
    
    cmp eax, '1'                ;case 1
    je .bi_case_1
    cmp eax, '2'                ;case 2
    je .bi_case_2
    cmp eax, '0'                ;case 0
    je _start

    jmp menu_operaciones_binarias ;default

.bi_case_1:                     
    mov edx, SAND
    call puts
    jmp menu_operaciones_binarias

.bi_case_2:                     
    mov edx, SOR
    call puts
    jmp menu_operaciones_binarias
    

    
terminar_programa:
    ;   TERMINAR PROGRAMA
    mov eax, 1
    mov ebx, 0
    int 80h
