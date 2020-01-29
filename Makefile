.PHONY: clean

all: build lib default

lib: libmycomplex.a

default: exe

libmycomplex.a: build/add.o build/sub.o build/mul.o build/div.o
	ar rc libmycomplex.a build/add.o build/sub.o build/mul.o build/div.o

exe: build/main.o build/add.o build/sub.o build/mul.o build/div.o
	gcc -Wall -Werror build/main.o -o exe -L. -l mycomplex

build/add.o: src/add.c src/func.h
	gcc -Wall -Werror -c src/add.c -o build/add.o

build/sub.o: src/sub.c src/func.h
	gcc -Wall -Werror -c src/sub.c -o build/sub.o

build/mul.o: src/mul.c src/func.h
	gcc -Wall -Werror -c src/mul.c -o build/mul.o

build/div.o: src/div.c src/func.h
	gcc -Wall -Werror -c src/div.c -o build/div.o

build/main.o: src/main.c src/func.h
	gcc -Wall -Werror -c src/main.c -o build/main.o


build:
	mkdir build

clean:
	rm -rf build libmycomplex.a exe
