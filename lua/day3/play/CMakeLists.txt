cmake_minimum_required (VERSION 3.10)
project (play)
add_executable (play play.cpp)

include_directories(/opt/homebrew/include/rtmidi)
find_library(RTMIDI rtmidi REQUIRED)
find_package(Lua REQUIRED)

target_link_libraries (play ${LUA_LIBRARIES} ${RTMIDI})
target_include_directories(play PRIVATE ${LUA_INCLUDE_DIR} ${RTMIDI_INCLUDE_DIR})

target_compile_features(play PUBLIC cxx_std_11)
