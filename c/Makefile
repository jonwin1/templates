# List of source files
SOURCES = main.c

# Auto created list of object files
OBJECTS = $(SOURCES:%.c=%.o)

# Compilation flags
CFLAGS = -Wall -Werror -Wextra -Wpedantic -O2 -march=native

# Debug flags
DFLAGS = -g

# Linking flags
LDFLAGS =

# Libraries to link
LIBS =

all: main

# Create executable from object files
main: $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o main $(LIBS)

# Compile source files into object files
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

# Cleanup
clean:
	-rm -fv main
	-rm -fv $(OBJECTS)
