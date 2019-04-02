context("get_electronic_filing_by_committees")

test_that("expected errors", {
  year <- seq(1996, 2018)
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 1999), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[22]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  year <- seq(1996, 2018)
  tmp <- get_electronic_filing_by_committees("UNITED EGG", 2016)
  expect_true(length( tmp$results) > 1)
})

