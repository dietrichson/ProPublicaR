#' Get Electioneering Communications by Specific Committee
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/electioneering_communications
#'
#' @param cycle The election cycle
#' @param FEC_ID The FEC-assigned 9-character ID of a committee.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recently added FEC independent expenditure-only committees, known as “super PACs” from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_committee_electioneering_communications(2016, 'C30002034')
#'
#' }
get_committee_electioneering_communications <- function(cycle=2018, FEC_ID, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/electioneering_communications.json", cycle, FEC_ID)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
