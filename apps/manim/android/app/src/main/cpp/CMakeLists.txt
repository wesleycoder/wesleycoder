cmake_minimum_required(VERSION 3.22.1)

project("manim")

set(NIM_CACHE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../build/android_cache)

file(GLOB_RECURSE NIM_SOURCES CONFIGURE_DEPENDS "${NIM_CACHE_DIR}/*.c")

add_library(
    manim
    SHARED
    ${NIM_SOURCES}
)

find_library(
    log-lib
    log
)

target_link_libraries(
    manim
    ${log-lib}
)
