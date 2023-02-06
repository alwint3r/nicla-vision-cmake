function(include_local_library LIB_NAME)
    set(LIBRARY_DIR ${CMAKE_SOURCE_DIR}/lib)

    file(GLOB LIB_SRCS
        ${LIBRARY_DIR}/${LIB_NAME}/*.c
        ${LIBRARY_DIR}/${LIB_NAME}/*.cpp
        ${LIBRARY_DIR}/${LIB_NAME}/src/*.c
        ${LIBRARY_DIR}/${LIB_NAME}/src/**.c
        ${LIBRARY_DIR}/${LIB_NAME}/src/*.cpp
        ${LIBRARY_DIR}/${LIB_NAME}/src/**.cpp
    )

    add_library(${LIB_NAME} ${LIB_SRCS})

    target_compile_definitions(${LIB_NAME} PRIVATE ${ARDUINO_COMPILE_DEFINITIONS})

    target_compile_options(${LIB_NAME} PRIVATE
        $<$<COMPILE_LANGUAGE:C>:-std=gnu11>
        $<$<COMPILE_LANGUAGE:CXX>:-Wvla>
        $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
        $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++14>

        ${ARDUINO_COMPILE_OPTIONS}
    )

    # Include extra internal libraries from the optional
    # function argument
    foreach(EXTRA_LIB IN LISTS ARGN)
        set(EXTRA_LIBS "${EXTRA_LIBS}" ${LIBRARY_DIR}/${LIB_NAME}/${EXTRA_LIB} ${LIBRARY_DIR}/${LIB_NAME}/${EXTRA_LIB}/src)
    endforeach()
    
    set(ARDUINO_INCLUDE_DIRS
        "${ARDUINO_INCLUDE_DIRS}"
        ${LIBRARY_DIR}/${LIB_NAME}
        ${LIBRARY_DIR}/${LIB_NAME}/src

        PARENT_SCOPE
    )

    target_include_directories(${LIB_NAME} PRIVATE
        ${ARDUINO_INCLUDE_DIRS}
    )
endfunction()