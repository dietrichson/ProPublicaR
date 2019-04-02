context("get_candidate_in_race")

API_key <- "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"

test_that("expected errors", {
  expect_error(get_candidates_in_race( 'IM', 'house', 11), "Incorrect state")
  expect_error(get_candidates_in_race( 'MI', 'representatives', 11))
  expect_warning(expect_error(get_candidates_in_race( 'MI', 'house', 11, 1995), 'Incorrect cycle'), "Cycle should be four-digit year larger than 1996")
  expect_error(get_candidates_in_race( 'MI', 'house', 111, 1996), "Incorret district")
})

test_that("diference return_value", {
  expect_equal(get_candidates_in_race('MI', 'house', 11, return_value='query', myAPI_Key = API_key), "2018/races/MI/house/11.json")
  expect_length(get_candidates_in_race('MI', 'house', 11, return_value='result', myAPI_Key = API_key), 10) 
})

