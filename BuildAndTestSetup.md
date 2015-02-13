# Development Build And Test Setup

This document describes the installed software tools and configuration
setup for development on this project.

## See Also...

See also:
* [Our Development Workspace](OurDevelopmentWorkspace.md)

---
## Our Development Configuration

We use the following:

* `CMake` -- configuration management: build, test-runner, install-builder
* `GTest` -- C++ unit testing
* `make, ninja` -- back-end for _CMake-build_ operations
* `Jenkins` -- continuous integration web server
* `gcc` -- C++ compiler


---
## Install Tools

### Install:  CMake

`CMake` is a "makefile-generator" build tool that manages our
build configuration, and enables build-and-test through back-end
tools, such as for `make` or `ninja` (for build), and for
running tests (such as those built using the `gtest` library).

 * Version installed: 3.1.1
 * Prerequisite: package `libssl-dev`
 * Configure command:
   *  `./bootstrap --prefix=/opt/cmake/3.1.1 -- -DCMAKE_USE_OPENSSL=ON`
 * Added symlink: `ln -s /opt/cmake/3.1.1/bin/cmake /usr/local/bin/build`

### Install:  GTest

`GTest` is a C++ unit-testing library developed as open-source
sponsored by Google.

Setup instructions (run as `root`):
* Install `gtest` development package (by default installs to `/usr/src/gtest`):
```
  sudo apt-get install libgtest-dev
```
* Build and install:
```
  cd /usr/src/gtest
  sudo cmake CMakeLists.txt
  sudo make
```
* Symlink to `/usr/lib`:
```
  ln -s /usr/src/gtest/libgtest.a /usr/lib/libgtest.a
  ln -s /usr/src/gtest/libgtest_main.a /usr/lib/libgtest_main.a
```

**NOTE:** Setup instructions were taken from this procedure:

* [Getting Started with Google Test (GTest) On Ubuntu](http://www.thebigblob.com/getting-started-with-google-test-on-ubuntu/)

