#' Get Recent Electioneering Communications
#'
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/electioneering_communications
#' 
#' @param cycle The election cycle
#' @inheritParams get_new_members
#' @return List of returned JSON from endpoint that retrieves the 20 most recent broadcast advertisements that identify one or more federal candidates (and have aired 30 days before a primary election and 60 days before the general election).
#'
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_electioneering_communications(2016)
#'
#' }
get_recent_electioneering_communications <- function(cycle=2018, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  query <- sprintf("%s/electioneering_communications.json", cycle)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
