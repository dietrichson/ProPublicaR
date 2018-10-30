context("get_recently_committees")

test_that("expected errors", {
  expect_warning(expect_error(get_recently_committees(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_recently_committees(1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_recently_committees(1999), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  expect_length(get_recently_committees(1996), 3)
})

