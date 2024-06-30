cmake_minimum_required(VERSION 3.13)

# custom setting
set(SHELL_FILE "/opt/raylib/src/minshell.html")

# cmake setting
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/web)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --shell-file ${SHELL_FILE}")

project("index")

add_executable(index)
add_subdirectory(src)

set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".html")
target_link_options(${PROJECT_NAME} 
    PUBLIC 
        "-sUSE_GLFW=3"
        "-sASYNCIFY"
        "-sASSERTIONS=1"
        "-sWASM=1" 
        "-sGL_ENABLE_GET_PROC_ADDRESS=1"
)

target_link_directories(index
    PRIVATE
        "/usr/local/lib"
)

target_link_libraries(index
    raylib
    main
)