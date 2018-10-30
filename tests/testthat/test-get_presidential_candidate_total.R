context("get_presidential_candidate_total")

test_that("expected errors", {
  expect_warning(expect_error(get_presidential_candidate_total(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_presidential_candidate_total(1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_presidential_candidate_total(1999), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  expect_length(get_presidential_candidate_total(2006), 6)
})

