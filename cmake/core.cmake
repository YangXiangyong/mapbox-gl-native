# Modify cmake/core-files.txt to change the source files for this target.
load_sources_list(MBGL_CORE_FILES cmake/core-files.txt)
add_library(mbgl-core STATIC ${MBGL_CORE_FILES})

target_include_directories(mbgl-core
    PUBLIC include
    PRIVATE src
)

target_link_libraries(mbgl-core PRIVATE
    earcut.hpp
    expected
    geojson-vt-cpp
    icu
    kdbush.hpp
    polylabel
    protozero
    shelf-pack-cpp
    supercluster.hpp
    unique_resource
    vector-tile
    wagyu
)

target_link_libraries(mbgl-core PUBLIC
    geometry.hpp
    variant
    rapidjson
    geojson.hpp
)

target_add_mason_package(mbgl-core PRIVATE boost)

mbgl_platform_core()

create_source_groups(mbgl-core)

set_target_properties(mbgl-core PROPERTIES FOLDER "Core")

xcode_create_scheme(TARGET mbgl-core)

initialize_xcode_cxx_build_settings(mbgl-core)
