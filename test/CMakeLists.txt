add_executable(build_release_test)

target_sources(build_release_test
    PRIVATE
        test.cc
)

target_link_libraries(build_release_test
    PUBLIC
    Catch2::Catch2WithMain
)

if (PRESET_IN_USE)
    target_compile_definitions(build_release_test PRIVATE PRESETS_IN_USE)
endif()

add_test(
    NAME build_and_release_test
    COMMAND build_release_test
)
