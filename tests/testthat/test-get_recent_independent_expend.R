context("get_recent_independent_expend")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_recent_independent_expend(cycle[1]), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recent_independent_expend(cycle[3]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_recent_independent_expend(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_recent_independent_expend(1998))
})
