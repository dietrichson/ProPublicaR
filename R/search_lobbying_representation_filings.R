#' Search Lobbying Representation filings
#'
#' To get the 20 most recent lobbying representation filings for a given search term, use the following function. HTTP Request: GEThttps://api.propublica.org/congress/v1/lobbying/search.json?query={query}
#'
#' @param query keyword or phrase
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \donttest{
#' search_lobbying_representation_filings('Facebook')
#' }
search_lobbying_representation_filings <- function(query, myAPI_Key){
  API = 'congress'
  query <- sprintf("lobbying/search.json?query=%s", query)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}