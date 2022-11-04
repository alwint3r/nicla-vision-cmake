function(include_wifi)
    set(LIBRARY_DIR ${ARDUINO_CORE_DIR}/libraries)

    file(GLOB ARDUINO_LIB_WIFI_SRCS ${LIBRARY_DIR}/WiFi/src/*.cpp ${LIBRARY_DIR}/WiFi/src/**.cpp)

    add_library(WiFi
        ${ARDUINO_LIB_WIFI_SRCS}
    )

    target_compile_definitions(WiFi PRIVATE
        ${ARDUINO_COMPILE_DEFINITIONS}
    )

    target_compile_options(WiFi PRIVATE
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

    target_include_directories(WiFi PRIVATE
        ${ARDUINO_INCLUDE_DIRS}
    )

    target_link_libraries(WiFi SocketWrapper)
endfunction()