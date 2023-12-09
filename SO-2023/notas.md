
# Table of Contents

1.  [Informacion del servidor](#org3a45899)
2.  [Semana 1](#orgc94b7ae)
    1.  [Software](#orgd558df9)
    2.  [Objetivo del sistema](#orgcdc9365)
    3.  [Manejo de archivos](#orgad3c6e9)
    4.  [Manejo de procesos](#orgf645fd3)
3.  [Semana 2](#org279dff2)
    1.  [Manejo de procesos (Obligatorio)](#org210dfc7)
    2.  [Manejo de dispositivos de entrada/salida (Opcional)](#org38d6667)
    3.  [Manejo de Red](#orgda5f813)
    4.  [Manje de seguridad](#org1f6a9e1)
4.  [Semana 3](#org0aaa627)
    1.  [](#orge145916)
    2.  [Convección con servidores](#org3bcfa7f)
5.  [Semana 4](#org13ded28)
    1.  [directorios](#org71a7b20)
    2.  [Comandos](#org7c9d325)
        1.  [passwd](#org5ea355c)
        2.  [ls](#org1e4787a)
        3.  [mkdir](#org60bcb17)
        4.  [mv](#orgd7dac72)
        5.  [cat](#org67e8187)
        6.  [touch](#orgec44b70)
        7.  [rm](#org2c2d1b6)
    3.  [Commodines](#orgf4b2318)
6.  [Semana 5](#org682b493)
    1.  [Tarea](#org2d3f3e1)
        1.  [sistema para investigar](#org354f3ac)
        2.  [TAREA](#orgdf999ca)
    2.  [permisos de archivos y directorios](#orga3616a2)
        1.  [Leer perisos](#org14f38d9)
        2.  [metodo absoluto](#org76ab362)
        3.  [metodo simboico](#orgf348267)
    3.  [Comandos](#org347b679)
        1.  [diferencia cat y more](#org193f551)
        2.  [ps](#org6a0a4db)
        3.  [entubamiento o pipe (|)](#orgc7a4777)
        4.  [redireccionamiento directo (>)](#org96af1a5)
        5.  [wc](#org7397720)
        6.  [head](#orgd210c94)
        7.  [tail](#org6a831b4)
        8.  [sort](#org56323bc)
        9.  [grep](#org941f60f)
        10. [cut](#org9aa340c)
7.  [Semana 6](#org0616197)
    1.  [redireccionamiento de entrada](#orgc921026)
    2.  [shifting](#org6cc336b)
    3.  [tr](#org6f2edde)
        1.  [rangos invalidos](#org3671a1e)
8.  [Semana 7: Procesos](#org53dfccf)


<a id="org3a45899"></a>

# Informacion del servidor

Servidor de encuestas UABC ssh para
las practicas 

---

-   **direccion:** 148.231.130.237
-   **puerto   :** 22
-   **user     :** galindo
-   **pasword  :** soporte123 -> 1274895

---

filtros /home/sist20232/lety/filtros


<a id="orgc94b7ae"></a>

# Semana 1


<a id="orgd558df9"></a>

## Software

-   **de sistema:** sistema operativo de múltiples programas
-   **de aplicaciones:** todo lo que se ejecuta en sistema operativo


<a id="orgcdc9365"></a>

## Objetivo del sistema

-   facilitar el uso
-   maximizar el uso del sistema


<a id="orgad3c6e9"></a>

## Manejo de archivos

Un archivo es una colección de bytes que contienen información relacionada, 
pueden ser imágenes, canciones datos etc. El manejo de archivos permite la 
creación manipulación y borrado de datos archivos y directorios, almacenamiento 
de medios secundarios, elaboración de respaldos, etc.


<a id="orgf645fd3"></a>

## Manejo de procesos

Un proceso es un programa en ejecución, las aplicaciones tienen uno o mas 
procesos asociados que están en ejecución y este componente es un procedimiento 
para administrar los procesos que están corriendo simultáneamente en el sistema 
operativo. Las funciones del manejador procesos  


<a id="org279dff2"></a>

# Semana 2


<a id="org210dfc7"></a>

## Manejo de procesos (Obligatorio)

un proceso es un programa en ejecución, las aplicaciones tienen uno o mas 
procesos asociados cuando están en ejecución y este componente es un 
procedimiento para administrar los procesos que están corriendo simultáneamente
en el sistema operativo. Las funciones de el manejador de procesos son las
siguientes:

-   Crear y eliminar procesos
-   Suspender o continuar procesos
-   Sincronización de procesos y comunicación entre procesos.

<p class="verse">
- daemon :: procesos que corren por el sistema sin intervención del usuario<br />
- proceso zombie :: proceso que no hace nada<br />
</p>


<a id="org38d6667"></a>

## Manejo de dispositivos de entrada/salida (Opcional)

Este componente se encarga de ocultar las variaciones de los dispositivos de 
hardware para facilitar su instalación y uso. Provee acceso a los dispositivos 
mediante el uso de drivers particulares, proporcionan un sistema de caché y 
facilita información sobre las características y estado de un dispositivo 
específico.


<a id="orgda5f813"></a>

## TODO Manejo de Red


<a id="org1f6a9e1"></a>

## Manje de seguridad

Los proceosos en un sistema operativo nececitan protegerse de las actividades 
de otros proceosos, por ejemplo, el manejo de seguridad previene que un proceso
en el espacio de otro, que un proceso no se aprodere del proceso y que se 
mantenga la integridad de los perifericos.

**Soporte de Hardware que necesita el sistema operativo** 

-   Interrupciones
-   Llamadas al sistema
-   Timer
-   Modo bit

w


<a id="org0aaa627"></a>

# Semana 3


<a id="orge145916"></a>

## TODO 


<a id="org3bcfa7f"></a>

## TODO Convección con servidores

-   **http:** 

-   **https:** 

-   **telnet:** 

-   **ssh:** 


<a id="org13ded28"></a>

# Semana 4


<a id="org71a7b20"></a>

## TODO directorios

-   **\\     :** raíz
    -   **\etc:** configuraciones
    -   \var
    -   \users
    -   \dev
    -   \opt


<a id="org7c9d325"></a>

## Comandos


<a id="org5ea355c"></a>

### passwd

cambiar contraseña de usuario 


<a id="org1e4787a"></a>

### ls

listar archivos

-   **-R:** Tree
-   **-F:** mostrar el tipo de archivo
-   **-a:** mostrar archivos ocultos


<a id="org60bcb17"></a>

### mkdir

crear directorio


<a id="orgd7dac72"></a>

### mv

mover archivos y renombrar archivos 


<a id="org67e8187"></a>

### cat

redireccionar texto a un archivo

-   **-n:** numera las lineas del archivo


<a id="orgec44b70"></a>

### touch

crea un archivo vacio 

1.  cambiar la fecha

    touch &#x2013;date "2002-08-30 23:00:00" <nombre del archivo>


<a id="org2c2d1b6"></a>

### rm

eliminar un archivo o directorio

-   **-r:** eliminar directorios de manera recursiva


<a id="orgf4b2318"></a>

## Commodines

-   **\*:** rellena el espacio con cualquier valor
-   **?:** sustituye un caracter en un nombre


<a id="org682b493"></a>

# Semana 5


<a id="org2d3f3e1"></a>

## TODO Tarea


<a id="org354f3ac"></a>

### sistema para investigar

MANDRAKE 


<a id="orgdf999ca"></a>

### TAREA

Investigar

microkernel, monolítico, híbrido

1.  microkernel
2.  monolítico
3.  híbrido

A mano


<a id="orga3616a2"></a>

## permisos de archivos y directorios


<a id="org14f38d9"></a>

### Leer perisos

                  drwx r-x r-x
                   |    |   |
    dueño ---------+    |   |
    grupo --------------+   |
    otros usuarios ---------+


<a id="org76ab362"></a>

### metodo absoluto

    |   dueño   |   grupo   |   otros   |
    |-----------|-----------|-----------|
    | r | w | x | r | w | x | r | w | x |
    | * | * | * | * | - | * | - | - | - |
    |   |   | 7 |   |   | 5 |   |   | 0 |


<a id="orgf348267"></a>

### TODO metodo simboico

<https://www.pluralsight.com/blog/it-ops/linux-file-permissions>


<a id="org347b679"></a>

## Comandos


<a id="org193f551"></a>

### diferencia cat y more

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">cat</th>
<th scope="col" class="org-left">more</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">muestra todo el archivo</td>
<td class="org-left">muestra un porcentaje del archivo</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org6a0a4db"></a>

### ps

-   **-fea:** muestra procesos de cada usario con detalles


<a id="orgc7a4777"></a>

### entubamiento o pipe (|)

-   **cat -n procesos | more:** muestra el contenido del archivo con numeros


<a id="org96af1a5"></a>

### redireccionamiento directo (>)

-   **ps -fea >procesos:** crea el archivo 'procesos' con la informacion de ps


<a id="org7397720"></a>

### wc

Word count, contar palabras

-   **-c:** contar caracteres


<a id="orgd210c94"></a>

### head

obtiene las primeras 10 lineas del archivo


<a id="org6a831b4"></a>

### tail

obtiene las ultimas 10 lineas del archivo


<a id="org56323bc"></a>

### sort

sirve para ordenar el cotenido de un archvo

-   **nada:** ordena por peso  ascii
-   **-f:** ordena sin importar si son mayuculas o minusculas
-   **-r:** lo mismo que nada pero al reves
-   **-M:** toma los primeros 3 valores como el nombre del mes
-   **-n:** los que no tienen numero se mandan al inicio (acendente)
-   **+1:** ordena por columna


<a id="org941f60f"></a>

### grep

global regular expresion and print

-   **grep <string> <archivo>:** buscar el string en el archivo


<a id="org9aa340c"></a>

### cut

cotes verticales, sirve para separ columnas

-   **-f<numero de columna>:** corta el numero de columna
-   **-d"<string delimitador>":** se usa para cambiar el caracter separador


<a id="org0616197"></a>

# Semana 6


<a id="orgc921026"></a>

## TODO redireccionamiento de entrada


<a id="org6cc336b"></a>

## TODO shifting


<a id="org6f2edde"></a>

## tr

-   **tr "a" "A"<[nombre del archivo]        :** remplaza "a" con "A"
-   **tr "[a-z]" "[A-Z]"<[nombre del archivo]:** remplaza el rango de letras "a-z" a "A-Z"
-   **tr "[:digit:]" "w" <[nombre del archivo]:** remplaza cualquier numero con "w"


<a id="org3671a1e"></a>

### rangos invalidos

-   **tr "[a-z]" "[A-P]" <[nombre archivo]:** se reemplaza los valores indefinidos con "["
    
    `tr "[[:alpha:]]" "[[:upper:]]" < nombres_who.txt`


<a id="org53dfccf"></a>

# TODO Semana 7: Procesos

