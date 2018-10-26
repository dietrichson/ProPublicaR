context("get_independent_expenditure_support_candidate")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_independent_expenditure_support_candidate(cycle[1], 'P00003392'), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_support_candidate(cycle[3], 'P00003392'), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_support_candidate(16, 'P00003392'), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_independent_expenditure_support_candidate(1998, 'P00003392'), "Incorrect cycle: independent expenditures are from 2009–present")
})

test_that("error with API key ", {
  if(file.exists("config.yml") & is.null(config::get('ProPublica')[['campaign-finance']])){expect_error(get_independent_expenditure_support_candidate(2016, 'P00003392'),"API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
  expect_warning(get_independent_expenditure_support_candidate(2016, 'P00003392', myAPI_Key = "16"),  "Status code was: 500")
  if(!file.exists("config.yml") & !exists("myAPI_Key")){expect_error(get_independent_expenditure_support_candidate(2016, 'P00003392'), "API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
})

expect_error(get_independent_expenditure_support_candidate(2016, 3392), 'FEC_ID has to be character')
