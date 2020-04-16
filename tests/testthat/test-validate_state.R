context("validate_state")

test_that("get TRUE if correct State and FALSE in another case", {
  expect_false(validate_state("IM"), FALSE)
  expect_true(validate_state(us_congressional_districts$state_abb[[1]]), TRUE)
  expect_true(validate_state("MI"), TRUE)
})

test_that("warnings", {
  expect_warning(validate_state(16), "State Abbreviation should be a character")
  expect_warning(validate_state(us_congressional_districts$state_name[1]), "State abbreviations should be two letters.")
  expect_warning(validate_state("im"), "State Abbreviation should be upper case.")
})

test_that("get 50 TRUE if use data state_abb", {
  expect_equal(dim(array(sapply(unlist(unique(us_congressional_districts$state_abb)), validate_state))), 50)
})
