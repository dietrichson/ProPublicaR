#' Get Recent Congressional Statements
#'
#' To get lists of recent statements published on congressional websites, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/statements/latest.json
#'
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves  the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_congressional_statements()
#' }
get_recent_congressional_statements <- function(page = 1, myAPI_Key){
  API = 'congress'
  query <- "statements/latest.json"
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}