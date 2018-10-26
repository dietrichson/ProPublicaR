context("get_independent_expenditure_by_date")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_independent_expenditure_by_date(cycle[1], 2016, '01', '10'), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_by_date(cycle[3], 2016, '01', '10'), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_by_date(16, 2016, '01', '10'), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_independent_expenditure_by_date(1998, 2016, '01', '10'), "Incorrect cycle: independent expenditures are from 2009–present")
})

test_that("get error if incorrect year", {
  year <- seq(1995,2018)
  expect_error(get_independent_expenditure_by_date(2016, year[1], '01', '10'), "Year should be four-digit year larger than 2008")
  expect_error(get_independent_expenditure_by_date(2016, 16, '01', '10'), "Year should be four-digit year")
})

test_that("error with API key ", {
  if(file.exists("config.yml") & is.null(config::get('ProPublica')[['campaign-finance']])){expect_error(get_independent_expenditure_by_date(2016, 16, '01', '10'),"API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
  #expect_warning(get_independent_expenditure_by_date(2016, 2016, '01', '10', '31'),  "Status code was: 500")
  if(!file.exists("config.yml") & !exists("myAPI_Key")){expect_error(get_independent_expenditure_by_date(2016, 2016, '01', '10'), "API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
})