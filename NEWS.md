# aws_java_sdk 0.2.1

* Bug fix.  I now attempt to find the sdk_file_root() on load rather than attach.  This allows packages depending on awsjavasdk to use aws_sdk_present() correctly.
* `install_aws_sdk()` now happens automatically on first load.  It is still the choice of the useR when/how to `load_sdk()`

# aws_java_sdk 0.2.0

* Added ability to install in alternate location to meet CRAN requirements.

# aws_java_sdk 0.1.0

* Initial Github Commit