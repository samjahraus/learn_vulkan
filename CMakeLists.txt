cmake_minimum_required(VERSION 3.20.0)

project(vulkan_test)

add_executable(${PROJECT_NAME} main.cpp)

add_subdirectory(vendor/glfw)

target_include_directories(${PROJECT_NAME} 
    PUBLIC vendor/glfw/include)

target_link_directories(${PROJECT_NAME} 
    PRIVATE vendor/glfw/src)

target_link_libraries(${PROJECT_NAME}
    glfw)