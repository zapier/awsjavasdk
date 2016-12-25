#' Install the AWS Java SDK
#'
#' This function fetches and unpacks the AWS Java SDK to a package managed directory.  
#' If the Java SDK is already present, 
#'   it will wipe that location and re-download and unpack the
#'   file present at https://sdk-for-java.amazonwebservices.com/latest/aws-java-sdk.zip
#' 
#' @return boolean; TRUE if the SDK can now be located, FALSE if it can not be located
#' @export
#'
#' @importFrom R.utils mkdirs
#' @examples 
#' \dontrun{
#' install_aws_sdk()
#' }
install_aws_sdk <- function() {
  # delete existing sdk
  unlink(list.files(.app_dir$data(),full.names = TRUE), recursive = TRUE)
  #do a check here for existing sdk of version
  tempzip <- tempfile()
  download.file("https://sdk-for-java.amazonwebservices.com/latest/aws-java-sdk.zip", tempzip)
  R.utils::mkdirs(.app_dir$data(), mustWork = TRUE)
  unzip(tempzip, exdir = .app_dir$data())
  aws_sdk_present(assert = TRUE)
  unlink(tempzip)
  return(aws_sdk_present())
}

#' Load AWS Java SDK
#'
#'
#' @return As rJava::.jpacakge(), invisible TRUE if the initialization was successful 
#' @export
#' @importFrom rJava .jpackage J
load_sdk <- function() {
  # Add class paths for all .jar in the sdk directory
  rJava::.jpackage("awsjavasdk", morePaths = grep(".jar", list.files(aws_sdk_root(), recursive = TRUE, full.names = TRUE), value = TRUE))
  NULL
}

#' Find AWS SDK Version
#'
#' @return character, AWS SDK Version and standard character prefix \code{aws-java-sdk-} as in the unpacked directory name
#' @export
#'
#' @examples
#' \dontrun{
#' aws_sdk_version()
#' }
aws_sdk_version <- function() {
  asv <- .package_envir_get(".aws_sdk_version", default = NULL)
  if (is.null(asv) || length(asv) == 0 || nchar(asv)==0) {
    .package_envir_set(".aws_sdk_version", list.files(.app_dir$data(),full.names = FALSE))
    asv <- .package_envir_get(".aws_sdk_version")
  }
  return(asv)
}


#' Get the root directory for the AWS Java SDK
#'
#' @return character
#' @export
aws_sdk_root <- function() {
  paste0(.app_dir$data(), "/", aws_sdk_version(), "/")
}


#' Confirm presence of core SDK jar
#'
#' @details Note that this only checks for the ability to locate the core AWS SDK jar
#' @param assert If TRUE, the absence of the SDK will throw an error
#'
#' @return Boolean reflecting whether the SDK could be located
#' @export
#'
#' @importFrom assertthat assert_that
#' @examples
#' \dontrun{
#' aws_sdk_present()
#' }
aws_sdk_present <- function(assert = FALSE) {
  wrap <- ifelse(assert, assertthat::assert_that, identity)
  wrap(file.exists(paste0(aws_sdk_root(), "lib/", aws_sdk_version(), ".jar")))
}