context("validate_cycle")

test_that("get TRUE if Cycle is number even-numbered year between 1996 and 2018", {
  expect_true(validate_cycle(2016), TRUE)
  expect_false(validate_cycle(16), FALSE)
  expect_false(validate_cycle(1995), FALSE)
  expect_true(validate_cycle(1996), TRUE)
  
})
