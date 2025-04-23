AC_INIT([myproject], [1.0])
AM_INIT_AUTOMAKE([foreign subdir-objects])
AC_PROG_CC

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
  AC_CONFIG_SRCDIR([../src/main.c])
  AC_CONFIG_FILES([Makefile])
  AC_OUTPUT
])

AC_ARG_ENABLE([debug],
  [AS_HELP_STRING([--enable-debug],
    [Enable debug mode (default: no)])],
  [enable_debug=$enableval],
  [enable_debug=no])

AM_CONDITIONAL([DEBUG], [test "x$enable_debug" = "xyes"])
