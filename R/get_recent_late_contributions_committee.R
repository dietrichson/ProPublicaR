#' Get Recent Late Contributions to a Specific Committee
#' https://www.propublica.org/datastore/apis
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/48hour
#'
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a committee.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the most recent late contributions to a specific committee.
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_late_contributions_committee(2016, 'C00575050')
#' }
get_recent_late_contributions_committee <- function(cycle=2018, FEC_ID, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/48hour.json", cycle, FEC_ID)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
