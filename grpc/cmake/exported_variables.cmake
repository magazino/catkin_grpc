find_program(FIND find)
if(NOT FIND)
  message(SEND_ERROR "Cannot find find.")
endif(NOT FIND)

set(GRPC_BIN_DIR ${grpc_PREFIX}/${CATKIN_GLOBAL_LIBEXEC_DESTINATION}/grpc)

unset(PROTOBUF_PROTOC_EXECUTABLE CACHE)
find_program(PROTOBUF_PROTOC_EXECUTABLE protoc
             PATHS ${GRPC_BIN_DIR}/protobuf NO_DEFAULT_PATH)
message(STATUS "Found protoc at: ${PROTOBUF_PROTOC_EXECUTABLE}")

unset(GRPC_CPP_PLUGIN CACHE)
find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin
             PATHS ${GRPC_BIN_DIR} NO_DEFAULT_PATH)
message(STATUS "Found grpc_cpp_plugin at: ${GRPC_CPP_PLUGIN}")

unset(GRPC_PYTHON_PLUGIN CACHE)
find_program(GRPC_PYTHON_PLUGIN grpc_python_plugin
             PATHS ${GRPC_BIN_DIR} NO_DEFAULT_PATH)
message(STATUS "Found grpc_python_plugin at: ${GRPC_PYTHON_PLUGIN}")

set(GRPC_LIB_DIR ${grpc_PREFIX}/${CATKIN_GLOBAL_LIB_DESTINATION})
find_library(
    LIBPROTOBUF libprotobuf.a PATHS ${GRPC_LIB_DIR}/protobuf NO_DEFAULT_PATH)
find_library(LIBZ z PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)

set(ALL_PROTOBUF_LIBS ${LIBPROTOBUF} ${LIBZ})
message(STATUS "Found protobuf libraries: ${ALL_PROTOBUF_LIBS}")

find_library(LIBARES ares PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBBORINGSSL boringssl PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGPR gpr PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPC grpc PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP grpc++ PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPC_CRONET grpc_cronet PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP_CORE_STATS grpc++_core_stats
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP_CRONET grpc++_cronet
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP_ERROR_DETAILS grpc++_error_details
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPC_PLUGIN_SUPPORT grpc_plugin_support
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP_REFLECTION grpc++_reflection
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPC_UNSECURE grpc_unsecure
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)
find_library(LIBGRPCPP_UNSECURE grpc++_unsecure
             PATHS ${GRPC_LIB_DIR} NO_DEFAULT_PATH)

set(ALL_GRPC_LIBS ${LIBARES} ${LIBBORINGSSL} ${LIBGPR} ${LIBGRPC} ${LIBGRPCPP}
    ${LIBGRPC_CRONET} ${LIBGRPCPP_CRONET} ${LIBGRPCPP_CORE_STATS}
    ${LIBGRPCPP_ERROR_DETAILS} ${LIBGRPC_PLUGIN_SUPPORT} ${LIBGRPCPP_REFLECTION}
    ${LIBGRPC_UNSECURE} ${LIBGRPCPP_UNSECURE})
message(STATUS "Found grpc libraries: ${ALL_GRPC_LIBS}")

set(GRPC_INCLUDE_DIR
    ${grpc_PREFIX}/${CATKIN_GLOBAL_INCLUDE_DESTINATION}/grpc)
include_directories(BEFORE ${GRPC_INCLUDE_DIR})
