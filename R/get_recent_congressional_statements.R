#' Get Recent Congressional Statements
#'
#' To get lists of recent statements published on congressional websites, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/statements/latest.json
#'
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves  the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_congressional_statements()
#' }
get_recent_congressional_statements <- function(myAPI_Key){
  API = 'congress'
  query <- "statements/latest.json"
  pp_query(query, API, myAPI_Key = myAPI_Key)
}