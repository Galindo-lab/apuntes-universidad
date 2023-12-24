#include <stdio.h>

#include<stdio.h>

int main(int argc, char *argv[]) {

  char a[] = "Hola mundo";


  char caracter_mas_repetido = a[0];  /* ax */
  char repeticiones_max = 0;

  char character;               /* cx */
  char repeticiones;

  char i = 0;                   /* i */
  char j = 0;                   /* j */
  
  while(1){

    character = a[i];
    repeticiones = 0;
    j=0;
    
    while(1) {
      if(a[j] == character) repeticiones++;
      

      j++;
      if(a[j] == 0) break;        
    }

    if(repeticiones_max < repeticiones) {
      repeticiones_max = repeticiones;
      caracter_mas_repetido = character;
    }

    i++;
    if(character == 0) break;            
  }

  putchar(caracter_mas_repetido);
  putchar('\n');
  
  
  return 0;
}
