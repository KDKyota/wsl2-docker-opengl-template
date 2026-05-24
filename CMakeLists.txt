cmake_minimum_required(VERSION 3.16)
project(OpenGL_Practice)

set(CMAKE_CXX_STANDARD 17)

# GLADのソースを直接ビルドに含める
add_library(glad STATIC glad/src/glad.c)
target_include_directories(glad PUBLIC glad/include)

# 実行ファイルの定義
add_executable(main src/main.cpp)

# ライブラリを見つけてリンクする
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)

target_link_libraries(main
    glad
    OpenGL::GL
    glfw
)
