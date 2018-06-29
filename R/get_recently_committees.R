#' Get Recently Added Committees.
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/new
#'
#' @param cycle The election cycle
#' @param myAPI_Key To use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return  List of returned JSON from endpoint that retrieves the 20 most recently added FEC committees from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_recently_committees(2016)
#' }
get_recently_committees <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  query <- sprintf("%s/committees/new.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key) 
}
