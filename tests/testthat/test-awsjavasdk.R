context("awsjavasdk core functionality")

test_that("test of pure testing environment", {
  skip_on_cran()
  try(unlink(aws_sdk_root(), recursive = TRUE), silent = TRUE)
  expect_false(aws_sdk_present())
  expect_error(aws_sdk_present(assert = TRUE))
})

test_that("test message when install is needed", {
  skip_on_cran()
  detach("package:awsjavasdk")
  expect_message(library(awsjavasdk))
})

test_that("sdk installs cleanly", {
  skip_on_cran()
  install_aws_sdk()
  expect_true(aws_sdk_present())
  expect_true(aws_sdk_present(assert = TRUE))
})

test_that("sdk loads and is usable",  {
  skip_on_cran()
  load_sdk()
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})

test_that("sdk loads and is usable after a detach",  {
  skip_on_cran()
  detach("package:awsjavasdk")
  library(awsjavasdk)
  load_sdk()
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})

test_that("Alternate install location",  {
  # CRAN Requires that the user be able to specify their own install location.
  # This test covers that logic, 
  #   and since it uses a blessed loction, 
  #   we can run this test on CRAN.
  
  # Erase from the default location
  try(unlink(aws_sdk_root(), recursive = TRUE), silent = TRUE)
  
  # Blessed location
  alt_install <- paste0(tempdir(),"/awsjavasdk")
  not_empty_file <- paste0(alt_install,"/notempty")
  
  # make a file in the alternate location,
  #   we'd like to throw an error if a user tries to use a location that isn't really safe
  try(unlink(alt_install, recursive = TRUE), silent = TRUE)
  dir.create(alt_install)
  writeLines(LETTERS, not_empty_file)
  expect_error(install_aws_sdk(alt_install))
  
  # Confirm we can override the install location
  set_sdk_file_root(alt_install, confirm = TRUE)
  expect_equal(alt_install, awsjavasdk:::.package_envir_get("sdk_file_root"))
  
  # Now that we've forced the override, we should be allowed to install
  expect_true(install_aws_sdk(alt_install))
  expect_true(aws_sdk_present())
  
  # Does it all come together and work?
  load_sdk()
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})

test_that("sdk loads and is usable after a detach in an alternate location",  {
  detach("package:awsjavasdk")
  library(awsjavasdk)
  alt_install <- paste0(tempdir(),"/awsjavasdk")
  set_sdk_file_root(alt_install, confirm = TRUE)
  load_sdk()
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})
