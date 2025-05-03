cmake_minimum_required(VERSION 3.10)

# Project configuration
if(NOT DEFINED PROJECT_NAME)
    set(PROJECT_NAME "myproject")
endif()

if(NOT DEFINED EXECUTABLE_NAME)
    set(EXECUTABLE_NAME "myapp")
endif()

if(NOT DEFINED PROJECT_TYPE)
    set(PROJECT_TYPE "executable")
endif()

project(${PROJECT_NAME} VERSION 1.0 LANGUAGES C CXX)

# Validate project type
set(VALID_TYPES executable static_lib shared_lib)
if(NOT PROJECT_TYPE IN_LIST VALID_TYPES)
    message(FATAL_ERROR "Invalid PROJECT_TYPE: ${PROJECT_TYPE}. Must be one of: ${VALID_TYPES}")
endif()

# Source files
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS
  "../../src/*.c"
  "../../src/*.cpp"
  "../../src/*.cxx"
  "../../src/*.c++"
)

# Build target
if(PROJECT_TYPE STREQUAL "executable")
    add_executable(${EXECUTABLE_NAME} ${SOURCES})
    install(TARGETS ${EXECUTABLE_NAME} DESTINATION bin)
elseif(PROJECT_TYPE STREQUAL "static_lib")
    add_library(${EXECUTABLE_NAME} STATIC ${SOURCES})
    install(TARGETS ${EXECUTABLE_NAME} DESTINATION lib)
elseif(PROJECT_TYPE STREQUAL "shared_lib")
    add_library(${EXECUTABLE_NAME} SHARED ${SOURCES})
    install(TARGETS ${EXECUTABLE_NAME} DESTINATION lib)
endif()

# Dependencies
find_package(Threads REQUIRED)
target_link_libraries(${EXECUTABLE_NAME} PRIVATE Threads::Threads)

# Compiler options
option(ENABLE_DEBUG "Enable debug mode" OFF)
if(ENABLE_DEBUG)
    target_compile_options(${EXECUTABLE_NAME} PRIVATE -g -O0)
else()
    target_compile_options(${EXECUTABLE_NAME} PRIVATE -O2)
endif()