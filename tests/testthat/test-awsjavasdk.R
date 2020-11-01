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
  expect_warning(load_sdk())
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})

test_that("sdk loads and is usable after a detach",  {
  skip_on_cran()
  detach("package:awsjavasdk")
  library(awsjavasdk)
  expect_warning(load_sdk())
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})


# Set an alt install location
alt_install <- paste0(tempdir(),"/awsjavasdk")
  
test_that("Possible to override install location",  {
  # CRAN Requires that the user be able to specify their own install location.
  # This test covers that logic, 
  #   and since it uses a blessed loction, 
  #   we can run this test on CRAN.

  # Erase from the default location
  try(unlink(aws_sdk_root(), recursive = TRUE), silent = TRUE)
  
  # Confirm we can override the install location
  set_sdk_file_root(alt_install, confirm = TRUE)
  expect_equal(alt_install, awsjavasdk:::.package_envir_get("sdk_file_root"))
})

test_that("Can install at alt location", {
  # Now that we've forced the override, we should be allowed to install
  expect_true(install_aws_sdk(alt_install))
})

test_that("Can confirm installation", {
  expect_true(aws_sdk_present())  
})
  
test_that("Installed at alt location can be loaded", {  
  # Does it all come together and work?
  expect_warning(load_sdk())
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})  

test_that("sdk loads and is usable after a detach in an alternate location",  {
  detach("package:awsjavasdk")
  library(awsjavasdk)
  set_sdk_file_root(alt_install, confirm = TRUE)
  expect_warning(load_sdk())
  expect_gt(nchar(rJava::J("com.amazonaws.util.VersionInfoUtils")$getVersion()), 0)
})
