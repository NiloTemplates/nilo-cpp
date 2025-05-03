AUTOMAKE_OPTIONS = foreign

SOURCES = $(shell find ../../src -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cxx' -o -name '*.c++' \))

if DEBUG
AM_CFLAGS = -g3 -O0
AM_CXXFLAGS = -g3 -O0
else
AM_CFLAGS = -O2
AM_CXXFLAGS = -O2
endif

all-local:
	case "$(PROJECT_TYPE)" in \
	  executable) \
	    $(CXX) $(CPPFLAGS) $(AM_CXXFLAGS) $(CXXFLAGS) -o $(EXECUTABLE_NAME) $(SOURCES) $(LIBM) ;; \
	  static_lib) \
	    $(AR) rcs lib$(EXECUTABLE_NAME).a $(SOURCES) ;; \
	  shared_lib) \
	    $(CXX) -shared -fPIC -o lib$(EXECUTABLE_NAME).so $(SOURCES) ;; \
	esac

install-exec-local:
	$(MKDIR_P) $(DESTDIR)$(bindir)
	$(MKDIR_P) $(DESTDIR)$(libdir)
	case "$(PROJECT_TYPE)" in \
	  executable) \
	    $(INSTALL_PROGRAM) $(EXECUTABLE_NAME) $(DESTDIR)$(bindir)/$(EXECUTABLE_NAME) ;; \
	  static_lib) \
	    $(INSTALL_DATA) lib$(EXECUTABLE_NAME).a $(DESTDIR)$(libdir)/lib$(EXECUTABLE_NAME).a ;; \
	  shared_lib) \
	    $(INSTALL_PROGRAM) lib$(EXECUTABLE_NAME).so $(DESTDIR)$(libdir)/lib$(EXECUTABLE_NAME).so ;; \
	esac

clean-local:
	rm -f $(EXECUTABLE_NAME) lib$(EXECUTABLE_NAME).a lib$(EXECUTABLE_NAME).so