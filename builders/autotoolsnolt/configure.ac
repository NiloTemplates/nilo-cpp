AC_INIT([myproject], [1.0])  # Changed from $PROJECT_NAME to literal
AM_INIT_AUTOMAKE([foreign subdir-objects])
AC_PROG_CC
AC_PROG_CXX

# Set default project configuration
DEFAULT_PROJECT_NAME="myproject"
DEFAULT_EXECUTABLE_NAME="myapp"
DEFAULT_PROJECT_TYPE="executable"

AC_ARG_VAR([PROJECT_NAME], [Name of the project])
AC_ARG_VAR([EXECUTABLE_NAME], [Name of the executable or library])
AC_ARG_VAR([PROJECT_TYPE], [Type of project: executable, static_lib, or shared_lib])

if test "x$PROJECT_NAME" = "x"; then
    PROJECT_NAME="$DEFAULT_PROJECT_NAME"
fi

if test "x$EXECUTABLE_NAME" = "x"; then
    EXECUTABLE_NAME="$DEFAULT_EXECUTABLE_NAME"
fi

if test "x$PROJECT_TYPE" = "x"; then
    PROJECT_TYPE="$DEFAULT_PROJECT_TYPE"
fi

AC_SUBST([PROJECT_NAME])
AC_SUBST([EXECUTABLE_NAME])
AC_SUBST([PROJECT_TYPE])

# Check project type validity
case "$PROJECT_TYPE" in
    executable|static_lib|shared_lib) ;;
    *) AC_MSG_ERROR([Invalid PROJECT_TYPE: must be executable, static_lib, or shared_lib]) ;;
esac

AC_ARG_ENABLE([debug],
  [AS_HELP_STRING([--enable-debug],
    [Enable debug mode (default: no)])],
  [enable_debug=$enableval],
  [enable_debug=no])

AM_CONDITIONAL([DEBUG], [test "x$enable_debug" = "xyes"])

AC_CHECK_LIB([m], [cos], [LIBM="-lm"])
AC_SUBST([LIBM])

AC_CONFIG_SRCDIR([../../src/main.c])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT