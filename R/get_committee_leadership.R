#' Get Leadership Committees
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/leadership
#'
#' @param cycle The election cycle: an even-numbered year between 1996 and 2016. The current cycle in 2018
#' @param myAPI_Key To use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves committees designated as “leadership PACs” by the FEC from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_committee_leadership(2016)
#' }
get_committee_leadership <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  query <- sprintf("%s/committees/leadership.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
