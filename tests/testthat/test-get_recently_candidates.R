context("get_recently_candidates")

test_that("expected errors", {
  expect_warning(expect_error(get_recently_candidates(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_recently_candidates(1996), "Cycle should be four-digit even-numbered year between 2010 and 2018")
  expect_error(get_recently_candidates(2008), "Cycle should be four-digit even-numbered year between 2010 and 2018")
  expect_warning(expect_error(get_recently_candidates(1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recently_candidates(2007), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  expect_length(get_recently_candidates(2016), 5)
  
})

