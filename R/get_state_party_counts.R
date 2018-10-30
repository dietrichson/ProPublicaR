#' Get State Party Counts
#'
#' To get party membership counts for all states (current Congress only), use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/states/members/party.json
#'
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \dontrun{
#' get_state_party_counts()
#' }
get_state_party_counts <- function(myAPI_Key){
  API = 'congress'
  query <- "states/members/party.json"
  pp_query(query, API, myAPI_Key = myAPI_Key)
}