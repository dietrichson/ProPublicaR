#' Get Candidate Info
#' https://www.propublica.org/datastore/apis
#' GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/{fec-id}
#' 
#' @param FEC_ID The FEC-assigned 9-character ID of a candidate.
#' @param cycle The election cycle must be even-numbered year between 1996 and 2018
#' @inheritParams get_new_members
#'
#' @return a list object with the return values about candidate basic information
#' @export
#'
#' @examples
#' \donttest{
#' get_candidate('P60005915', 2016)}
#' 
get_candidate <- function(FEC_ID, cycle=2018, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop('Incorrect cycle')
  }
  if(!is.character(FEC_ID)){
    stop('FEC_ID has to be character')} else {
    query <- sprintf("%s/candidates/%s.json", cycle, FEC_ID)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)}  
}

