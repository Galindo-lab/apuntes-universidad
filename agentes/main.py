from board import *


# Definir los nodos de inicio y objetivo para buscar el camino más corto
inicio = (1, 1)
objetivo = (8, 8)

# Tablero de ejemplo con celdas con valor 1 que representan los nodos del grafo
tablero = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0, 0, 0, 0],
    [0, 0, 1, 1, 1, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
]



# Encontrar el camino más corto utilizando BFS
camino_mas_corto = bfs_caminos(tablero, inicio, objetivo)

# Imprimir el resultado del camino más corto
print("Camino más corto:", camino_mas_corto)

x,y = 1, 1

while True:
    ty, tx = 0,0
    
    limpiar_terminal()
    imprimir_tablero(tablero, (x,y))
    
    # mover el pacman
    direccion = input("w,a,s,d: ")
    match direccion:
        case 'w': ty = -1
        case 's': ty = 1
        case 'a': tx = -1
        case 'd': tx = 1
        
    # probar que no halla una pared
    t = tablero[y + ty][x + tx]
    if(t == 1): 
        x += tx
        y += ty
