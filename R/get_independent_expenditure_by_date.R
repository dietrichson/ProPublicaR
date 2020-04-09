#' Get Independent Expenditures by Date
#'
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/independent_expenditures/{year}/{month}/{day}
#'
#' @param cycle The election cycle
#' @param year The four-digit year from 2008-2016
#' @param month The two-digit month from 01-12
#' @param day The two-digit day from 01-31
#' @inheritParams  get_new_members
#' 
#' @return List of returned JSON from endpoint that retrieves all independent expenditures on a specific date (the date of activity, not the date filed with the FEC).
#' @export
#'
#' @examples
#' \donttest{
#' get_independent_expenditure_by_date(2016, year = 2018, month ='01', day = '01')
#' }
get_independent_expenditure_by_date<- function(cycle=2018, year, month, day, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009 to present")}
  if(nchar(year)!=4){
    stop("Year should be four-digit year")  
  }
  if(nchar(year) == 4 & year < 2009){
    stop("Year should be four-digit year larger than 2008")
  }
  query <- stringr::str_glue("{cycle}/independent_expenditures/{year}/{month}/{day}.json", cycle, year, month, day)

  pp_query(query, API, myAPI_Key = myAPI_Key)
}
