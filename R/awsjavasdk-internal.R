.package_env <- new.env(parent=emptyenv())

#' @importFrom assertthat is.error
.package_envir_get <- function(target, default = NULL) {
  res <- try(get(target, envir = .package_env), silent = TRUE)
  if (assertthat::is.error(res)) {
    res <- default
  }
  if (target == "sdk_file_root") {
    res <- path.expand(res)
  }
  return(res)
}

.package_envir_set <- function(target, value) {
  assign(target, value = value, envir = .package_env)
}

#' @importFrom rappdirs app_dir
.app_dir <- rappdirs::app_dir("awsjavasdk", version = packageVersion("awsjavasdk"))

.onLoad <- function(libname, pkgname) {
  set_sdk_file_root()
}

.onAttach <- function(libname, pkgname) {
  if (!aws_sdk_present()) {
    packageStartupMessage(paste0("awsjavasdk did not detect its own copy of the AWS SDK. You must execute install_aws_sdk() in order to download the SDK and for the package to work as expected. If you've previously installed to a non-standard location, call set_sdk_file_root({{your alt_install root}}, confirm = TRUE) to point this package to that location and then run awsjavasdk::load_sdk()"))
  } else {
    packageStartupMessage("The AWS Java SDK is ready to load, run awsjavasdk::load_sdk() to load the AWS .jars")
  }
}
