# Compiler
CC := gcc

# Source and object files
SOURCES := main.c
OBJECTS := $(SOURCES:.c=.o)

# Output name
TARGET := main

# Compiler and linker flags
CFLAGS := -Wall -Wextra -Wpedantic -g
LDFLAGS :=
LIBS :=

# Default target
all: $(TARGET)

# Link object files to make the final executable
$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ $(LIBS)

# Compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	@rm -fv $(TARGET) $(OBJECTS)

.PHONY: all clean
