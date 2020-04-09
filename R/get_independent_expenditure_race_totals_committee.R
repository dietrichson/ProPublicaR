#' Get Independent Expenditure Office Totals
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/independent_expenditures/races
#'
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a committee
#' @inheritParams get_new_members
#'
#' @return ist of returned JSON from endpoint that retrieves the total amounts of money that a given committee has spent on individual races (consisting of a state, office and district) during a cycle.
#' @export
#'
#' @examples
#' \donttest{
#' get_independent_expenditure_race_totals_committee(2016, 'C00490375')
#' }
get_independent_expenditure_race_totals_committee <- function(cycle, FEC_ID, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2009){
    stop("Incorrect cycle: independent expenditures are from 2009 to present")}
  if(is.character(FEC_ID)){
  query <- sprintf("%s/committees/%s/independent_expenditures/races.json", cycle, FEC_ID)
  pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
