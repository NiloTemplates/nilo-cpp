# Find all C/C++ sources (recursive)
C_SRCS := $(shell find src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
C_SRCS_COMMA := $(shell echo $(C_SRCS) | sed "s| |', '|g")  # For Meson
PROJECT_NAME := myproject
EXECUTABLE_NAME := myapp

.PHONY: all autotools cmake meson clean

all: autotools  # Default to Autotools

autotools:
	cd builders/autotools && autoreconf -ivf && ./configure --prefix=$(PWD)/build PROJECT_NAME=${PROJECT_NAME} EXECUTABLE_NAME=${EXECUTABLE_NAME} && make && make install

cmake:
	mkdir -p builders/cmake/build && cd builders/cmake/build && cmake -DPROJECT_NAME=${PROJECT_NAME} -DEXECUTABLE_NAME=${EXECUTABLE_NAME} .. -DCMAKE_INSTALL_PREFIX=$(PWD)/build && cmake --build . --target install

meson:
	mkdir -p builders/meson/builddir && cd builders/meson/builddir && meson setup .. -DPROJECT_NAME=${PROJECT_NAME} -DEXECUTABLE_NAME=${EXECUTABLE_NAME} --prefix=$(PWD)/build --buildtype=release && ninja && ninja install

clean:
	rm -rf \
	  build \
	  builders/autotools/Makefile builders/autotools/configure builders/autotools/config.status \
	  builders/autotools/Makefile builders/autotools/configure builders/autotools/config.status \
	  cmake/build meson/builddir \
	  builders/cmake/build builders/meson/builddir

sources:
	@echo "Sources found: $(C_SRCS)"