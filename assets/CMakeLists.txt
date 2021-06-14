file(GLOB shader_files shaders/*.vert shaders/*.frag shaders/*.rgen shaders/*.rchit shaders/*.rint shaders/*.rmiss)
file(GLOB shader_extra_files shaders/*.glsl)
set_source_files_properties(${shader_extra_files} PROPERTIES HEADER_FILE_ONLY TRUE)

# Shader compilation
foreach(shader ${shader_files})
	message("SHADER: ${shader}")
	get_filename_component(file_name ${shader} NAME)
	get_filename_component(full_path ${shader} ABSOLUTE)
	set(output_dir ${CMAKE_CURRENT_BINARY_DIR}/shaders/)
    message("OUTDIR: ${Vulkan_GLSLC_EXECUTABLE}")
	set(output_file ${output_dir}/${file_name}.spv)
	set(compiled_shaders ${compiled_shaders} ${output_file})
	set(compiled_shaders ${compiled_shaders} PARENT_SCOPE)
	set_source_files_properties(${shader} PROPERTIES HEADER_FILE_ONLY TRUE)
	if (WIN32)
        add_custom_command(
            OUTPUT ${output_file}
            COMMAND ${Vulkan_GLSLC_EXECUTABLE} ${full_path} -o ${output_file}
            DEPENDS ${full_path}
        )
    else()
        add_custom_command(
            OUTPUT ${output_file}
            COMMAND mkdir ${output_dir} 
            COMMAND ${Vulkan_GLSLC_EXECUTABLE} ${full_path} -o ${output_file}
            DEPENDS ${full_path}
        )
    endif()
endforeach()

source_group("Shaders" FILES ${shader_files} ${shader_extra_files})
add_custom_target(
	Assets 
	DEPENDS ${compiled_shaders}
	SOURCES ${shader_files} ${shader_extra_files})