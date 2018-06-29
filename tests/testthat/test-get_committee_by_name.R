context("get_committee_by_name")

test_that("expected errors", {
  expect_warning(expect_error(get_committee_by_name('Americans FOR A BETTER TOMORROW TODAY', 16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_committee_by_name('Americans FOR A BETTER TOMORROW TODAY', 1995), "Incorrect cycle"), "Cycle should be four-digit year largest than 1996")
  expect_warning(expect_error(get_committee_by_name('Americans FOR A BETTER TOMORROW TODAY', 1999), "Incorrect cycle"), "Cycle should be even-numbered year largest than 1996")
})

test_that("expected lengths", {
  expect_length(get_committee_by_name('Americans FOR A BETTER TOMORROW TODAY', 2016), 7)
  
})

