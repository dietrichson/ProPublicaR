#' Get Electronic Filings by Date
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/{year}/{month}/{day}
#' 
#' @param cycle The election cycle
#' @param year The four-digit year from 2001-2016
#' @param month The two-digit month from 01-12
#' @param day 	The two-digit day from 01-31
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves information about FEC reports filed electronically on a specific date.
#' @export
#'
#' @examples
#' \donttest{
#' get_electronic_filing_byDate(2016, 2016, '01', '10')
#' }
get_electronic_filing_byDate <- function(cycle=2018, year, month, day, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2001){
    stop("Incorrect cycle: the electronic filings are 2001-forward")
  }
  if(nchar(year)!=4){
    stop("Year should be four-digit year")  
  }
  if(nchar(year) == 4 & year < 2001){
    stop("Year should be four-digit year larger than 2001")
  }
  query <- sprintf("%s/filings/%s/%s/%s.json", cycle, year, month, day)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
