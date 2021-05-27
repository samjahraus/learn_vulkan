cmake_minimum_required(VERSION 3.20.0)

project(learn_vulkan)

set(HAVE_LIBC TRUE)
set(src
    "src/main.cpp"
)

set(headers

)

add_executable(${PROJECT_NAME} ${src} ${headers})

target_compile_features(learn_vulkan PUBLIC cxx_std_17)

find_package(Vulkan)

if (Vulkan_FOUND)
    target_include_directories(${PROJECT_NAME} PUBLIC Vulkan::Vulkan)
    target_link_libraries(${PROJECT_NAME} Vulkan::Vulkan)
endif()

add_subdirectory(vendor/glfw)

add_subdirectory(vendor/glm)

target_include_directories(${PROJECT_NAME}
    PUBLIC vendor/glfw/include
    PUBLIC vendor/glm)

target_link_directories(${PROJECT_NAME} 
    PRIVATE vendor/glfw/src
    PRIVATE vendor/glm)

target_link_libraries(${PROJECT_NAME}
    glfw
    glm)