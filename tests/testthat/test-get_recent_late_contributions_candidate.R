context("get_recent_late_contributions_candidate")

test_that("testing errors", {
  expect_error(get_recent_late_contributions_candidate(2016, 11138), 'FEC_ID has to be character')
  expect_warning(expect_error(get_recent_late_contributions_candidate(1995, 'H4NY11138'), 'Incorrect cycle'), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recent_late_contributions_candidate(16, 'H4NY11138'), 'Incorrect cycle'), 'Cycle should be four-digit year')
})