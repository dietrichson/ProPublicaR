context("get_independent_expenditure_office_totals")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_independent_expenditure_office_totals(cycle[1], 'president'), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_office_totals(cycle[3], 'president'), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_independent_expenditure_office_totals(16, 'president'), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_independent_expenditure_office_totals(1998, 'president'), "Incorrect cycle: independent expenditures are from 2009–present")
})

test_that("error with API key ", {
  if(file.exists("config.yml") & is.null(config::get('ProPublica')[['campaign-finance']])){expect_error(get_independent_expenditure_office_totals(2016, 'president'),"API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
  expect_warning(get_independent_expenditure_office_totals(2016, 'president', myAPI_Key = "16"),  "Status code was: 500")
  if(!file.exists("config.yml") & !exists("myAPI_Key")){expect_error(get_independent_expenditure_office_totals(2016, 'president'), "API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
})

test_that("office options and message", {
  expect_error(get_independent_expenditure_office_totals(2016, 'houses'), "Incorrect office. Should be \'house\', \'president\' or \'senate\', lowercase.")
  expect_length(get_independent_expenditure_office_totals(2016, 'president'), 5)
})