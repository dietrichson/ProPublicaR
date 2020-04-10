#' Get State Party Counts
#'
#' To get party membership counts for all states (current Congress only), use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/states/members/party.json
#'
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \donttest{
#' get_state_party_counts()
#' }
get_state_party_counts <- function(page = 1, myAPI_Key){
  API = 'congress'
  query <- "states/members/party.json"
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}