;;   AUTHOR: Luis Eduardo Galindo Amaya
;;     DATE: 21-10-2022
;; ASSEMBLE: 
;;     LINK:     
;;      RUN:
    
section .data
    salto db 0xA,0x0
    filepath db "P10.txt",0x0   ;archivo a leer
    testimplenght dd 5          ;tamaño del string a capturar
    
section .bss
    filebuffer resb 255
    testimp resb 10

section .text
global _start

_start:
    call myreadfile             ;leer e imprimir el archivo
 
    mov ecx, testimp            ;capturar un string
    mov edx, [testimplenght]
    call mygets

    mov ecx, testimp            ;imprimir un string
    call myputs

    mov ecx, salto              ;salto de linea
    call myputs
    
    mov eax, 1                  ;terminar programa
    mov ebx, 0
    int 80h

    
;; mygets
;; ======
;; Captura un string en una seccion reservada de memoria.
;;
;; Entradas:
;; - ecx, puntero a el string
;; - edx, tamaño maximo de entrada - 1 (para el terminador)
;;
mygets:
    dec edx
    mov eax, 3                  ;numero de la interrupción
    mov ebx, 0                  ;unidad de entrada
    int 80h
    
    ; ejecutar el servicio 3, eax contiene la cantidad de
    ; caracteres capturados

    cmp eax, edx                ;si el string capturado
    jb .capturaesmenor
    jmp .capturaesmayor

.capturaesmenor:                ;es menor al buffer
    
    dec eax
    mov byte[ecx + eax], 0
    ret
    
.capturaesmayor:                ;es mayor al buffer
    
    add ecx, edx                ;guardar la ultima 
    mov esi, ecx                ;posicion capturada

    ;deja la linea vacia para la siguiente entrada
    
.clearbuffer:                   ;
    
    mov eax, 3                  ;numero de la interrupción
    mov ebx, 0                  ;unidad de entrada
    mov ecx, esi
    mov edx, 1
    int 80h

    cmp byte[ecx], 10           ;si el contenido en ecx es 0
    jnz .clearbuffer            ;termina el contador

    mov byte[esi], 0
    ret
	
    
;; myputs
;; ====
;; Imprime el string en ecx.
;;
;; Entradas:
;; - ecx, puntero a el string
;;
myputs:
    call string_lenght          ;mueve el tamaño del ecx en edx
    mov eax,4
    mov ebx,1
    int 80h
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
    
    inc ecx                     ;inc. la posicion del puntero
    inc edx                     ;inc. el numero de caracteres
    jmp .contloop               ;continua 

.endloop:
    mov ecx, eax
    ret


;; myreadfile
;; ==========
;; Lee el archivo P10.asm
;;
myreadfile:
    mov eax, 5                  ;Obtener el descriptor
    mov ebx, filepath
    mov ecx, 0
    mov edx, 0
    int 80h
    
    mov esi, eax                ;guardar el descriptor 

    mov eax, 3                  ;mueve los primeros 255
    mov ebx, esi                ;del archivo a file_buffer
    mov ecx, filebuffer       
    mov edx, 255
    int 80h

    mov eax, 6                  ;cierra el archivo
    mov ebx, esi
    int 80h 
    
    call myputs                 ;imprime el contenido del 
    ret
