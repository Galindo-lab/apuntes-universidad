// AUTHOR: Luis Eduardo Galindo Amaya
//   DATE: 25-11-2022

#include <stdio.h>

#define FILAS 4
#define COLUMNAS 3

/**
 * Suma 
 * @param  
 * @return 
 */
extern void sumaMatrices(int A[FILAS][COLUMNAS],
                         int B[FILAS][COLUMNAS],
                         int C[FILAS][COLUMNAS],
                         int filas, int columnas);

/**
 * Inicializa los valores de una matriz en ceros 
 * @param matriz 
 */
void ceros(int[FILAS][COLUMNAS]);

/**
 * Imprime los valores de una matriz
 * @param matriz
 */
void mostrarMatriz(int[FILAS][COLUMNAS]);

int main(int argc, char *argv[]) {

  int C[FILAS][COLUMNAS];
  ceros(C);

  int A[FILAS][COLUMNAS] = {
       {1, 2, 3},
       {4, 5, 6},
       {7, 8, 8},
       {1, 2, 3}
  };

  int B[FILAS][COLUMNAS] = {
       {1, 1, 1},
       {1, 1, 1},
       {1, 1, 1},
       {1, 1, 1}
  };

  sumaMatrices(A,B,C,FILAS,COLUMNAS);
  
  puts("Matriz A:");
  mostrarMatriz(A);

  puts("Matriz B:");
  mostrarMatriz(B);
  
  puts("Matriz C:");
  mostrarMatriz(C);

  return 0;
}

void ceros(int A[FILAS][COLUMNAS]) {
  for (int i = 0; i < FILAS; i++) {
    for (int j = 0; j < COLUMNAS; j++)
      A[i][j] = 0;
  }
}

void mostrarMatriz(int A[FILAS][COLUMNAS]) {
  for (int i = 0; i < FILAS; i++) {
    for (int j = 0; j < COLUMNAS; j++) {
      printf("%d ", A[i][j]);
    }
    printf("\n");
  }
}
