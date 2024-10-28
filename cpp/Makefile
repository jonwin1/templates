CC=g++
CFLAGS=-std=c++20 -Wall -Werror -Wextra -Wpedantic
RELEASEFLAGS=-O2 -march=native
DEBUGFLAGS=-g

all: main

main: main.cpp
	$(CC) $(CFLAGS) $(RELEASEFLAGS) -o $@ $^

debug: main.cpp
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -o main $^

clean:
	rm -fv main
