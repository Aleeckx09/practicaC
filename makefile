calc.o: calc.calc
	gcc -c -Wall -g calc.calc -o calc.o

calcula: calcula.calc calc.o
	gcc -Wall -g calcula.c calc.o -o calcula

.PHONY: clean
clean:
	rm -f *.o calcula