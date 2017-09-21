# PDFium Package Configuration for CMake
#
# To use PDFium in you CMake project:
#
#   1. set the environment variable PDFium_DIR to the folder containing this file.
#   2. in your CMakeLists.txt, add
#       find_package(PDFium)
#   3. then link you excecutable with PDFium
#       target_link_libraries(my_exe pdfium)

if(NOT MSVC)
  message(ERROR "Only Visual Studio is supported")
endif()

if(CMAKE_CL_64)
  set(PDFium_ARCH x64)
else()
  set(PDFium_ARCH x86)
endif()

if(NOT PDFium_FIND_QUIETLY)
  message(STATUS "PDFium ARCH: ${PDFium_ARCH}")
endif()

set(PDFium_BIN_PATH "${CMAKE_CURRENT_LIST_DIR}/${PDFium_ARCH}/bin")
set(PDFium_LIB_PATH "${CMAKE_CURRENT_LIST_DIR}/${PDFium_ARCH}/lib")
set(PDFium_INCLUDE_PATH "${CMAKE_CURRENT_LIST_DIR}/include")

add_library(pdfium SHARED IMPORTED)
set_target_properties(pdfium
  PROPERTIES
  IMPORTED_LOCATION             "${PDFium_BIN_PATH}/pdfium.dll"
  IMPORTED_IMPLIB               "${PDFium_LIB_PATH}/pdfium.dll.lib"
  INTERFACE_INCLUDE_DIRECTORIES "${PDFium_INCLUDE_PATH}"
)

file(TO_NATIVE_PATH "${PDFium_BIN_PATH}" PDFium_BIN_PATH)
file(TO_NATIVE_PATH "${PDFium_LIB_PATH}" PDFium_LIB_PATH)

if(NOT PDFium_FIND_QUIETLY)
  message(STATUS "Found PDFium in ${PDFium_LIB_PATH}")
  message(STATUS "You may need to add ${PDFium_BIN_PATH} to the PATH.")
endif()