context("get_recent_late_contributions")

test_that("testing cycle argument", {
  year <- seq(1996,2018)
  expect_error(get_recent_late_contributions(year[1],"Cycle must be even-numbered year between 2010 and 2018"))
  expect_length(get_recent_late_contributions(year[15]), 7)
  expect_warning(expect_error(get_recent_late_contributions(year[2]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_recent_late_contributions(0), "Incorrect cycle"), "Cycle should be four-digit year")
})



