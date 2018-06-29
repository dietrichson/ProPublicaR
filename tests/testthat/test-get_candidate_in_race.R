context("get_candidate_in_race")

test_that("expected errors", {
  expect_error(get_candidates_in_race( 'IM', 'house', 11), "Incorrect state")
  expect_error(get_candidates_in_race( 'MI', 'representatives', 11), 'Incorrect Chamber. (Should be \'house\' or \'senate\' (lowercase).')
  expect_error(get_candidates_in_race( 'IM', 'house', 11, 1995), "Incorrect cycle")
  expect_error(get_candidates_in_race( 'IM', 'house', 111, 1996), "Incorret district")
})

test_that("diference return_value", {
  expect_equal(get_candidates_in_race('MI', 'house', 11, return_value='query'), "2018/races/MI/house/11.json")
  expect_length(get_candidates_in_race('MI', 'house', 11, return_value='result'), 10) 
})

