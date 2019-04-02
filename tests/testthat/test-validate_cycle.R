context("validate_cycle")

test_that("get TRUE if Cycle is number even-numbered year between 1996 and 2018", {
  expect_true(validate_cycle(2016))
  expect_warning(expect_false(validate_cycle(16)), "Cycle should be four-digit year")
  expect_warning(expect_false(validate_cycle(1995)), "Cycle should be four-digit year larger than 1996")
  expect_true(validate_cycle(1996))
  expect_warning(expect_false(validate_cycle(1999)), "Cycle should be even-numbered year larger than 1996")
  expect_error(validate_cycle("Year"), "Cycle should be numeric")
})


