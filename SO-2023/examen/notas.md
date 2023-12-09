
# &Iacute;ndice

1.  [Redireccionamientos](#org5983d95)
    1.  [Redireccionar salida sin concadenar (>)](#orgc94a8f1)
    2.  [Redireccionar salida concadenando (>>)](#orgbf98e9f)
    3.  [Redireccionar entrada (<)](#org6d47cc0)
    4.  [Pasar salida como entrada Piping (|)](#org21dd692)
    5.  [Pasar salida a archivo y terminal (tee)](#org1d04b0e)
    6.  [Repaso de la practica](#org6bce52f)
2.  [Repaso de commando de la unidad](#orge45148a)
    1.  [Ordenar (sort)](#org99956d1)
    2.  [Buscar (grep)](#org1c911ea)
    3.  [Reemplazar (tr)](#orgcfb89aa)
    4.  [Final (tail)](#org0ddd11d)
    5.  [Inicio (cabeza)](#orgd90a63a)
3.  [Variables de Ambiente](#org8ec6eaa)
    1.  [Comandos para variables](#org52ab112)
4.  [Procesos](#orgb9ae728)
    1.  [Diferencia de un proceso con un programa](#org184adce)
    2.  [Tipos de procesos](#org6645cff)
    3.  [Atributos de un proceso](#org9c534ef)
    4.  [Prioridades de los procesos](#org6d9b1b6)
    5.  [Estados de procesos](#org8346898)



<a id="org5983d95"></a>

# Redireccionamientos


<a id="orgc94a8f1"></a>

## Redireccionar salida sin concadenar (>)

Redirecciona la salida a un archivo o dispositivo `>`, creando el archivo
si no existe y sobreescribiéndolo si ya existe.


<a id="orgbf98e9f"></a>

## Redireccionar salida concadenando (>>)

Redirecciona la salida estándar a un archivo o dispositivo `>>`, añadiendo
la salida al final del archivo.


<a id="org6d47cc0"></a>

## Redireccionar entrada (<)

El simbolo `<` (entrada) Redirecciona stdin desde un archivo. El
contenido de un archivo es la entrada o input del comando. 


<a id="org21dd692"></a>

## Pasar salida como entrada Piping (|)

El símbolo `|` (pipe) es un tipo de redireccionamiento ya que la salida
(stdout) de un comando es la entrada (stdin) de otro. Ejemplo:

    grep -v "ORDINARIO" lista2023 | cut -d ':' -f3 

-   **grep -v ’ORDINARIO’ lista2023:** Se busca todos los elementos que **NO**
    tengan ’ORDINARIO’

-   **cut -d’:’ -f3:** Se obtiene la tercera columna


<a id="org1d04b0e"></a>

## Pasar salida a archivo y terminal (tee)

El comando tee redirecciona la salida (stdout) a ambos, un archivo y a
la terminal. Se puede usar para supervisar la salida del comando


<a id="org6bce52f"></a>

## Repaso de la practica

-   **cat -n archivo.txt:** Manda el contenido de un archivo a la terminal
    con las lineas numeradas (-n)

-   **grep "substring" archivo.txt:** Busca el 'substring' en un flujo de
    entrada, en este caso el archivo.txt

-   **grep "RCA Records" billboard > RCA:** Busca el substring 'RCA
    Records' en el archivo billboard y redirige la salida al archivo
    'RCA'.

-   **grep "Warner Records" billboard | tee Warner:** Busca el substring
    'Warner Records' en el archivo billboard, guarda la salida en un
    archivo llamado Warner y al mismo tiempo lo imprime en la terminal.


<a id="orge45148a"></a>

# TODO Repaso de commando de la unidad


<a id="org99956d1"></a>

## Ordenar (sort)

-   **sort -f <archivo>:** Ordena considerando de igual valor mayúsculas y minúsculas.

-   **sort -M <archivo>:** Compara considerando los tres primeros caracteres de la línea como
    el nombre de un mes en inglés.

-   **sort -n <archivo>:** Ordena en forma numérica ascendente.

-   **sort +1 <archivo>:** Ordena por la segunda columna. (+2 por la tercera, etc), considera
    como delimitador el espacio y el tabulador.

-   **sort –r <archivo>:** Invierte el orden.


<a id="org1c911ea"></a>

## Buscar (grep)

-   **grep <cadena> <archivo>:** Muestra la línea(s) donde encuentra la cadena.

-   **grep -n <cadena> <archivo>:** Muestra la línea y el número de línea en donde encuentra la cadena.

-   **grep -c <cadena> <archivo>:** Muestra cuántas líneas contienen el patrón especificado.

-   **grep -v <cadena> <archivo>:** Muestra las líneas que no cumplen con el patrón de búsqueda.

-   **grep -w <cadena> <archivo>:** Muestra las líneas que contienen la cadena como palabra completa.

-   **grep –w <'frase'> <archivo>:** Muestra la línea donde se encuentra la frase completa.

-   **grep -i <cadena><archivo>:** Evita la distinción entre mayúsculas y minúsculas.


<a id="orgcfb89aa"></a>

## TODO Reemplazar (tr)


<a id="org0ddd11d"></a>

## TODO Final (tail)


<a id="orgd90a63a"></a>

## TODO Inicio (cabeza)


<a id="org8ec6eaa"></a>

# TODO Variables de Ambiente


<a id="org52ab112"></a>

## Comandos para variables

-   **crear una variable:** `variable=valor`

-   **asignacion de valores:** `Variable=nuevovalor`

-   **Exportación de variables del shell al ambiente:** `export Variable`

-   **crear variable de ambiente con valor:** `export variable=valor`

-   **Eliminación de variables (shell):** `unset nueva`


<a id="orgb9ae728"></a>

# Procesos


<a id="org184adce"></a>

## Diferencia de un proceso con un programa

Un **Proceso** es una entidad dinámica que consiste de un programa en
ejecución con sus valores actuales, su estado y los recursos
utilizados para su ejecución. 

Un **Programa** es una entidad inactiva y estática, que consta de un
conjunto de instrucciones y datos pero no esta en ejecución


<a id="org6645cff"></a>

## Tipos de procesos


### Del sistema

Son procesos que actuan si que el usuario los solicite. Tambien se les
conoce como deamons. Pueden ser de dos tipos:

-   **Procesos Permanentes o de larga duracion:** se cran al arrancar el
    sistema y permanecen activos hasta que se termina la
    conexion. sufuncion es realizar actividades del sistema.

-   **2. Procesos trancitorios:** nace y mueren cuando el sistema efectua
    tareas propias, independientes de los usuarios.


### Proceos de usuario

Son procesos creados cuando el usuario ejecuta comandos


<a id="org9c534ef"></a>

## Atributos de un proceso

-   **Identificador unico (PID):** Garantiza que el proceso sea unico
    dentro del sistema.
-   **Segmentos:** Código, Datos y Stack
-   **Identificadores:** de usuario y grupo
-   **Identificadeores de otros procesos:** relacionados a este proceso
-   tamaño del proceso
-   datos de su planificacion
-   terminal original


<a id="org6d9b1b6"></a>

## TODO Prioridades de los procesos


<a id="org8346898"></a>

## Estados de procesos

-   **Activo en ejecucion:** EL proceso tiene asignado un tiempo
    de CPU y las intrucciones se estan ejecutando

-   **Activo ejecutable:** El procesos puede ser ejecutado, pero no tiene
    tiempo de ejecucion

-   **Suspendido:** Recibió una señal para detenerse. Cuntinua hasta que
    reciba SIGCONT

-   **Durmiendo:** Se encuentra en espera de un evento, como una entrada
    de teclado, o que otros procesos terminen.

-   **Osioco (idle):** Fue creado pero aun no es ejecutable.

-   **Zombie:** El proceso terminó pero su padre no ha sido notificado.

