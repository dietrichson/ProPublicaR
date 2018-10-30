#' Get Recent Late Contributions
#' https://www.propublica.org/datastore/apis
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/contributions/48hour
#'
#' @param cycle The election cycle. Cycle must be even-numbered year between 2010 and 2018
#' @param myAPI_Key To use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the most recent late contributions to candidates from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_late_contributions(2016)
#' }
get_recent_late_contributions <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(cycle<2010)
    stop("Cycle must be even-numbered year between 2010 and 2018")
  query <- sprintf("%s/contributions/48hour.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
