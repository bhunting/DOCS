# Our Test Protocols

This page describes "our conventions" to document test protocols (both
automated and manual).

## What Are Tests?

Consider the following:

1. Tests may be automated (preferred) or manual (if necessary).
1. Tests are implicitly "requirements" (at the SR or SSR level).
1. Tests may be in support of:
  1. Unit testing
  1. Component testing
  1. Functional testing
  1. Verification testing (internal)
  1. Verification testing (in support of SSRs)
  1. Validation testing (in support of UNs, DIs, and SRs)

## Documenting Test Protocols

Test protocols in support of internal testing, verification testing, and
validation testing may be performed through automated or manual tests.
Documenting the test protocol consists of:

1. Document the protocol within individual tests.
1. Document the protocol across all tests in support of a "requirement"
   or "feature".
1. Document the protocol across all tests in a given "release".

Our tests are documented at the most-specific level (individual test),
and "tagged" with zero-or-more "feature/requirement-tags" for automated
report generation that aggregates all tests associated with a 
requirement/feature or release.

### Test Protocols In GTest Header-Blocks

As our preferred automated test mechanism is to use `gtest`, and
each implemented automated test has a "header-comment-block" above
the test, a script can recursively descend our development
workspace, parse all `gtest` files, extract the commented header-blocks
that define the test protocols, and generate reports that aggregate all
test protocols by feature/requirement.

Thus, test protocol documentation is efficiently maintained where the test
logic itself is maintained, and reports are guaranteed to aggregate all
test protocols associated with a feature or release.

Because of our convention to auto-generate the complete test protocol
report from automated protocol extraction from all `gtest` instances
that are tagged for a feature/requirement, convention extends this
practice to similarly document all manual tests in a `gtest`
commented header block, where the "test body" is empty (because the test
is intended to be executed manually).  In the future, some manual tests
may eventually be converted to manual tests with some level of protocol
modification.

### Example Test Protocol Documentation

Note that all tests are expected to be derived from our convention for
test fixtures.  Further, tests are aggregated between "automated" tests
where execution actually performs the test, and "manual" tests where
the `gtest` actually represents test instructions that are to be
manually executed.

This aggregation separation between manual and automated tests are
made through use of the test fixture, either `TfMyGTest` or 
`TfMyGTestManual`.

An example `gtest` documented header block for an automated test
(using Doxygen code block comment conventions, and our convention for 
the {{{\featureref}}} tag, and which derives from our `TfMyGTest`
test fixture:

```
#include "CppFix.hpp"

#include "TfMyGTest.hpp"

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
// Define our "test(s)"
//------------------------------------------------------------------------

/// TEST that MyNewFeature defaults to established values.
///
///   1. Create MyObject that implements MyNewFeature.
///   2. VERIFY MyObject is in "valid" state.
///   3. Interrogate values established through default
///      construction:
///        * VERIFY property-A
///        * VERIFY property-B
///        * VERIFY property-C
///
/// Supports testing for the following features:
/// - \featureref feature_6-2-7_MyNewFeature_1
/// - \featureref feature_6-2-8_MyOtherFeature_1
TEST_F(TfMyGTest, testMyNewFeature1)
{
  // ...insert automated-test code here...
  EXPECT_TRUE(true);
}
```

An similar example `gtest` documented header block for a manual test
(using Doxygen code block comment conventions, and our convention for 
the `\featureref` tag, and which derives from our `TfMyGTestManual`
test fixture:

```
#include "CppFix.hpp"

#include "TfMyGTestManual.hpp"

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
// Define our "test(s)"
//------------------------------------------------------------------------

/// TEST that MyNewFeature works in GUI.
///
///   1. Start instrument, go to CytoPanel=>SomeScreen.
///   2. VERIFY MyNewFeature button is present.
///   3. Press MyNewFeature button.
///   4. VERIFY the blizzle toggled the fiddlebop.
///
/// Supports testing for the following features:
/// - \featureref feature_6-2-7_MyNewFeature_1
TEST_F(TfMyGTestManual, testMyNewFeature2)
{
  // ...do nothing (is manual test instructions)
  EXPECT_TRUE(true);
}
```

## Glossary

* `DI`  - Design Inputs
* `SR`  - System Requirements
* `SSR` - (Software) Sub-System Requirement
* `UN`  - User Needs



