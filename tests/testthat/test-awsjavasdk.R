context("awsjavasdk core functionality")

test_that("test of pure testing environment", {
  skip_on_cran()
  try(unlink(aws_sdk_root(), recursive = TRUE), silent = TRUE)
  expect_false(aws_sdk_present())
  expect_error(aws_sdk_present(assert = TRUE))
})

test_that("sdk installs cleanly", {
  skip_on_cran()
  install_aws_sdk()
  expect_true(aws_sdk_present())
  expect_true(aws_sdk_present(assert = TRUE))
})