cmake_minimum_required(VERSION 3.10)
project(myproject VERSION 1.0 LANGUAGES C CXX)  # Enable C++

# Glob all C/C++ sources
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
  "../../src/*.c"
  "../../src/*.cpp"
  "../../src/*.cxx"
  "../../src/*.c++"
)

set(EXECUTABLE_NAME "myapp" CACHE STRING "Name of the executable")

add_executable(${EXECUTABLE_NAME} ${SOURCES})

# Handle C++-specific dependencies
find_package(Threads)  # Example for C++ projects
target_link_libraries(${EXECUTABLE_NAME} PRIVATE ${M_LIB} Threads::Threads)

install(TARGETS ${EXECUTABLE_NAME} DESTINATION bin)
