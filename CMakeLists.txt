#makefile by 蒙哥
cmake_minimum_required(VERSION 3.10)
set(CMAKE_SYSTEM_NAME Linux)
if(ARM_ABI STREQUAL "armv8")
    set(CMAKE_SYSTEM_PROCESSOR aarch64)
    set(CMAKE_C_COMPILER "aarch64-linux-gnu-gcc")
    set(CMAKE_CXX_COMPILER "aarch64-linux-gnu-g++")
elseif(ARM_ABI STREQUAL "armv7hf")
    message(FATAL_ERROR "Unknown arch abi ${ARM_ABI}, only support armv8 ")
    return()
    set(CMAKE_SYSTEM_PROCESSOR arm)
    set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
    set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")
else()
    message(FATAL_ERROR "Unknown arch abi ${ARM_ABI}, only support armv8 ")
    return()
endif()

project(postdemo)
message(STATUS "TARGET ARCH ABI: ${ARM_ABI}")
message(STATUS "PADDLE LITE DIR: ${PADDLE_LITE_DIR}")

include_directories(${PADDLE_LITE_DIR}/include)
link_directories(${PADDLE_LITE_DIR}/libs/${ARM_ABI})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
if(ARM_ABI STREQUAL "armv8")
    set(CMAKE_CXX_FLAGS "-march=armv8-a ${CMAKE_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "-march=armv8-a ${CMAKE_C_FLAGS}")
elseif(ARM_ABI STREQUAL "armv7hf")
    set(CMAKE_CXX_FLAGS "-march=armv7-a -mfloat-abi=hard -mfpu=neon-vfpv4 ${CMAKE_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "-march=armv7-a -mfloat-abi=hard -mfpu=neon-vfpv4 ${CMAKE_C_FLAGS}" )
endif()
#find_package(httplib)


set (CMAKE_CXX_STANDARD 11)


#include_directories(${PADDLE_LITE_DIR}/libs/include)
include (GNUInstallDirs)
list(APPEND CMAKE_PREFIX_PATH ${PADDLE_LITE_DIR})
list(APPEND CMAKE_PREFIX_PATH ../)



#find_package(httplib::httplib)
#INCLUDE_DIRECTORIES(${ZXing_INCLUDE_DIR})


link_directories(${PADDLE_LITE_DIR})

add_executable(postdemo postdemo.cc)
#target_link_libraries(postdemo httplib::httplib)

#TARGET_LINK_LIBRARIES(postdemo libhttplib.so)
#target_link_libraries (postdemo httplib)


