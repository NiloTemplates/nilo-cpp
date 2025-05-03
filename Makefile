# Find all C/C++ sources (recursive)
C_SRCS := $(shell find src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
C_SRCS_COMMA := $(shell echo $(C_SRCS) | sed "s| |', '|g")  # For Meson

# Project configuration
PROJECT_NAME := myproject
EXECUTABLE_NAME := myapp
PROJECT_TYPE := executable  # executable | static_lib | shared_lib

.PHONY: all autotools cmake meson clean sources

all: autotools  # Default to Autotools

autotools:
	cd builders/autotools && autoreconf -ivf && \
	./configure --prefix=$(PWD)/build \
	PROJECT_NAME=${PROJECT_NAME} \
	EXECUTABLE_NAME=${EXECUTABLE_NAME} \
	PROJECT_TYPE=${PROJECT_TYPE} && \
	make && make install

autotoolsnolt:
	cd builders/autotools && autoreconf -ivf && \
	./configure --prefix=$(PWD)/build \
	PROJECT_NAME=${PROJECT_NAME} \
	EXECUTABLE_NAME=${EXECUTABLE_NAME} \
	PROJECT_TYPE=${PROJECT_TYPE} && \
	make && make install

cmake:
	mkdir -p builders/cmake/build && cd builders/cmake/build && \
	cmake -DPROJECT_NAME=${PROJECT_NAME} \
	-DEXECUTABLE_NAME=${EXECUTABLE_NAME} \
	-DPROJECT_TYPE=${PROJECT_TYPE} \
	-DCMAKE_INSTALL_PREFIX=$(PWD)/build .. && \
	cmake --build . --target install

meson:
	mkdir -p builders/meson/builddir && cd builders/meson/builddir && \
	meson setup .. \
	-DPROJECT_NAME=${PROJECT_NAME} \
	-DEXECUTABLE_NAME=${EXECUTABLE_NAME} \
	-DPROJECT_TYPE=${PROJECT_TYPE} \
	--prefix=$(PWD)/build --buildtype=release && \
	ninja && ninja install

clean:
	rm -rf \
	  build \
	  builders/autotools/Makefile builders/autotools/configure builders/autotools/config.status \
	  builders/autotools/autom4te.cache builders/autotools/aclocal.m4 \
	  builders/cmake/build builders/meson/builddir

sources:
	@echo "Sources found: $(C_SRCS)"