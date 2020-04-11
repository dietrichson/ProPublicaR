#' Get Independent Expenditures that Support or Oppose a Specific Candidate
#'
#' #HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/{fec-id}/independent_expenditures
#' 
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a committee. To find a committee official FEC ID, use a candidate search request or the FEC web site.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 200 most recent independent expenditures in support of or opposition to a given candidate.
#' @export
#'
#' @examples
#' \donttest{
#' get_independent_expenditure_support_candidate(2016, FEC_ID ='P00003392')
#' }
get_independent_expenditure_support_candidate<- function(cycle=2018, FEC_ID, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009 to present")}
  if(is.character(FEC_ID)){
    query <- sprintf("%s/candidates/%s/independent_expenditures.json", cycle, FEC_ID)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
