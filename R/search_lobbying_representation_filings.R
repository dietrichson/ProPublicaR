#' Search Lobbying Representation filings
#'
#' To get the 20 most recent lobbying representation filings for a given search term, use the following function. HTTP Request: GEThttps://api.propublica.org/congress/v1/lobbying/search.json?query={query}
#'
#' @param query keyword or phrase
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \dontrun{
#' search_lobbying_representation_filings('Facebook')
#' }
search_lobbying_representation_filings <- function(query, myAPI_Key){
  API = 'congress'
  query <- sprintf("lobbying/search.json?query=%s", query)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}