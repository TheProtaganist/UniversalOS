# UniversalOS - Root CMake Configuration
# Quantum-enhanced operating system build system

cmake_minimum_required(VERSION 3.20)

project(UniversalOS
    VERSION 0.1.0
    DESCRIPTION "Quantum-enhanced Linux distribution with Helix kernel"
    LANGUAGES C CXX
)

# Project metadata
set(PROJECT_HOMEPAGE_URL "https://github.com/universalos/universalos")
set(PROJECT_MAINTAINER "UniversalOS Team")

# CMake policies
cmake_policy(SET CMP0048 NEW)  # project() command manages VERSION variables
cmake_policy(SET CMP0077 NEW)  # option() honors normal variables

# Build configuration
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type (Debug, Release, RelWithDebInfo, MinSizeRel)" FORCE)
endif()

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

# Output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Installation directories
include(GNUInstallDirs)
set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Installation prefix")

# Options
option(BUILD_KERNEL "Build Linux kernel modifications" ON)
option(BUILD_HELIX "Build Helix kernel core" ON)
option(BUILD_QUANTUM "Build quantum computing components" ON)
option(BUILD_DESKTOP "Build Cutefish desktop environment" ON)
option(BUILD_BOOTLOADER "Build Helix Boot bootloader" ON)
option(BUILD_AUDIO "Build 432Hz audio system" ON)
option(BUILD_TOOLS "Build system utilities" ON)
option(BUILD_LIBS "Build internal libraries" ON)
option(BUILD_TESTS "Build test suites" ON)
option(BUILD_DOCS "Build documentation" OFF)
option(ENABLE_COVERAGE "Enable code coverage" OFF)
option(ENABLE_SANITIZERS "Enable sanitizers (ASan, UBSan)" OFF)

# Component selection (for partial builds)
set(COMPONENT "all" CACHE STRING "Component to build (all, kernel, helix, quantum, desktop, bootloader, audio, tools, libs)")

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wpedantic")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")

# Debug flags
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -O0 -DDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -O0 -DDEBUG")

# Release flags
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3 -DNDEBUG -march=native")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -DNDEBUG -march=native")

# Sanitizers
if(ENABLE_SANITIZERS)
    set(SANITIZER_FLAGS "-fsanitize=address,undefined -fno-omit-frame-pointer")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${SANITIZER_FLAGS}")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SANITIZER_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${SANITIZER_FLAGS}")
    message(STATUS "Sanitizers enabled: ASan, UBSan")
endif()

# Code coverage
if(ENABLE_COVERAGE)
    set(COVERAGE_FLAGS "--coverage -fprofile-arcs -ftest-coverage")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COVERAGE_FLAGS}")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COVERAGE_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${COVERAGE_FLAGS}")
    message(STATUS "Code coverage enabled")
endif()

# Include directories
include_directories(
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_BINARY_DIR}/include
)

# Find dependencies
find_package(Threads REQUIRED)

# Optional dependencies
find_package(Qt5 COMPONENTS Core Widgets QUIET)
if(Qt5_FOUND)
    message(STATUS "Qt5 found: ${Qt5_VERSION}")
else()
    message(STATUS "Qt5 not found - desktop environment will not be built")
    set(BUILD_DESKTOP OFF)
endif()

find_package(PkgConfig QUIET)
if(PkgConfig_FOUND)
    pkg_check_modules(ALSA alsa)
    pkg_check_modules(PULSE libpulse)
    if(ALSA_FOUND)
        message(STATUS "ALSA found: ${ALSA_VERSION}")
    endif()
    if(PULSE_FOUND)
        message(STATUS "PulseAudio found: ${PULSE_VERSION}")
    endif()
endif()

# Testing
if(BUILD_TESTS)
    enable_testing()
    include(CTest)
    
    # Find test frameworks
    find_package(GTest QUIET)
    if(GTest_FOUND)
        message(STATUS "Google Test found")
    else()
        message(STATUS "Google Test not found - some tests will not be built")
    endif()
endif()

# Documentation
if(BUILD_DOCS)
    find_package(Doxygen QUIET)
    if(Doxygen_FOUND)
        message(STATUS "Doxygen found: ${DOXYGEN_VERSION}")
    else()
        message(WARNING "Doxygen not found - documentation will not be built")
        set(BUILD_DOCS OFF)
    endif()
endif()

# Component build logic
macro(build_component component_name)
    if(COMPONENT STREQUAL "all" OR COMPONENT STREQUAL ${component_name})
        message(STATUS "Building component: ${component_name}")
        add_subdirectory(src/${component_name})
    endif()
endmacro()

