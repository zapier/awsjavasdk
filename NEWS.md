# aws_java_sdk 0.2.2

* I'm marking the package as [Superseded](https://www.tidyverse.org/lifecycle/#superseded).  I no longer use it and think there are better solutions available.  If you're only comfortable with Java, I'd recommend {AWR} as a replacement.  Otherwise, I'd recommend {botor} as a replacement.  If you'd like to take over ownership/maintenance, please reach out.  
* Extending the timeout on the SDK download to help on CRAN machines
* Added tilde expansion to the awsjavasdk target location

# aws_java_sdk 0.2.1

* Bug fix.  I now attempt to find the sdk_file_root() on load rather than attach.  This allows packages depending on awsjavasdk to use aws_sdk_present() correctly.

# aws_java_sdk 0.2.0

* Added ability to install in alternate location to meet CRAN requirements.

# aws_java_sdk 0.1.0

* Initial Github Commit