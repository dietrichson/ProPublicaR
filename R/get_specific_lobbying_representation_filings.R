#' Get a Specific Lobbying Representation filing
#'
#' To get a specific lobbying representation filing, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/lobbying/{id}.json
#'
#' @param id numeric id attribute from search or latest responses
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \donttest{
#' get_specific_lobbying_representation_filings('300986302')
#' }
get_specific_lobbying_representation_filings <- function(id, page = 1, myAPI_Key){
  API = 'congress'
  query <- sprintf("lobbying/%s.json", id)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}