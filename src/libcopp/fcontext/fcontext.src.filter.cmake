# =========== libcopp/src - fcontext =========== 
set (PROJECT_LIBCOPP_FCONTEXT_SRC_DIR "${CMAKE_CURRENT_LIST_DIR}")
set (PROJECT_LIBCOPP_FCONTEXT_ASM_DIR "${PROJECT_LIBCOPP_FCONTEXT_SRC_DIR}/asm")

set (PROJECT_LIBCOPP_FCONTEXT_BIN_DIR "${PROJECT_BINARY_DIR}/src/libcopp/fcontext")

if (LIBCOPP_FCONTEXT_USE_TSX)
	EchoWithColor(COLOR GREEN "-- enable Intel Transactional Synchronisation Extensions (TSX).")
	set(LIBCOPP_FCONTEXT_USE_TSX 1)
endif()

# ========== set platform, abi, binary format and as tool ==========
include("${PROJECT_LIBCOPP_FCONTEXT_SRC_DIR}/detect/fcontext.detect.cmake")
set (PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE "fcontext_make.${LIBCOPP_FCONTEXT_AS_OUTPUT_SUFFIX}")
set (PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP "fcontext_jump.${LIBCOPP_FCONTEXT_AS_OUTPUT_SUFFIX}")
set (PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP "fcontext_ontop.${LIBCOPP_FCONTEXT_AS_OUTPUT_SUFFIX}")

# ========== tools check ==========
set (PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_MAKE "make_${LIBCOPP_FCONTEXT_OS_PLATFORM}_${LIBCOPP_FCONTEXT_ABI}_${LIBCOPP_FCONTEXT_BIN_FORMAT}_${LIBCOPP_FCONTEXT_AS_TOOL}")
set (PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_JUMP "jump_${LIBCOPP_FCONTEXT_OS_PLATFORM}_${LIBCOPP_FCONTEXT_ABI}_${LIBCOPP_FCONTEXT_BIN_FORMAT}_${LIBCOPP_FCONTEXT_AS_TOOL}")
set (PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_ONTOP "ontop_${LIBCOPP_FCONTEXT_OS_PLATFORM}_${LIBCOPP_FCONTEXT_ABI}_${LIBCOPP_FCONTEXT_BIN_FORMAT}_${LIBCOPP_FCONTEXT_AS_TOOL}")

include("${PROJECT_LIBCOPP_FCONTEXT_SRC_DIR}/tools/${LIBCOPP_FCONTEXT_AS_TOOL}.cmake")

# ========== show fcontext info ==========
EchoWithColor(COLOR GREEN "-- fcontext.os_platform => ${LIBCOPP_FCONTEXT_OS_PLATFORM}")
EchoWithColor(COLOR GREEN "-- fcontext.abi => ${LIBCOPP_FCONTEXT_ABI}")
EchoWithColor(COLOR GREEN "-- fcontext.bin_formation => ${LIBCOPP_FCONTEXT_BIN_FORMAT}")
EchoWithColor(COLOR GREEN "-- fcontext.as_tool => ${LIBCOPP_FCONTEXT_AS_TOOL}")
EchoWithColor(COLOR GREEN "-- fcontext.as_action => ${LIBCOPP_FCONTEXT_AS_ACTION}")
EchoWithColor(COLOR GREEN "-- fcontext.use_tsx => ${LIBCOPP_FCONTEXT_USE_TSX}")

# ========== msvc x86 disable safeseh ==========
if (MSVC AND "${LIBCOPP_FCONTEXT_OS_PLATFORM}" STREQUAL "i386")
	set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SAFESEH:NO")
	set (CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /SAFESEH:NO")
	set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} /SAFESEH:NO")
endif()
