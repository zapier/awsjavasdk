.package_env <- new.env(parent=emptyenv())

#' @importFrom assertthat is.error
.package_envir_get <- function(target, default = NULL) {
  res <- try(get(target, envir = .package_env), silent = TRUE)
  if (assertthat::is.error(res)) {
    res <- default
  }
  return(res)
}

.package_envir_set <- function(target, value) {
  assign(target, value = value, envir = .package_env)
}

#' @importFrom rappdirs app_dir
.app_dir <- rappdirs::app_dir("awsjavasdk", version = packageVersion("awsjavasdk"))

#' @importFrom rJava .jinit
.onAttach <- function(libname, pkgname) {
  rJava::.jinit()
  if (!aws_sdk_present()) {
    packageStartupMessage("awsjavasdk did not detect its own copy of the AWS SDK; you must execute install_aws_sdk() in order to download the SDK and for the package to work as expected")
  } else {
    packageStartupMessage("The AWS Java SDK is ready to load, run awsjavasdk::load_sdk() to load the AWS .jars")
  }
}
