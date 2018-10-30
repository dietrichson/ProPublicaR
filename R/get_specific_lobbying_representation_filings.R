#' Get a Specific Lobbying Representation filing
#'
#' To get a specific lobbying representation filing, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/lobbying/{id}.json
#'
#' @param id numeric id attribute from search or latest responses
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \dontrun{
#' get_specific_lobbying_representation_filings('300986302')
#' }
get_specific_lobbying_representation_filings <- function(id, myAPI_Key){
  API = 'congress'
  query <- sprintf("lobbying/%s.json", id)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}