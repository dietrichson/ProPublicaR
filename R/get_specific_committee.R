#' Get a Specific Committee
#'
#' To get information about a single Senate or House committee, including the members of that committee, use the following function. The committee ids can be found in the committee list responses. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/committees/{committee-id}.json
#'
#' @param congress 110-115
#' @param chamber house, senate or joint
#' @param committee_id Committee abbreviation, for example HSAG. Use the full committees response to find abbreviations.
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' get_specific_committee(115, "senate",lists_of_committees(115, "senate")$results[[1]]$committees[[1]]$id)
#' get_specific_committee(115, "senate", "SSAF")
#' }
get_specific_committee <- function(congress, chamber, committee_id, myAPI_Key){
  API = 'congress'
  if(!congress %in% 110:115){
    stop("Incorrect congress, should be 110 until 115")
  }
  if(!chamber %in% c('house', 'senate', 'both')){
    stop("Incorrect chamber. Should be \'senate\', \'house'\ or \'both\', lowercase")
  }
  query <- sprintf("%s/%s/committees/%s.json", congress, chamber, committee_id)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}