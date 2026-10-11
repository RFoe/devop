set (VCPKG_TARGET_ARCHITECTURE x64)
set (VCPKG_CRT_LINKAGE dynamic)
set (VCPKG_LIBRARY_LINKAGE static)

set (VCPKG_CMAKE_SYSTEM_NAME Linux)

set (VCPKG_BUILD_TYPE release)

set (VCPKG_PLATFORM_TOOLSET clang)
set (
    VCPKG_CMAKE_CONFIGURE_OPTIONS
    -DCMAKE_C_COMPILER=/usr/bin/clang
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++
    -DCMAKE_CXX_STANDARD=26
    # -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -stdlib=libc++
    # -Wno-deprecated-declarations"
)

set (VCPKG_CXX_FLAGS "-stdlib=libc++ -std=c++26 -Wno-deprecated-declarations")
set (VCPKG_C_FLAGS "-stdlib=libc++")
set (VCPKG_CMAKE_C_FLAGS "${VCPKG_C_FLAGS}")
set (VCPKG_CMAKE_CXX_FLAGS "${VCPKG_CXX_FLAGS}")
set (VCPKG_LINKER_FLAGS "-stdlib=libc++ -lc++abi")
