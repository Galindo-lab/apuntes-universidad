;; AUTHOR: Luis Eduardo Galindo Amaya
;;   DATE: 25-11-2022
   
section .data

section .bss

section .text
global sumaMatrices:

sumaMatrices:
    ;guardar el stack pointer y el stack frame    
    push ebp
    mov ebp, esp

    ;guardar los valores de los punteros de memoria
	push ebx
	push edi
	push esi

    ;variables respecto EBP
    ;  +8:  a        
    ; +12:  b        
    ; +16:  c        
    ; +20:  Filas    
    ; +24:  Columnas 

    mov eax, [ebp+24]           ;columnas      jmp
    mov ecx, [ebp+20]           ;filas

    ;calcular el numero de elemntos en la matriz
    
    mul ecx                     ;EDX:EAX = EAX*ECX
    mov edx, eax                ;edx = bits menos significativos

    mov ecx, edx
    mov esi, [ebp+16]           ;matriz c
    
    mov eax, [ebp+8]            ;matriz a    
    mov edi, 0                  ;iterador

.sumar_A:                       ;-------------------------------
    mov ebx, [eax+edi*4]
    add [esi+edi*4], ebx
    inc edi
    loop .sumar_A

    mov ecx, edx                ;reinicia el loop 
    mov eax, [ebp+12]           ;matriz b
    mov edi, 0                  ;iterador
    
.sumar_B:                       ;-------------------------------
    mov ebx, [eax+edi*4]
    add [esi+edi*4], ebx
    inc edi
    loop .sumar_B

    ;restaurar los valores de los registros
    pop ESI
	pop EDI
	pop EBX

    ;restaurar el stack pointer y el stack frame
	mov esp, ebp
	pop ebp
	ret

    
