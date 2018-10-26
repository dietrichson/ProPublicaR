#' Get Recent Independent Expenditures
#'
#'  #HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/independent_expenditures
#' @param cycle The election cycle
#' @param myAPI_Key  use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#'  @return  List of returned JSON from endpoint that retrieves  the 200 most recent independent expenditures and optionally can be offset by multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_independent_expend(2016)
#' }
get_recent_independent_expend <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009–present")}
  query <- sprintf("%s/independent_expenditures.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
