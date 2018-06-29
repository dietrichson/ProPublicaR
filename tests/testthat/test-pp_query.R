context("pp_query")

test_that("get error if API key is null", {
  if(is.null(config::get('ProPublica')[['campaign-finance']])){expect_error(pp_query('2018/races/MI/house/11.json', API='campaign-finance',version='v1'), 
                                                                            "API key not found. \nHint: This should be in config.yml in your working directory or higher.")}
  if(is.null(config::get('ProPublica')[['congress']])){expect_error(pp_query('115/bills/hr21.json',API = 'congress', version='v1'),"API key not found. \nHint: This should be in config.yml in your working directory or higher.")}
  if(is.null(myAPI_Key)){expect_error(pp_query('2018/races/MI/house/11.json', API='campaign-finance',version='v1'), 
                                      "API key not found. \nHint: This should be in config.yml in your working directory or higher.")}
  if(is.null(config::get('ProPublica')[['campaign-finance']]) & !exists("myAPI_Key")){expect_error(pp_query('115/bills/hr21.json',API = 'congress', version='v1'), 
                                      "API key not found. \nHint: This should be in config.yml in your working directory or higher.")}
})

test_that("get error if API not support", {
  expect_error(pp_query('2018/races/MI/house/11.json', API='myAPI',version='v1', myAPI_Key = "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"), "API not supported.")
})

test_that("get error if there are not specified query ", {
  expect_error(pp_query(API='campaign-finance',version='v1', myAPI_Key = "PLgSaGES7ne8SLcWnwxAL2DeddgwuSLK4lQD34vj"), 'argument "query" is missing, with no default')
})

