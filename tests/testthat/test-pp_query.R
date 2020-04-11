context("pp_query")

test_that("get error if API not support", {
  expect_error(pp_query('2018/races/MI/house/11.json', API='myAPI',version='v1', myAPI_Key = "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"), "API not supported.")
})

test_that("get error if there are not specified query ", {
  expect_error(pp_query(API='campaign-finance',version='v1', myAPI_Key = "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"), 'argument "query" is missing, with no default')
})

