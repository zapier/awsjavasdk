![Lifecycle: Superseded](https://img.shields.io/badge/lifecycle-superseded-blue.svg)
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![Travis-CI Build Status](https://travis-ci.org/zapier/awsjavasdk.svg?branch=master)](https://travis-ci.org/zapier/awsjavasdk)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/awsjavasdk)](https://cran.r-project.org/package=awsjavasdk)
[![codecov.io](https://codecov.io/github/zapier/awsjavasdk/coverage.svg?branch=master)](https://codecov.io/github/zapier/awsjavasdk?branch=master)

Superseded?
--------------------

I (the author) no longer use this package.  If you'd like to take over ownership/maintenance, please reach out.  If you are comfortable with Python, I'd recommend {botor} as a replacement.  If you're only comfortable with Java, I'd recommend {AWR} as a replacement.


Why should I use it?
--------------------

If you are like most useRs you shouldn't. package:awsjavasdk provides boilerplate access to all of the classes included in the AWS Java SDK (inclusive of 3rd party classes). For most useRs this isn't user friendly enough.

If you are looking for easy access to AWS resources, this package isn't for you. Right now the best supported option for easy access is, in the author's opinion, provided by [cloudyr](https://cloudyr.github.io/packages/index.html)'s aws series of packages (some of which are already on CRAN).

However, if you are feeling limited by the web api exposed by cloudyr, like building things from scratch, or like the 'safety' of directly using an approved AWS SDK, then this package may be for you - but only if you don't mind a shotgun approach. The current version of the package loads all `.jar`s provided by the SDK.

As an alternative also consider [package:AWR](https://cran.r-project.org/package=AWR) which gives you finer grained control over which version of the AWS SDK you use and auto-installs the SDK.  This package is suitable if you always want to develop against the bleeding edge SDK and for legacy purposes.

How do I use it?
----------------

Before you can load anything, you'll need to install the Java SDK. package:awsjavasdk handles the installation location for you. You just need to manually trigger the installation itself so that this package can be CRAN compliant.

    library(awsjavasdk)

    # Install the sdk if it hasn't been installed yet
    if (!awsjavasdk::aws_sdk_present()) {
      awsjavasdk::install_aws_sdk()
    }

Then, you can load all java classes included in the SDK...

    awsjavasdk::load_sdk()

From there, you're on your own. :)

E.g.

    v <- rJava::J("com.amazonaws.util.VersionInfoUtils")
    print(v$getVersion())

How do I get it?
----------------

The current version is not on CRAN, but you can fetch an early release of the upcoming build directly from github:

    library(devtools)
    install_github("zapier/awsjavasdk")
    library(awsjavasdk)

Author's Note
-------------

This code was inspired by and borrowed in parts from multiple web sources including [published code](https://code.google.com/archive/p/segue/) and a [blog post](https://cerebralmastication.com/2010/11/controlling-amazon-web-services-using-rjava-and-the-aws-java-sdk/) by JD Long.

Roadmap
-------

-   Add support for displaying SDK install location
-   Add support for installing a new SDK version if available; always load the latest SDK
-   Add support for listing available SDK versions
-   Add support for loading a specific SDK version
-   Add support for listing `jar`s
-   Add support for loading specific `jar`s
