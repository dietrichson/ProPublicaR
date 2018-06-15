context("get_candidate")

test_that("will be get a list", {
  expect_equal(class(get_candidate('P60005915', 2016)), 'list')
})