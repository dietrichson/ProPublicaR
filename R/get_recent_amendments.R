#' Get Recent Amendments
#'
#'HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/amendments
#' @param cycle The election cycle
#' @inheritParams get_new_members
#' @return  List of returned JSON from endpoint that retrieves the most recent filings that are amendments of earlier filings
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_amendments(2016)
#' }
get_recent_amendments <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2001){
    stop("Incorrect cycle: the electronic filings are 2001-forward")}
  query <- sprintf("%s/filings/amendments.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
