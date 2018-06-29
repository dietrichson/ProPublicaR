context("get_recent_late_contributions")

test_that("testing cycle argument", {
  year <- seq(1995,2018)
  expect_warning(expect_error(get_recent_late_contributions(year[1]), "Incorrect cycle"), "Cycle should be four-digit year largest than 1996")
  expect_length(get_recent_late_contributions(year[2]), 7)
  expect_warning(expect_error(get_recent_late_contributions(year[3]), "Incorrect cycle"), "Cycle should be even-numbered year largest than 1996")
  expect_warning(expect_error(get_recent_late_contributions(0), "Incorrect cycle"), "Cycle should be four-digit year")
})



