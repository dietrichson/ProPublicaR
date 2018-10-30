#' Get Congressional Statements by Search Term
#'
#' To get lists of statements published on congressional websites using a search term, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/statements/search.json?query={term}
#'
#' @param term search term
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results that contain the search term in the title or body of the statement and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_congressional_statements_by_term('AHCA')
#' }
get_recent_congressional_statements_by_term <- function(term, myAPI_Key){
  API = 'congress'
  query <- sprintf("statements/search.json?query=%s", term)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}