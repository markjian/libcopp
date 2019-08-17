# =========== libcopp/src - fcontext : ${LIBCOPP_FCONTEXT_OS_PLATFORM} - sysv - ${LIBCOPP_FCONTEXT_BIN_FORMAT} - ${LIBCOPP_FCONTEXT_AS_TOOL} ===========
file(MAKE_DIRECTORY "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}")

find_program(LIBCOPP_FCONTEXT_AS_TOOL_BIN as)
if(NOT LIBCOPP_FCONTEXT_AS_TOOL_BIN)
    EchoWithColor(COLOR RED "-- as not found in path, please add as's directory into path")
    message(FATAL_ERROR "as not found")
endif()

find_program(LIBCOPP_FCONTEXT_AS_TOOL_BINC ${CMAKE_CXX_COMPILER})
if(NOT LIBCOPP_FCONTEXT_AS_TOOL_BIN)
    EchoWithColor(COLOR RED "-- cxx compiler not found in path, please add cxx compiler's directory into path")
    message(FATAL_ERROR "cxx compiler not found")
endif()

if (WIN32 OR WINCE OR WINDOWS_PHONE OR WINDOWS_STORE OR MINGW OR CYGWIN)
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_MAKE}.asm")
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_JUMP}.asm")
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_ONTOP}.asm")
else()
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_MAKE}.S")
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_JUMP}.S")
    set(PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP "${PROJECT_LIBCOPP_FCONTEXT_SRC_NAME_ONTOP}.S")
endif()

if(LIBCOPP_FCONTEXT_AS_ACTION)
    set(LIBCOPP_FCONTEXT_AS_ACTION "--${LIBCOPP_FCONTEXT_AS_ACTION}")
endif()

unset (LIBCOPP_FCONTEXT_AS_TOOL_OPTION)
if (LIBCOPP_FCONTEXT_USE_TSX)
    list (APPEND LIBCOPP_FCONTEXT_AS_TOOL_OPTION "-DCOPP_FCONTEXT_USE_TSX=1")
endif()

add_custom_command(
    OUTPUT "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
    # COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
    DEPENDS "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE}"
    WORKING_DIRECTORY ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}
    COMMENT "${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp ${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE} -o ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
)

execute_process (
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_MAKE}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
#    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
    WORKING_DIRECTORY "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}"
)

add_custom_command(
    OUTPUT "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
    # COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
    DEPENDS "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP}"
    WORKING_DIRECTORY ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}
    COMMENT "${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp ${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP} -o ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
)

execute_process (
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_JUMP}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
#    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}"
    WORKING_DIRECTORY "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}"
)

add_custom_command(
    OUTPUT "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
    # COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
    DEPENDS "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP}"
    WORKING_DIRECTORY ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}
    COMMENT "${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp ${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP} -o ${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
)

execute_process (
    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BINC} ${LIBCOPP_FCONTEXT_AS_TOOL_OPTION} -c -x assembler-with-cpp "${PROJECT_LIBCOPP_FCONTEXT_ASM_DIR}/${PROJECT_LIBCOPP_FCONTEXT_SRC_FILE_ONTOP}" -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
#    COMMAND ${LIBCOPP_FCONTEXT_AS_TOOL_BIN} ${LIBCOPP_FCONTEXT_AS_ACTION} -o "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
    WORKING_DIRECTORY "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}"
)

list(APPEND COPP_SRC_LIST 
    "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_JUMP}" 
    "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_MAKE}"
    "${PROJECT_LIBCOPP_FCONTEXT_BIN_DIR}/${PROJECT_LIBCOPP_FCONTEXT_BIN_NAME_ONTOP}"
)
