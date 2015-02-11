# Our GTest (Google Test)

This page describes "our conventions" for use of GoogleTest (GTest) in our
workspace, and in our development practices.

## Our GTest Conventions

GTest usage tends to produce many executables (`*.exe` files on Windows) that
execute the tests and test-cases within that executable.  Parallelism in GTest is
performed through executing many `*.exe` test in-parallel.  Thus, GTest typically
relies upon "test-runners" to execute and aggregate the results of test execution.

Our tests are defined "at-the-closest-point-possible" to the code-under-test.
This implies that tests are defined (in decreasing order of preference):

1. With the library (e.g., //"unit-tests"//)
1. With the package (e.g., //"functional tests across libraries in the package"//)
1. With the workspace (e.g., //"functional tests across-packages")

## Names:  Files, Test Fixtures/Cases, Tests

### Name:  Source Code File (`*.cpp`) and Executable Program File

Convention specifies that a "gtest-source-code-file" (such as a `*.cpp`) will
result in a single compiled executable that runs the tests in that file (such
as a `*.exe` on MS-Windows).

Filenames for gtests conform to a "standard-convention" to enable better
"globbing/selection" of many test-executables by the "test-runner":

* `gt` -- indicates this uses "Google-Test" (GTest) technology
* `1` -- "Digit" for "execution-level", which implies "time" or "processing-effort"
required by the system to execute this test
  * `0` -- "Very light/fast" test (e.g., "Smoke-test" or "turn-on" test)
  * `1` -- "Light/fast" test
  * `2` -- "Medium-speed" test
  * `3` -- "Long-speed" or "expensive" test
  * ...
  * `9` -- "Exhaustive" or "Complete" or "Comprehensively-expensive" test
* Target/Category -- The "type" or "target" or "category" for the environment
or platform for this test to be executed.  Example:
  * `g` -- "Generic":  Test that has NO SYSTEM SIDE-EFFECTS
  * `f` -- "File-System":  Test that accesses the file-system (for read and/or write)
  * `e` -- "Emulator":  Test that requires running (hardware) emulators
  * `h` -- "Hardware":  Test that requires running hardware/devices (attached)

Example:
```
  gt1g_MyTest0_MyTestCases.cpp
  gt1g_MyTest0_MyTestCases.exe
               ^^^^^^^^^^^
               test-case-name
       ^^^^^^^
       test-name
     ^
     target
    ^
    level
  ^^
  gtest
```

### Name:  Test Fixtures, Test Cases, Test Names

Recall that `gtest` groups tests in a source-code file under a
"test-case" or "test-fixture".  Thus, the "test-case" is //more-generic//
than the "test", which is //more-specific//.

Further, the "test-case" may optionally be replaced by a user-defined
class called a "test-fixture".  Thus, the "test-case" and "test-fixture" 
are functionally similar, which is also why the naming conventions for
these are similar.

Thus, an example of test aggregation can be:

* //test-case0//
  * //test0//
  * //test1//
  * //test2//
* //test-case1//
  * //test0//
  * //test1//
* //test-fixture0//
  * //test0//
* //test-fixture1//
  * //test0//
  * //test1//

Note that consistent with `gtest` documentation, underscores `_` are not
permitted in names for test-fixtures, test-cases, and tests.

Recall that a "test-fixture" is implemented as a user-defined `class` (which
derives from `gtest`-specific classes to integrate into the `gtest` infrastructure).
Thus, the "test-fixture" has a naming-convention consistent with that for
a `class` (user-defined type).

Further, because "test-fixtures" and "test-cases" are functionally equivolent,
they have similar naming-conventions.

However, because `gtest` intends for the user to "glob" by "name" for 
test-fixtures, test-cases, and tests, we distinguish between "test-fixtures" 
and "test-cases".

The following prefixes are used:

* `Tc` -- indicates prefix for any "test-case"
* `Tf` -- indicates prefix for any "test-fixture"

Because the "test" is like a "function", it has naming conventions similar
to that for functions:

* `test` -- indicates prefix for any "test"

## Using GTest

### Writing An Executable Test

Our "gtest-use-convention" is established in our custom-header-file 
added at:  `/workspace/3rd/GTest/inc/MyGTest.hpp`

An example source-code-test is described in that file, and may look
similar to:

```
  // FILE: gt1g_MyTest0_MyTestCases.cpp
  //
  #include "CppFix.hpp"

  #include "MyGTest.hpp"

  //------------------------------------------------------------------------
  // Define our "main()"
  //------------------------------------------------------------------------
  MY_GTEST_MAIN_PROTOTYPE
  {
    MY_GTEST_MAIN_BODY;
  } // <==SET BREAKPOINT HERE
  //------------------------------------------------------------------------
  //------------------------------------------------------------------------

  //------------------------------------------------------------------------
  // TESTS (...from here to the rest of the file...)
  //------------------------------------------------------------------------

  // This test confirms integral values are equivolent.
  //
  TEST(TcMyTestCaseName, testNumsEqual0)
  {
    // We "expect" (42 == 42)
    EXPECT_EQ(42, 42);   // WILL PASS
    // We "expect" (2 == 3)
    EXPECT_EQ(2, 3);     // WILL FAIL
  }

  // This test confirms string values are equivolent.
  //
  TEST(TcMyTestCaseName, testStrsEqual0)
  {
    // We "expect" ("hello" == "hello")
    EXPECT_STREQ("hello", "hello");   // WILL PASS
    // We "expect" ("hello" == "goodbye")
    EXPECT_STREQ("hello", "goodbye"); // WILL FAIL
  }
```

More information on writing tests is documented in the header:
```
  /workspace/3rd/GTest/inc/MyGTest.hpp
```

### Placement Of Test-Source-Code In The Workspace

Workspace convention places "test-source-code" in a `/Unit/.` subdirectory
//as close to the source-code under test as possible.//

For example, the following locations tend to hold `gtest` tests:

```
  /workspace/MyPackage/MyLibrary/Unit/.
  /workspace/MyPackage/MyExecutable/Unit/.
  /workspace/MyPackage/Unit/.
  /workspace/FunctionalTests/Unit/.
```

### Building GTest Executable Tests

Building test-executables that use `gtest` requires the `INCLUDE_PATH` 
and `LIB_PATH` be updated to include the Google Test libraries.

For use in SWT, update the `Build.py` for compiling/linking test
executables:

```
# FILE: BUILD.py
...
# Add the GTest package:
mysets.addPackage('GTest')
# Add the GTest library:
mysets.AddLibrary('gtest')
...
# Create a "console-program" for each test executable:
package.ConsoleProgram(target   = 'gt1g_MyTest0_MyTestCases',
                       source   = ['gt1g_MyTest0_MyTestCases.cpp'],
                       header   = [ ],
                       settings = mysets,
                       public   = False)

package.ConsoleProgram(target   = 'gt2f_MyTest1_MyTestCases',
                       source   = ['gt2f_MyTest1_MyTestCases.cpp'],
                       header   = [ ],
                       settings = mysets,
                       public   = False)
```

### Running tests with SwT

To run all Google Tests using `SwT`, use the following command:
```
    swd test
```

From the workspace root directory, this will run tests in all packages;
from a package directory, it will only run tests in that package.

Use the `-h` flag to get a complete usage string for the test runner.

## Setup/Install of GTest

We download, build, and install GTest into `/workspace/3rd/.`  The current
version (as of June-2014) is `GTest 1.7.0`.

1. **Download Source:**Google Test (GTest) Project Home:  [[https://code.google.com/p/googletest/]]
  1.* **Unzip/Install:** To project workspace:
    1. `/workspace/3rd/GTest/.`
    1. `/workspace/3rd/GTest/inc/.`
    1. `/workspace/3rd/GTest/lib/.`
  1. **Build Settings:**
    1. We use the Microsoft MSVC `MD` library (Mutli-threaded DLL)
    1. Rename the `DEBUG` library target to append `_d` instead of the
      default which appends `d` (This is a simplification for our use of `SWT`,
      alternatively there are other work-arounds in the `Build.py` for unit tests.)
      1. `gtestd.lib` => `gtest_d.lib`
      1. `gtest_main-mdd.lib` => `gtest_main-md_d.lib`

### Resources

If you have trouble setting-up, compiling, or installing `gtest`, a web
search may help.  For example:
1. Using Google Test in Visual C++ 2012: [[http://asawicki.info/news_1561_using_google_test_in_visual_c_2012.html]]
1. (From GoogleTest FAQ), "I am building my project with Google Test in Visual Studio and all I'm getting is a bunch of linker errors (or warnings). Help!": [[https://code.google.com/p/googletest/wiki/FAQ#I_am_building_my_project_with_Google_Test_in_Visual_Studio_and_a]]

