AUTOMAKE_OPTIONS = foreign
noinst_PROGRAMS = 
bin_PROGRAMS =

# Dynamic C/C++ sources (GNU Make extension)
#myapp_SOURCES = $(shell find ../src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
##myapp_SOURCES = $(abspath $(wildcard ../../src/*.c ../../src/*.cpp))
#myapp_LDADD = @LIBM@

SOURCES = $(shell find ../../src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))
all-local: $(EXECUTABLE_NAME)

$(EXECUTABLE_NAME): $(SOURCES)
	$(CXX) $(CPPFLAGS) $(AM_CXXFLAGS) $(CXXFLAGS) -o $@ $^ $(LIBM)

install-exec-local:
	$(MKDIR_P) $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) $(EXECUTABLE_NAME) $(DESTDIR)$(bindir)/$(EXECUTABLE_NAME)

clean-local:
	rm -f $(EXECUTABLE_NAME)

if DEBUG
AM_CFLAGS = -g3 -O0
AM_CXXFLAGS = -g3 -O0
else
AM_CFLAGS = -O2
AM_CXXFLAGS = -O2
endif