context("get_recent_late_contributions_committee")

test_that("testing errors", {
  expect_error(get_recent_late_contributions_committee(2016, 575050), 'FEC_ID has to be character')
  expect_warning(expect_error(get_recent_late_contributions_committee(1995, 'C00575050'), 'Incorrect cycle'), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recent_late_contributions_committee(16, 'C00575050'), 'Incorrect cycle'), 'Cycle should be four-digit year')
})