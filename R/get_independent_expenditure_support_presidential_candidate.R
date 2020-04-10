#' Get Independent Expenditures that Support or Oppose Presidential Candidates
#'
#' #HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/president/independent_expenditures
#' 
#' @param cycle The election cycle
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 200 most recent independent expenditures in support of or opposition to any presidential candidate.
#' @export
#'
#' @examples
#' \donttest{
#' get_independent_expenditure_support_presidential_candidate(2016)
#' }
get_independent_expenditure_support_presidential_candidate<- function(cycle=2018 , myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009 to present")}
  query <- sprintf("%s/president/independent_expenditures.json", cycle)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
