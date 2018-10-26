context("get_electronic_filing_types")

test_that("get error if incorrect cycle", {
  cycle <- seq(1995,2018)
  expect_warning(expect_error(get_electronic_filing_types(cycle[1]), "Incorrect cycle"), "Cycle should be four-digit year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_types(cycle[3]), "Incorrect cycle"), "Cycle should be even-numbered year larger than 1996")
  expect_warning(expect_error(get_electronic_filing_types(16), "Incorrect cycle"), "Cycle should be four-digit year")
  expect_error(get_electronic_filing_types(1998), "Incorrect cycle: the electronic filings are 2001-forward")
})

test_that("error with API key ", {
  if(file.exists("config.yml") & is.null(config::get('ProPublica')[['campaign-finance']])){expect_error(get_electronic_filing_types(2016),"API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
  #expect_warning(get_electronic_filing_types(2016, myAPI_Key = "16"),  "Status code was: 500")
  if(!file.exists("config.yml") & !exists("myAPI_Key")){expect_error(get_electronic_filing_types(2016), "API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher.")}
})

