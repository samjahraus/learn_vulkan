cmake_minimum_required(VERSION 3.10)

project(learn_vulkan)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

foreach (OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/bin)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/bin)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PROJECT_BINARY_DIR}/lib)
endforeach()

set (CMAKE_CXX_STANDARD 17)

find_package(Vulkan REQUIRED)
find_path(STB_INCLUDE_DIRS "stb.h")

IF (NOT Vulkan_FOUND)
    message(FATAL_ERROR "Could not find Vulkan library!")
ELSE()
    message(STATUS ${Vulkan_LIBRARY})
ENDIF()

set(MAIN_PROJECT "Sandbox")

add_subdirectory(vendor/volk)
add_subdirectory(vendor/glfw)
add_subdirectory(vendor/glm)
add_subdirectory(assets)
add_subdirectory(src)

set_property (DIRECTORY PROPERTY VS_STARTUP_PROJECT ${MAIN_PROJECT})