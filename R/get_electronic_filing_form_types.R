#' Get Electronic Filing Form Types
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/types
#'
#' @param cycle The election cycle
#' @param myAPI_Key  use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves a list of available form types for FEC electronic filings.
#' @export
#'
#' @examples
#' \dontrun{
#' get_electronic_filing_form_types(2016)
#' }
get_electronic_filing_form_types <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2001){
    stop("Incorrect cycle: the electronic filings are 2001-forward")
  }
  query <- sprintf("%s/filings/types.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
