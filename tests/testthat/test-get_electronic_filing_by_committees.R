context("get_electronic_filing_by_committees")

test_that("expected errors", {
  year <- seq(1996, 2018)
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 1995), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", 1999), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[2]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[4]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[6]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[8]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[10]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[12]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[14]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[16]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[18]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[20]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_by_committees("UNITED EGG", year[22]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
})

test_that("expected lengths", {
  year <- seq(1996, 2018)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", 2016)$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[1])$results) > 1) # false
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[3])$results) > 1) # false
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[5])$results) > 1) # false
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[7])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[9])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[11])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[13])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[15])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[17])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[19])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[21])$results) > 1)
  expect_true(length(get_electronic_filing_by_committees("UNITED EGG", year[23])$results) > 1)
})

