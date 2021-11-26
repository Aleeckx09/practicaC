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
