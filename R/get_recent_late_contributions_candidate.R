#' Get Recent Late Contributions to a Specific Candidate
#' https://www.propublica.org/datastore/apis
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/{fec-id}/48hour
#'
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a candidate.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the most recent late contributions to candidates from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_late_contributions_candidate(2016, 'H4NY11138')
#' }
get_recent_late_contributions_candidate <- function(cycle=2018, FEC_ID, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/candidates/%s/48hour.json", cycle, FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
