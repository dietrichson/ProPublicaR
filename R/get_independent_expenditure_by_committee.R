#' Get Independent Expenditures by Specific Committee
#'
#' #HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/independent_expenditures
#' 
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a committee. To find a committee official FEC ID, use a candidate search request or the FEC web site.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent independent expenditures by a given committee.
#' @export
#'
#' @examples
#' \donttest{
#' get_independent_expenditure_by_committee(2016, FEC_ID ='C00575423')
#' }
get_independent_expenditure_by_committee<- function(cycle=2018, FEC_ID, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009 to present")}
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/independent_expenditures.json", cycle, FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
