AC_INIT([$PROJECT_NAME], [1.0])
AM_INIT_AUTOMAKE([foreign subdir-objects])
AC_PROG_CC

# Set default project and executable names
DEFAULT_PROJECT_NAME="myproject"
DEFAULT_EXECUTABLE_NAME="myapp"

AC_ARG_VAR([PROJECT_NAME], [Name of the project])
AC_ARG_VAR([EXECUTABLE_NAME], [Name of the executable binary])

if test "x$PROJECT_NAME" = "x"; then
    PROJECT_NAME="$DEFAULT_PROJECT_NAME"
fi

if test "x$EXECUTABLE_NAME" = "x"; then
    EXECUTABLE_NAME="$DEFAULT_EXECUTABLE_NAME"
fi

AC_SUBST([PROJECT_NAME])
AC_SUBST([EXECUTABLE_NAME])

# Feature flags (example)
AC_ARG_ENABLE([debug], [Enable debug mode])
AS_IF([test "x$enable_debug" = "xyes"], [
  AC_DEFINE([DEBUG], [1], [Debug mode])
])

# Check for libraries (example)
AC_CHECK_LIB([m], [cos], [LIBM="-lm"])
AC_SUBST([LIBM])

# Conditional: Only process if not being called from CMake/Meson
m4_ifndef([FROM_CMAKE_OR_MESON], [
  AC_CONFIG_SRCDIR([../../src/main.c])
  AC_CONFIG_FILES([Makefile])
  AC_OUTPUT
])

AC_ARG_ENABLE([debug],
  [AS_HELP_STRING([--enable-debug],
    [Enable debug mode (default: no)])],
  [enable_debug=$enableval],
  [enable_debug=no])

AM_CONDITIONAL([DEBUG], [test "x$enable_debug" = "xyes"])
