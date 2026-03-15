cmake_minimum_required(VERSION 3.16)
project(AidynChronicles CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---------------------------------------------------------------------------
# Build type
# ---------------------------------------------------------------------------
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
endif()

# ---------------------------------------------------------------------------
# Game version selection
# Debug build (VER_01_02_01) is the default – it has the richest symbol info.
# Pass -DGAME_VERSION=2 on the cmake command line to select NTSC 1.0, etc.
# ---------------------------------------------------------------------------
set(GAME_VERSION 1 CACHE STRING
    "Game version: 1=Debug 2=NA1.0 3=NA1.1 4=EU03 5=EU04 6=EU04.27")
add_compile_definitions(GAME_VERSION=${GAME_VERSION})

# ---------------------------------------------------------------------------
# Platform detection
# ---------------------------------------------------------------------------
if(NOT UNIX OR NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
  message(FATAL_ERROR "This CMake build is for Linux only.")
endif()
add_compile_definitions(PLATFORM_LINUX=1 TARGET_LINUX=1)

# ---------------------------------------------------------------------------
# External dependencies
# ---------------------------------------------------------------------------
find_package(SDL2 REQUIRED)
find_package(OpenGL REQUIRED)
find_package(Threads REQUIRED)

# SDL2_mixer (for audio backend)
find_library(SDL2_MIXER_LIB NAMES SDL2_mixer)
if(NOT SDL2_MIXER_LIB)
  message(WARNING "SDL2_mixer not found – audio backend will be disabled.")
  set(HAVE_SDL2_MIXER 0)
else()
  set(HAVE_SDL2_MIXER 1)
  add_compile_definitions(HAVE_SDL2_MIXER=1)
endif()

# ---------------------------------------------------------------------------
# Include paths
# ---------------------------------------------------------------------------
include_directories(
  ${PROJECT_SOURCE_DIR}/include               # game headers (typedefs.h etc.)
  ${PROJECT_SOURCE_DIR}/ultra/include/2.0I    # ultra64.h shim
  # Note: ultra/include/2.0I/PR is NOT added here – adding it would shadow the
  # system <sched.h> that pthread.h depends on.  Game code reaches sched.h via
  # the relative path in typedefs.h: "../ultra/include/2.0I/PR/sched.h".
  ${SDL2_INCLUDE_DIRS}
  ${OPENGL_INCLUDE_DIR}
)

# ---------------------------------------------------------------------------
# Compiler flags
# ---------------------------------------------------------------------------
add_compile_options(
  -Wall -Wextra
  # Suppress warnings from Ghidra-generated pseudocode that we haven't
  # cleaned up yet.
  -Wno-unused-parameter
  -Wno-unused-variable
  -Wno-sign-compare
  -Wno-strict-aliasing
  -Wno-missing-field-initializers
  -Wno-implicit-fallthrough
  # The pseudocode files use C-style casts and other non-ideal patterns.
  -Wno-old-style-cast
  # Permit the game's use of offsetof on non-standard types.
  -Wno-invalid-offsetof
  # N64 code assumes char is unsigned.
  -funsigned-char
  # Allow the game's use of GNU statement expressions (__builtin_*)
  -fno-strict-aliasing
  # Ghidra decompilation uses member names identical to their types (e.g.
  # "EncounterDat EncounterDat") — GCC 13 makes this an error by default.
  -Wno-changes-meaning
  # Some initializers use (u32)-1 which is technically narrowing; allow it.
  -Wno-narrowing
  # Allow implicit conversions common in N64 C code.
  -fpermissive
  # Silence pedantic ISO warnings irrelevant to a decompilation project.
  -Wno-pedantic
  -Wno-write-strings
  -Wno-address
)

# ---------------------------------------------------------------------------
# Platform backend sources
# ---------------------------------------------------------------------------
set(PLATFORM_SRCS
  platform/linux/main.cpp
  platform/linux/os_impl.cpp
  platform/linux/gfx_backend.cpp
  platform/linux/input_backend.cpp
  platform/linux/heap_shim.cpp
  platform/linux/asset_loader.cpp
  platform/linux/stubs.cpp
)

if(HAVE_SDL2_MIXER)
  list(APPEND PLATFORM_SRCS platform/linux/audio_backend.cpp)
endif()

# ---------------------------------------------------------------------------
# Game sources (src_pseudo/*.cpp)
#
# Collect all pseudocode files.  As they get cleaned up and made compilable
# they will automatically be included.  Files that don't yet compile can be
# excluded by adding them to GAME_SRCS_EXCLUDE below.
# ---------------------------------------------------------------------------

# Files not yet compilable (add here to exclude until fixed):
set(GAME_SRCS_EXCLUDE
  # Example:
  # src_pseudo/SomeNotYetFixed.cpp
)

file(GLOB_RECURSE GAME_SRCS_ALL
  "${PROJECT_SOURCE_DIR}/src_pseudo/*.cpp"
  "${PROJECT_SOURCE_DIR}/src_pseudo/*.c"
)

# Filter exclusions
foreach(ex ${GAME_SRCS_EXCLUDE})
  list(REMOVE_ITEM GAME_SRCS_ALL "${PROJECT_SOURCE_DIR}/${ex}")
endforeach()

# ---------------------------------------------------------------------------
# Executable
# ---------------------------------------------------------------------------
add_executable(aidyn
  ${PLATFORM_SRCS}
  ${GAME_SRCS_ALL}
)

# N64 decompilation headers intentionally define globals (matching ROM layout).
# Multiple .cpp files include the same headers, causing duplicate definitions.
# --allow-multiple-definitions tells the linker to accept the first definition.
target_link_options(aidyn PRIVATE "LINKER:--allow-multiple-definition")

target_link_libraries(aidyn
  ${SDL2_LIBRARIES}
  ${OPENGL_LIBRARIES}
  Threads::Threads
  m        # libm (math)
  dl       # libdl (dynamic linking, used by some GL loaders)
)

if(HAVE_SDL2_MIXER)
  target_link_libraries(aidyn ${SDL2_MIXER_LIB})
endif()

# ---------------------------------------------------------------------------
# Install
# ---------------------------------------------------------------------------
install(TARGETS aidyn RUNTIME DESTINATION bin)

# ---------------------------------------------------------------------------
# Helper targets
# ---------------------------------------------------------------------------

# Quick syntax-check of all platform sources without building the full game
add_custom_target(check-platform
  COMMAND ${CMAKE_CXX_COMPILER} -std=c++17 -fsyntax-only
          -I${PROJECT_SOURCE_DIR}/include
          -I${PROJECT_SOURCE_DIR}/ultra/include/2.0I
          -I${PROJECT_SOURCE_DIR}/ultra/include/2.0I/PR
          ${SDL2_INCLUDE_DIRS}
          -DGAME_VERSION=1 -DPLATFORM_LINUX=1
          ${PLATFORM_SRCS}
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  COMMENT "Syntax-checking platform sources"
)

# Print a summary
message(STATUS "")
message(STATUS "=== Aidyn Chronicles – Linux Native Build ===")
message(STATUS "  Game version : ${GAME_VERSION}")
message(STATUS "  Build type   : ${CMAKE_BUILD_TYPE}")
message(STATUS "  SDL2         : ${SDL2_LIBRARIES}")
message(STATUS "  OpenGL       : ${OPENGL_LIBRARIES}")
message(STATUS "  SDL2_mixer   : ${SDL2_MIXER_LIB}")
message(STATUS "  Game sources : ${GAME_SRCS_ALL}")
message(STATUS "")
message(STATUS "  To build:")
message(STATUS "    cmake -B build && cmake --build build -j\$(nproc)")
message(STATUS "")
message(STATUS "  To run:")
message(STATUS "    build/aidyn baserom.debug.z64")
message(STATUS "")
