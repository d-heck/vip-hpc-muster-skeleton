# David Heck (dheck@udel.edu)
# Makefile for the vip-hpc-muster skeleton

# Compiler Variables
CC := g++
NVCC := nvcc

# G++ Flags, include src and external directories for .h includes. May need to update boost include path to your boost include.
CFLAGS := -Wall -I./src -I./external -I./../muster/boost_1_69_0/

# NVCC Flags, just include directories for now.
NVCCFLAGS := -I./src -I./external -I./../muster/boost_1_69_0/

# Get all .cpp files from the test directory
CPPSRCS := $(wildcard ./tests/*.cpp)

# Substitute all ".cpp" file name strings to ".o" file name strings
CPPOBJS := $(patsubst %.cpp,%cpp.o,$(CPPSRCS))

# Get all .cu files from the test directory
NVCCSRCS := $(wildcard ./tests/*.cu)

# Substitute all ".cu" file name strings to "cu.o" file name strings
NVCCOBJS := $(patsubst %.cu,%cu.o,$(NVCCSRCS))

# Compile everything
all: testnvcc testcpp

# Compile all cpp objects
testcpp: $(CPPOBJS)
	$(CC) -o /tests/$@ $^

# Compile all .cu files
testnvcc: $(NVCCOBJS)

# Generate .cpp compile command
%cpp.o: %.cpp
	$(CC) $(CFLAGS) -c $<

# Generate .cu compile command
%cu.o: %.cu
	$(NVCC) $(NVCCFLAGS) $< -o $@

clean:
	rm tests/*.o
