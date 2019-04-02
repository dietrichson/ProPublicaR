context("get_committee")

test_that("testing errors", {
  expect_error(get_committee(553560, 2016), 'FEC_ID has to be character')
  expect_warning(expect_error(get_committee('C00553560', 1995), 'Incorrect cycle'), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_committee('C00553560', 16), 'Incorrect cycle'), 'Cycle should be four-digit year')
})

#TODO: Add Actual Test
