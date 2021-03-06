context("get_recent_amendments")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_recent_amendments(cycle[1]), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recent_amendments(cycle[3]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_recent_amendments(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_recent_amendments(1998), "Incorrect cycle: the electronic filings are 2001-forward")
})
