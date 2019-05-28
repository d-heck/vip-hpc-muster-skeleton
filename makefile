# David Heck (dheck@udel.edu)
# Makefile for the vip-hpc-muster skeleton

# Compiler Variables
CC := g++
NVCC := nvcc

# G++ Flags, include src and external directories for .h includes.
CFLAGS := -Wall -I./src -I./external

# NVCC Flags, just include directories for now.
NVCCFLAGS := -I./src -I./external

# Get all .cpp files from the test directory
CPPSRCS := $(wildcard ./tests/*.cpp)

# Substitute all ".cpp" file name strings to ".o" file name strings
CPPOBJS := $(patsubst %.cpp,%cpp.o,$(CPPSRCS))

# Get all .cu files from the test directory
NVCCSRCS := $(wildcard ./tests/*.cu)

# Substitute all ".cu" file name strings to "cu.o" file name strings
NVCCOBJS := $(patsubst %.cu,%cu.o,$(NVCCSRCS))

all: testcpp testnvcc

testcpp: $(CPPOBJS)
	$(CC) -o $@ $^

testnvcc: $(NVCCOBJS)
	$(NVCC) -o $@ $^

%cpp.o: %.cpp
	$(CC) $(CFLAGS) -c $<

%cu.o: %.cu
	$(NVCC) $(NVCCFLAGS) -c $<

clean:
	rm -rf $(TARGET) *.o
	
.PHONY: all clean
