# Development Build And Test Setup

##CMake setup

`CMake` is a "makefile-generator" build tool that manages our
build configuration, and enables build-and-test through back-end
tools, such as for `make` or `ninja` (for build), and for
running tests (such as those built using the `gtest` library).

 * Version installed: 3.1.1
 * Prerequisite: package `libssl-dev`
 * Configure command:
   *  `./bootstrap --prefix=/opt/cmake/3.1.1 -- -DCMAKE_USE_OPENSSL=ON`
 * Added symlink: `ln -s /opt/cmake/3.1.1/bin/cmake /usr/local/bin/build`

## GTest setup

`GTest` is a C++ unit-testing library developed as open-source model
sponsored by Google.

Setup instructions followed this:

* [getting-started-with-google-test-on-ubuntu](http://www.thebigblob.com/getting-started-with-google-test-on-ubuntu/)
