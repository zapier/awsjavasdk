## awsjavasdk 0.2.0 Release

## Resubmission 2

In response to Kurt Hornik's comments:

> We get
> 
> Possibly mis-spelled words in DESCRIPTION:
>   AWS (3:36, 9:80)
>   rJava (9:105)
> 
> Pls fix: put these into single quotes, I guess.
> 
> Also, can you pls use the Description to explain 'AWS Java SDK' in more
> detail?  Perhaps give a web pointer, written as <http://....>?

I have updated the description.  

I now define AWS and SDK and place the abreviations in parens (because I anticipate people will frequently search for the abreviations).  I have enclosed rJava and AWS in single quotes as requested.  I have added the following expository text to the description:

> According to Amazon, the 'SDK helps take the complexity out of coding by providing Java APIs for many AWS services including Amazon S3, Amazon EC2, DynamoDB, and more'.  You can read more about the included Java code on Amazon's website <https://aws.amazon.com/sdk-for-java/>.

## Resubmission

In response to Uwe Ligges' comments:

1. Previously all tests were skipped on CRAN because I defaulted to installing to a non-temp directory.  Unless given explicit permission, I decided not to foist my default non-standard location on the CRAN test environment.  However, be aware that a) tests on those code paths are running using [Travis CI](https://travis-ci.com/zapier/awsjavasdk/pull_requests) and b) there are now tests that can run on CRAN (because they are storing files in the tempdir).

2. 

> If you want to save a file to another location than the tempdir, then
please ask the user to specify it i(n) the call.

I have modified the package to meet this requirement.  Users may now specify an alternate install location via `install_aws_sdk`.

## Original Submission Notes

### Policy Issues/Discussion

The purpose of this package is to make it substantially easier to write R code against Amazon Web Services by leveraging the Java SDK Amazon maintains. 
I hope that you will find the steps I've taken sufficient to meet the requirements of the CRAN Repository Policy.  If I've fallen short, I appologize and look forward to guidance as to how to, if possible, make this package compliant.

#### File Storage Outside R Session's Temporary Directory
I am seeking an exception to the "packages should not write in the users’ home filespace, nor anywhere else on the file system apart from the R session’s temporary directory" requirement. I obtain confirmation from the user regarding installation intent by requiring an explicit call to `awsjavasdk::install_aws_sdk()` function. A `packageStartupMessage` warns users about the target directory and the lack of interactive confirmation `.onAttach`.  The reason I do not explicitly require an interactive session to call this function as I anticipate that this package will find usage in non-interactive environments. Another user explicit function call to `awsjavasdk::load_sdk()` is required to load the associated files in the package::rJava JVM.

#### Licensing and Clear and Unambiguous Authorship 
This package downloads and unpacks the AWS Java SDK ([Apache License 2.0](https://github.com/aws/aws-sdk-java/blob/master/LICENSE.txt)) as well as associated third-party packages directly from Amazon to a user-specific data dir (using package:rappdirs to identify a suitable pro-social loation). 

Users are notified about that location and that the corresponding LICENSE files can be found there.

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

Notes:
* New Submission
* 404 error for URL that isn't valid yet, but will be on completion of CRAN submission: https://cran.r-project.org/package=awsjavasdk

## Downstream dependencies
There are no downstream dependencies at this time.
