AUTOMAKE_OPTIONS = foreign
bin_PROGRAMS = myapp

# Dynamic C/C++ sources (GNU Make extension)
myapp_SOURCES = $(shell find ../src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
#myapp_SOURCES = $(abspath $(wildcard ../../src/*.c ../../src/*.cpp))
myapp_LDADD = @LIBM@

if DEBUG
AM_CFLAGS = -g3 -O0
AM_CXXFLAGS = -g3 -O0
else
AM_CFLAGS = -O2
AM_CXXFLAGS = -O2
endif