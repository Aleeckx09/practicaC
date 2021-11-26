# Ejercicios C
## Ejercicio 1
1. Crearemos el primer fichero en c y le pondremos como nombre "hola.c".
2. Dentro del archivo incluiremos lo que pone en la captura.
~~~
#include <stdio.h>

int main()
{
	printf("Hola món\n");
	return 0;
}
~~~
4. Compilaremos el archivo con gcc y con -o para cambiar el nombre del archivo para ejecutarlo.
5. Lo ejecutaremos con ./"nombre del archivo"

## Ejercicio 2
1. Crearemos el archivo calc.c
2. Escribiremos lo que pone en la captura ex2.2 que contendrá las funciones
~~~
#include <stdio.h>


int suma(int a, int b) {
	return a + b;
}

int resta(int a, int b) {
    return a - b;
}
int multiplicacion(int a, int b) {
    return a * b;
}

int division(int a, int b) {
    return a / b;
}


int mayor(int a, int b) {
	if (a>b){
		return a;
	}
	else {
		return b;
	}
}

~~~
3. Luego creamos otro archivo con el nombre calcula.c y escribimos lo que sale en la imagen. 
~~~
#include <stdio.h>
#include "calc.h"
int main() {
    int a, b;
    printf("Introduce 2 numeros: \n");
    scanf("%d %d", &a, &b);
    printf("La suma entre %d y %d vale %d \n", a,b,suma(a,b));
    printf("La resta entre %d y %d vale %d \n", a,b,resta(a,b));
    printf("La multiplicacion entre %d y %d vale %d \n", a,b,multiplicacion(a,b));
    printf("La division entre %d y %d vale %d \n", a,b,division(a,b));
    printf("El mayor entre %d y %d es %d \n", a,b,mayor(a,b));
} 
~~~
4. También crearemos un archivo llamado calc.h que será una libreria que será utilizada por otros programas.
~~~
#ifndef CALCULA
#define CALCULA
int suma(int a, int b);
int resta(int a, int b);
int multiplicacion(int a, int b);
int division(int a, int b);
int mayor(int a, int b);
#endif

~~~
5. Compilaremos el archivo calc.c y lo llamaremos calc.o
~~~
gcc calc.c -o calc.o
~~~

6. Compilaremos los archivos calc.o y calcula.c y lo llamaremos calcula
7. Luego de esto podremos ejecutar el programa y como vemos en las imagenes funciona
## Ejercicio 3
1. Este será el archivo makefile
~~~
calc.o: calc.calc
	gcc -c -Wall -g calc.calc -o calc.o

calcula: calcula.calc calc.o
	gcc -Wall -g calcula.c calc.o -o calcula

.PHONY: clean
clean:
	rm -f *.o calcula
  
.PHONY: dist
dist: clean calcula
  rm -rf ../dist;
  mkdir -p ../dist/usr/bin/calc
  cp calcula ../dist/usr/bin/calc

.PHONY: targz
targz: clean
  mkdir -p source
  cp *.c *.h Makefile source
  tar -cvf calcula.tar source
  gzip calcula.tar
  rm -rf calcula.tar
  rm -rf source
~~~
