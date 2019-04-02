context("get_candidate")
API_key <- "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"
test_that("will be get a list", {
  expect_equal(class(get_candidate('P60005915', 2016, myAPI_Key = API_key)), 'list')
})

test_that("FEC_ID input", {
  expect_error(get_candidate(60005915, 2016), 'FEC_ID has to be character')
})

test_that("will be get a list", {
  expect_error(get_candidate(P60005915, 2016,myAPI_Key = API_key), "object 'P60005915' not found")
})

