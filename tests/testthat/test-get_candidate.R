context("get_candidate")

test_that("will be get a list", {
  expect_equal(class(get_candidate('P60005915', 2016)), 'list')
})

test_that("FEC_ID input", {
  expect_error(get_candidate(60005915, 2016), 'FEC_ID has to be character')
})

test_that("will be get a list", {
  expect_error(get_candidate(P60005915, 2016), "object 'P60005915' not found")
})

