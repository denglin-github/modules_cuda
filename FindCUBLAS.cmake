# Find the CUBLAS libraries
#
# The following variables are optionally searched for defaults
#  CUBLAS_ROOT: Base directory where CUBLAS is found
#  CUBLAS_INCLUDE_DIR: Directory where CUBLAS header is searched for
#  CUBLAS_LIBRARY: Directory where CUBLAS library is searched for
#  CUBLAS_STATIC: Are we looking for a static library? (default: no)
#
# The following are set after configuration is done:
#  CUBLAS_FOUND
#  CUBLAS_INCLUDE_PATH
#  CUBLAS_LIBRARY_PATH
#

include(FindPackageHandleStandardArgs)

set(CUBLAS_ROOT $ENV{CUBLAS_ROOT_DIR} CACHE PATH "Folder containing NVIDIA cuBLAS")
list(APPEND CUBLAS_ROOT $ENV{CUBLAS_ROOT_DIR} ${CUDA_TOOLKIT_ROOT_DIR})

list(APPEND CMAKE_PREFIX_PATH ${CUBLAS_ROOT})

set(CUBLAS_INCLUDE_DIR $ENV{CUBLAS_INCLUDE_DIR} CACHE PATH "Folder containing NVIDIA cuBLAS header files")

find_path(CUBLAS_INCLUDE_PATH cublas_v2.h
  HINTS ${CUBLAS_INCLUDE_DIR}
  PATH_SUFFIXES cuda/include cuda include)

option(CUBLAS_STATIC "Look for static CUBLAS" OFF)
if (CUBLAS_STATIC)
  set(CUBLAS_LIBNAME "libcublas_static.a")
else()
  set(CUBLAS_LIBNAME "cublas")
endif()

set(CUBLAS_LIBRARY $ENV{CUBLAS_LIBRARY} CACHE PATH "Path to the cublas library file (e.g., libcublas.so)")
if (CUBLAS_LIBRARY MATCHES ".*cublas_static.a" AND NOT CUBLAS_STATIC)
  message(WARNING "CUBLAS_LIBRARY points to a static library (${CUBLAS_LIBRARY}) but CUBLAS_STATIC is OFF.")
endif()

find_library(CUBLAS_LIBRARY_PATH ${CUBLAS_LIBNAME}
  PATHS ${CUBLAS_LIBRARY}
  PATH_SUFFIXES lib lib64 cuda/lib cuda/lib64 lib/x64)

find_package_handle_standard_args(CUBLAS DEFAULT_MSG CUBLAS_LIBRARY_PATH CUBLAS_INCLUDE_PATH)

mark_as_advanced(CUBLAS_ROOT CUBLAS_INCLUDE_DIR CUBLAS_LIBRARY)
