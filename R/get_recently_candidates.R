#' Get Top 20 Candidates in Specific Financial Category
#'  
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/new (https://www.propublica.org/datastore/apis)
#' 
#'
#' @param cycle The election cycle: Four-digit even-numbered year between 2010 and 2018
#' @inheritParams get_new_members
#' 
#' @return List of returned JSON from endpoint that retrieves ithe 20 most recently added FEC candidates for a given campaign cycle from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recently_candidates(2016)
#' }
get_recently_candidates <- function(cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(cycle >= 2010 & cycle %% 2 == 0){
    query <- sprintf("%s/candidates/new.json", cycle)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("Cycle should be four-digit even-numbered year between 2010 and 2018")}
}
