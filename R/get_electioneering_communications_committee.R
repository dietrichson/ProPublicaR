#' Get Electioneering Communications by Specific Committee
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/electioneering_communications
#'
#' @param cycle The election cycle
#' @param FEC_ID 	The FEC-assigned 9-character ID of a committee. To find a committee official FEC ID, use a candidate search request or the FEC web site.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the most recent broadcast advertisements by a specific committee that identify one or more federal candidates (and have aired 30 days before a primary election and 60 days before the general election).
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_electioneering_communications_committee(2016, 'C30002034')
#'
#' }
get_electioneering_communications_committee <- function(cycle=2018, FEC_ID, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/electioneering_communications.json", cycle, FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
