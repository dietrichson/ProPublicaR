#' Get Recent Lobbying Representation filings
#'
#' To get the 20 most recent lobbying representation filings, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/lobbying/latest.json
#'
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent lobbying representation filings. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_lobbying_representation_filings()
#' }
get_recent_lobbying_representation_filings <- function(myAPI_Key){
  API = 'congress'
  query <- "lobbying/latest.json"
  pp_query(query, API, myAPI_Key = myAPI_Key)
}