cmake_minimum_required(VERSION 3.5)
# set the project name and version
project(chicken VERSION 1.0.1)

# 设置指定目录
set(CMAKE_INSTALL_PREFIX ../demo)

# 设置源代码文件
set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)

# 设置 rpath 参数
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
if(APPLE)
    set(CMAKE_INSTALL_RPATH "@executable_path/../lib")
elseif(UNIX)
    set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")
endif()

# 设置头文件目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library(${PROJECT_NAME}_lib SHARED ${CMAKE_CURRENT_SOURCE_DIR}/src/chick.cpp)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib)
add_executable(${PROJECT_NAME} ${SOURCES})
target_link_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib)
target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}_lib)


install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
install(TARGETS ${PROJECT_NAME}_lib DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION
  ${CMAKE_INSTALL_PREFIX}/include)

find_package(Doxygen)
if(DOXYGEN_FOUND)
    set(DOXYGEN_INPUT ${CMAKE_CURRENT_SOURCE_DIR})
    set(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/docs)
    add_custom_target(docs ALL
    	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_INPUT}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM
    )
endif()

