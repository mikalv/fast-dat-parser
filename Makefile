CXX=g++
CFLAGS=-pedantic -std=c++1z -W -Wall -Wcast-qual -Wconversion -Werror -Wextra -Wwrite-strings

all: bestchain parser

bestchain: bestchain.cpp include/hash.hpp include/hvectors.hpp
	$(CXX) $(CFLAGS) -O3 $< -Iinclude -I. libconsensus/*.cpp -o $@

parser: parser.cpp include/block.hpp include/hash.hpp include/hvectors.hpp include/slice.hpp include/threadpool.hpp include/transforms.hpp transforms/*.hpp
	$(CXX) $(CFLAGS) -pthread -O3 $< -Iinclude -I. -lleveldb libconsensus/*.cpp -o $@

clean:
	rm -f bestchain parser
