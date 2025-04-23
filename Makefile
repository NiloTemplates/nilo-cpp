# Find all C/C++ sources (recursive)
C_SRCS := $(shell find src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
C_SRCS_COMMA := $(shell echo $(C_SRCS) | sed "s| |', '|g")  # For Meson

.PHONY: all autotools cmake meson clean

all: autotools  # Default to Autotools

autotools:
	cd autotools && autoreconf -ivf && ./configure --prefix=$(PWD)/build && make && make install

cmake:
	mkdir -p cmake/build && cd cmake/build && cmake .. && cmake --install . --prefix $(PWD)/build

meson:
	mkdir -p meson/builddir && cd meson/builddir && meson .. && ninja

clean:
	rm -rf \
	  autotools/Makefile autotools/configure autotools/config.status \
	  cmake/build meson/builddir

sources:
	# Ensure sources are discovered
	@echo "Sources found: $(C_SRCS)"