#' Get Congressional Statements by Date
#'
#' To get lists of statements published on congressional websites on a particular date, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/statements/date/{date}.json
#'
#' @param year YYYY format
#' @param month MM format
#' @param day DD format
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_congressional_statements_by_date(2017, '05', '08')
#' }
get_recent_congressional_statements_by_date <- function(year, month, day, myAPI_Key){
  API = 'congress'
  if(nchar(year)!=4){
    stop("Incorrect year. Year should be four-digit year")  
  }
  sep = '-'
  date <- paste0(year, sep, month, sep, day)
  query <- sprintf("statements/date/%s.json", date)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}