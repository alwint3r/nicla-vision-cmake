
file(GLOB ARDUINO_BLE_SRCS src/*.cpp src/**/*.cpp)

add_library(ArduinoBLE ${ARDUINO_BLE_SRCS})

target_compile_definitions(ArduinoBLE PRIVATE ${ARDUINO_COMPILE_DEFINITIONS})

target_compile_options(ArduinoBLE PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-std=gnu11>
    $<$<COMPILE_LANGUAGE:CXX>:-Wvla>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++14>

    ${ARDUINO_COMPILE_OPTIONS}
)

set(ARDUINO_INCLUDE_DIRS
    "${ARDUINO_INCLUDE_DIRS}"
    ${CMAKE_CURRENT_LIST_DIR}/src
    PARENT_SCOPE
)

target_include_directories(ArduinoBLE PRIVATE
    ${ARDUINO_INCLUDE_DIRS}
    ${CMAKE_CURRENT_LIST_DIR}/src
)

