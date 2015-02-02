#CMake setup

 * Version installed: 3.1.1
 * Prerequisite: package `libssl-dev`
 * Configure command:
   *  `./bootstrap --prefix=/opt/cmake/3.1.1 -- -DCMAKE_USE_OPENSSL=ON`
 * Added symlink: `ln -s /opt/cmake/3.1.1/bin/cmake /usr/local/bin/build`
