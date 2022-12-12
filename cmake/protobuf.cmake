MACRO (MYSQL_USE_BUNDLED_PROTOBUF)
  INCLUDE(ExternalProject)
  ExternalProject_Add(protobuf
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/protobuf/cmake
    CMAKE_ARGS -DBUILD_TESTING=OFF
    # Disable the install step.
    INSTALL_COMMAND "")
  ExternalProject_Get_Property(protobuf BINARY_DIR)
  SET(PROTOBUF_FOUND TRUE)
  SET(PROTOBUF_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/protobuf/src/)
  SET(PROTOBUF_LIBRARY ${BINARY_DIR}/libprotobuf.a)
ENDMACRO()

MACRO (MYSQL_CHECK_PROTOBUF)
  IF(WITH_PROTOBUF STREQUAL "bundled")
    MYSQL_USE_BUNDLED_PROTOBUF()
  ELSE()
    INCLUDE(FindProtobuf)
    FIND_PACKAGE(Protobuf REQUIRED)
  ENDIF()
ENDMACRO()
