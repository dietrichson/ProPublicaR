#' Search Lobbying Representation Filings
#'
#' Returns recent lobbying representation filings for a given search term, 
#' in batches of twenty.
#'
#' @param query keyword or phrase
#' @inheritParams get_new_members
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \donttest{
#' search_lobbying_representation_filings('Facebook')
#' }
search_lobbying_representation_filings <- function(query, page = 1, myAPI_Key){
  API <- "congress"
  query <- sprintf("lobbying/search.json?query=%s", query)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}