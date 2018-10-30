context("get_committee_filings")

test_that("testing errors", {
  expect_error(get_committee_filings(553560, 2016), 'FEC_ID has to be character')
  expect_warning(expect_error(get_committee_filings('C00553560', 1995), 'Incorrect cycle'), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_committee_filings('C00553560', 16), 'Incorrect cycle'), 'Cycle should be four-digit year')
})

