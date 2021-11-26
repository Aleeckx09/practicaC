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


