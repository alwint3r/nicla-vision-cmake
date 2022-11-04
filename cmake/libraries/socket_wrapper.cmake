function(include_socket_wrapper)
    set(LIBRARY_DIR ${ARDUINO_CORE_DIR}/libraries)

    file(GLOB ARDUINO_LIB_SOCKETWRAPPER_SRCS ${LIBRARY_DIR}/SocketWrapper/src/*.cpp ${LIBRARY_DIR}/SocketWrapper/src/**.cpp)

    add_library(SocketWrapper
        ${ARDUINO_LIB_SOCKETWRAPPER_SRCS}
    )

    target_compile_definitions(SocketWrapper PRIVATE
        ${ARDUINO_COMPILE_DEFINITIONS}
    )

    target_compile_options(SocketWrapper PRIVATE
        $<$<COMPILE_LANGUAGE:C>:-std=gnu11>
        $<$<COMPILE_LANGUAGE:CXX>:-Wvla>
        $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
        $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++14>

        ${ARDUINO_COMPILE_OPTIONS}
    )

    set(ARDUINO_INCLUDE_DIRS
        "${ARDUINO_INCLUDE_DIRS}"
        ${LIBRARY_DIR}/WiFi/src
        ${LIBRARY_DIR}/SocketWrapper/src
        PARENT_SCOPE
    )

    target_include_directories(SocketWrapper PRIVATE
        ${ARDUINO_INCLUDE_DIRS}
    )
endfunction()