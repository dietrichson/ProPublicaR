context("get_candidate_by_name")

test_that("testing year argument", {
  year <- seq(1995,2018)
  expect_warning(expect_error(get_candidate_by_name('Wilson', year[1]), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_length(get_candidate_by_name('Wilson', year[2]), 7)
  expect_warning(expect_error(get_candidate_by_name('Wilson', year[3]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_candidate_by_name('Wilson', 0), "Incorrect cycle"), "Cycle should be four-digit year")
})



