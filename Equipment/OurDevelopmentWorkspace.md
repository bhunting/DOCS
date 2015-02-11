# Our Workspace

Development for the AUC project is performed principally on a Debian/Linux
operating system, with deployment to an Atom/x86 single-board computer (SCB)
and BeagleBone Black computers (also running Debian/Linux).

---
## Our Workspace Organization

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

## See Also...

See also:
* [Build And Test Setup](BuildAndTestSetup.md)

