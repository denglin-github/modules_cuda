cmake_minimum_required (VERSION 3.15 FATAL_ERROR)

set(CMAKE_BUILD_TYPE Release)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/..)
find_package(CUDA REQUIRED)

list(APPEND CUDA_NVCC_FLAGS "--cuda-gpu-arch=dlgput64")

cuda_add_executable(hello hello.cu)
cuda_add_executable(sumArraysOnGPU-timer sumArraysOnGPU-timer.cu)
cuda_add_executable(cublas cublas.cu)
target_link_libraries(cublas ${CUDA_CUBLAS_LIBRARIES})
