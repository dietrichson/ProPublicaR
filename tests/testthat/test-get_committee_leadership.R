context("get_committee_leadership")

test_that("expected errors", {
  expect_warning(expect_error(get_committee_leadership(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_committee_leadership(1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_committee_leadership(1999), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  expect_length(get_committee_leadership(1996), 6)
})

