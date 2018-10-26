#' Get Independent Expenditures by Date
#'
#'HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/independent_expenditures/{year}/{month}/{day}
#'
#' @param cycle The election cycle
#' @param year The four-digit year from 2008-2016
#' @param month The two-digit month from 01-12
#' @param day The two-digit day from 01-31
#' @param myAPI_Key  use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#' 
#' @return List of returned JSON from endpoint that retrieves all independent expenditures on a specific date (the date of activity, not the date filed with the FEC).
#' @export
#'
#' @examples
#' \dontrun{
#' get_independent_expenditure_by_date(2016, year = 2018, month ='01', day = '01')
#' }
get_independent_expenditure_by_date<- function(cycle=2018, year, month, day, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009–present")}
  if(nchar(year)!=4){
    stop("Year should be four-digit year")  
  }
  if(nchar(year) == 4 & year < 2009){
    stop("Year should be four-digit year larger than 2008")
  }
  query <- sprintf("%s/independent_expenditures/%s/%s/%s.json", cycle, year, month, day)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
