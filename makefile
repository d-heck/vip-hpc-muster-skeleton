# David Heck (dheck@udel.edu)
# Makefile for the vip-hpc-muster skeleton

# Compiler Variables
CC := g++
NVCC := nvcc

# G++ Flags, include src and external directories for .h includes.
CFLAGS := -Wall -I./src -I./external

# Set Target
TARGET := test

# Get all .cpp files from the test directory
SRCS := $(wildcard ./tests/*.cpp)

# Substitute all ".cpp" file name strings to ".o" file name strings
OBJS := $(patsubst %.cpp,%.o,$(SRCS))

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

%.o: %.cpp
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf $(TARGET) *.o
	
.PHONY: all clean