# Build libraries first (required by other components)
if(BUILD_LIBS AND (COMPONENT STREQUAL "all" OR COMPONENT STREQUAL "libs"))
    message(STATUS "Building component: libs")
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/libs/CMakeLists.txt)
        add_subdirectory(src/libs)
    else()
        message(STATUS "  src/libs/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build kernel modifications
if(BUILD_KERNEL)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/kernel/CMakeLists.txt)
        build_component(kernel)
    else()
        message(STATUS "  src/kernel/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build Helix kernel
if(BUILD_HELIX)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/helix/CMakeLists.txt)
        build_component(helix)
    else()
        message(STATUS "  src/helix/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build quantum components
if(BUILD_QUANTUM)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/quantum/CMakeLists.txt)
        build_component(quantum)
    else()
        message(STATUS "  src/quantum/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build desktop environment
if(BUILD_DESKTOP)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/desktop/CMakeLists.txt)
        build_component(desktop)
    else()
        message(STATUS "  src/desktop/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build bootloader
if(BUILD_BOOTLOADER)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/bootloader/CMakeLists.txt)
        build_component(bootloader)
    else()
        message(STATUS "  src/bootloader/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build audio system
if(BUILD_AUDIO)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/audio/CMakeLists.txt)
        build_component(audio)
    else()
        message(STATUS "  src/audio/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build tools
if(BUILD_TOOLS)
    if(EXISTS ${CMAKE_SOURCE_DIR}/src/tools/CMakeLists.txt)
        build_component(tools)
    else()
        message(STATUS "  src/tools/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build tests
if(BUILD_TESTS)
    if(EXISTS ${CMAKE_SOURCE_DIR}/tests/CMakeLists.txt)
        message(STATUS "Building tests")
        add_subdirectory(tests)
    else()
        message(STATUS "  tests/CMakeLists.txt not found - skipping")
    endif()
endif()

# Build documentation
if(BUILD_DOCS)
    if(EXISTS ${CMAKE_SOURCE_DIR}/docs/CMakeLists.txt)
        message(STATUS "Building documentation")
        add_subdirectory(docs)
    else()
        # Create basic Doxygen configuration
        set(DOXYGEN_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/docs)
        set(DOXYGEN_GENERATE_HTML YES)
        set(DOXYGEN_GENERATE_MAN NO)
        set(DOXYGEN_EXTRACT_ALL YES)
        set(DOXYGEN_RECURSIVE YES)
        
        doxygen_add_docs(docs
            ${CMAKE_SOURCE_DIR}/src
            ${CMAKE_SOURCE_DIR}/include
            COMMENT "Generating API documentation with Doxygen"
        )
    endif()
endif()

# Installation rules
install(DIRECTORY ${CMAKE_SOURCE_DIR}/include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/universalos
    FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp"
)

# Package configuration
set(CPACK_PACKAGE_NAME "UniversalOS")
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PROJECT_DESCRIPTION})
set(CPACK_PACKAGE_VENDOR ${PROJECT_MAINTAINER})
set(CPACK_PACKAGE_CONTACT "team@universalos.org")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/README.md")

# Package generators
set(CPACK_GENERATOR "TGZ;DEB;RPM")
set(CPACK_SOURCE_GENERATOR "TGZ")

# Debian package
set(CPACK_DEBIAN_PACKAGE_MAINTAINER ${PROJECT_MAINTAINER})
set(CPACK_DEBIAN_PACKAGE_SECTION "system")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")

# RPM package
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "System Environment/Base")

include(CPack)

# Summary
message(STATUS "")
message(STATUS "========================================")
message(STATUS "UniversalOS Build Configuration Summary")
message(STATUS "========================================")
message(STATUS "Version:           ${PROJECT_VERSION}")
message(STATUS "Build type:        ${CMAKE_BUILD_TYPE}")
message(STATUS "Install prefix:    ${CMAKE_INSTALL_PREFIX}")
message(STATUS "C compiler:        ${CMAKE_C_COMPILER}")
message(STATUS "C++ compiler:      ${CMAKE_CXX_COMPILER}")
message(STATUS "")
message(STATUS "Components:")
message(STATUS "  Kernel:          ${BUILD_KERNEL}")
message(STATUS "  Helix:           ${BUILD_HELIX}")
message(STATUS "  Quantum:         ${BUILD_QUANTUM}")
message(STATUS "  Desktop:         ${BUILD_DESKTOP}")
message(STATUS "  Bootloader:      ${BUILD_BOOTLOADER}")
message(STATUS "  Audio:           ${BUILD_AUDIO}")
message(STATUS "  Tools:           ${BUILD_TOOLS}")
message(STATUS "  Libraries:       ${BUILD_LIBS}")
message(STATUS "")
message(STATUS "Options:")
message(STATUS "  Tests:           ${BUILD_TESTS}")
message(STATUS "  Documentation:   ${BUILD_DOCS}")
message(STATUS "  Coverage:        ${ENABLE_COVERAGE}")
message(STATUS "  Sanitizers:      ${ENABLE_SANITIZERS}")
message(STATUS "")
message(STATUS "Component filter:  ${COMPONENT}")
message(STATUS "========================================")
message(STATUS "")
