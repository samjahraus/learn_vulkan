cmake_minimum_required(VERSION 3.20.0)

project(learn_vulkan)

set(HAVE_LIBC TRUE)
set(src
    "src/main.cpp"
)

set(headers

)

add_executable(${PROJECT_NAME} ${src} ${headers})

target_include_directories(${PROJECT_NAME} PUBLIC C:/VulkanSDK/1.2.176.1/Include)
target_link_directories(${PROJECT_NAME} PRIVATE C:/VulkanSDK/1.2.176.1/Lib)
target_link_libraries(${PROJECT_NAME} C:/VulkanSDK/1.2.176.1/Lib/vulkan-1.lib)

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