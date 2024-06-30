cmake_minimum_required(VERSION 3.13)

project("sub1 test")

add_library(main OBJECT)

target_sources(main
    PRIVATE
        "main.c"
)

target_include_directories(main
    PRIVATE
        "/usr/local/include"
        "${PROJECT_SOURCE_DIR}"
)