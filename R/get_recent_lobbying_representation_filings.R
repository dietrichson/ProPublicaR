#' Get Recent Lobbying Representation filings
#'
#' To get the 20 most recent lobbying representation filings, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/lobbying/latest.json
#'
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent lobbying representation filings. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_lobbying_representation_filings()
#' }
get_recent_lobbying_representation_filings <- function(page = 1, myAPI_Key){
  API = 'congress'
  query <- "lobbying/latest.json"
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}