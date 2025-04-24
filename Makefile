# Find all C/C++ sources (recursive)
C_SRCS := $(shell find src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
C_SRCS_COMMA := $(shell echo $(C_SRCS) | sed "s| |', '|g")  # For Meson

.PHONY: all autotools cmake meson clean

all: autotools  # Default to Autotools

autotools:
	cd builders/autotools && autoreconf -ivf && ./configure --prefix=$(PWD)/build && make && make install

cmake:
	mkdir -p builders/cmake/build && cd builders/cmake/build && cmake .. -DCMAKE_INSTALL_PREFIX=$(PWD)/build && cmake --build . --target install

meson:
	mkdir -p builders/meson/builddir && cd builders/meson/builddir && meson setup .. --prefix=$(PWD)/build --buildtype=release && ninja && ninja install

clean:
	rm -rf \
	  autotools/Makefile autotools/configure autotools/config.status \
	  builders/autotools/Makefile builders/autotools/configure builders/autotools/config.status \
	  cmake/build meson/builddir \
	  builders/cmake/build builders/meson/builddir

sources:
	# Ensure sources are discovered
	@echo "Sources found: $(C_SRCS)"