#' Get Recent Official Communications by Chamber
#'
#' To get lists of official communications to Congress for a specific chamber, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/committees/{committee-id}/subcommittees/{subcommittee-id}.json
#'
#' @param congress 	114-116 for House, 96-116 for Senate
#' @param chamber house or senate 
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent official communications to Congress for a specific chamber for the specified chamber, either house or senate.
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_official_communications_by_chamber(115, 'house')
#' }
get_recent_official_communications_by_chamber <- function(congress, chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber %in% c('house', 'senate')){
    stop("Incorrect chamber. Should be \'senate\' or \'house'\ , lowercase")
  }
  query <- sprintf("%s/communications/%s.json", congress, chamber)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}