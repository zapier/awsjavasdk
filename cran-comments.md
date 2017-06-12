## awsjavasdk 0.2.1 Release

## Usability Change

Following the pattern of package:AWR, awsjavasdk now takes installation of the package as implicit permission to download and install the AWS Java SDK required for the package to operate.  As with AWR this approach is taken because the AWS Java SDK is too large and changes too frequently to include on CRAN.

## Test environments
* local OS X install
 * R 3.3.2
* travis-ci
 * Platform: x86_64-pc-linux-gnu (64-bit) / Ubuntu precise (12.04.5 LTS)
 * R version 3.3.1 (2016-06-21)
 * and R version 3.3.2 (2016-10-31)
 * and R version 3.2.5 (2016-04-14)
 * and R Under development (unstable) (2016-12-23 r71840)
* win-builder
 * R version 3.3.2 (2016-10-31)
 * R Under development (unstable) (2016-12-23 r71840)

## R CMD check results
R CMD check results
0 errors | 0 warnings | 1 notes

## Downstream dependencies
There are no downstream dependencies at this time.
