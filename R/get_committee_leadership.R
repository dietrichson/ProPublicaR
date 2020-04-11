#' Get Leadership Committees
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/leadership
#'
#' @param cycle The election cycle: an even-numbered year between 1996 and 2016. The current cycle in 2018
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves committees designated as “leadership PACs” by the FEC from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_committee_leadership(2016)
#' }
get_committee_leadership <- function(cycle=2018, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  query <- sprintf("%s/committees/leadership.json", cycle)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
