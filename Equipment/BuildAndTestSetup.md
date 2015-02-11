# Development Build And Test Setup

---
## Our Development Configuration

We use the following:

* `CMake` -- configuration management: build, test-runner, install-builder
* `GTest` -- C++ unit testing
* `make, ninja` -- back-end for _CMake-build_ operations
* `Jenkins` -- continuous integration web server
* `gcc` -- C++ compiler

---
# Our Workspace Organization

Workspace hierarchy is:

```
   /AUC/Durango/                              <== Our ".git" root-dir
                .git/                         <== ".git" repository for 
                CMakelists.txt                <== ROOT `cmake` file
                AucGui/                       <== (module)
                               CMakeLists.txt <== module `cmake` file
                Common/                       <== (module)
                               CMakeLists.txt <== module `cmake` file
                ControllerHub/                <== (module)
                               CMakeLists.txt <== module `cmake` file
                OurGit/                       <== (module)
                               CMakeLists.txt <== module `cmake` file
                ScienceModules/               <== (module)
                               CMakeLists.txt <== module `cmake` file
        dist/.                                <== "peer" for "distribution" products
        obj/.                                 <== "obj" intermediate build products
```
Also note:
```
  /usr/src/gtest/.                            <== where `gtest` installed
  /usr/lib                                    <== where `libgtest.a`, `libgtest_main.a` linked
  /opt/cmake/3.1.1/bin/.                      <== where `cmake` installed
  /opt/gcc/4.8.3/bin/.                        <== where `gcc` installed
  /opt/gcc/4.9.2/bin/.                        <== where `gcc` installed
  /opt/gcc-arm/.../bin/.                      <== where `gcc-arm` installed
  /opt/jenkins/jenkins.1.597.war              <== where `jenkins` installed
  /opt/jre/jre1.7.0_76/bin/.                  <== where `jre` installed
  /opt/ninja/1.5.3/.                          <== where `ninja` installed
  /opt/Qt5.4.0/.                              <== where `qt5` installed
```


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

