## awsjavasdk 0.2.2 Release

This release extends the timeout to download the SDK (and makes the timeout user configurable).  I also add some warnings that the package isn't being actively used and suggest to interactive users of the package a couple other packages they might want to switch to.  This submission is late, so awsjavasdk is currently removed/archived. 

Some systems report that there are possibly mis-spelled words in DESCRIPTION:
  APIs (12:37)
  AWS (12:51)
  DynamoDB (13:28)
  SDK (3:69, 10:64, 11:49)
... but I affirm that these are all correct.

## Test environments
* travis-ci
 * Platform: x86_64-pc-linux-gnu (64-bit) / Ubuntu Xenial (16.04.6 LTS)
 * R version 4.0.2 (2020-06-22)
 * and R version 3.6.3 (2020-02-29)
 * and R Under development (unstable) (2020-10-29 r79387)
* rhub
 * Ubuntu Linux 16.04 LTS, R-devel, GCC
 * Ubuntu Linux 16.04 LTS, R-release, GCC
 x Windows, could not check, lacks rJava
* win-builder
 x R version 3.6.3 (2020-02-29); could not check, lacks rJava
 * R version 4.0.3 (2020-10-10)
* local OS X Install
 * R 4.0.2 (2020-06-22)
 
## R CMD check results
R CMD check results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

## Downstream dependencies
There are no downstream dependencies at this time.
