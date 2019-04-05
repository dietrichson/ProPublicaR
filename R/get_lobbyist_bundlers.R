#' Get Lobbyist Bundlers for a Specific Committee
#'
#'Committees must report registered lobbyists who act as “bundlers”, collecting donations for the committee from multiple contributors. HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/lobbyist_bundlers
#'
#' 
#' @inheritParams get_independent_expenditure_support_presidential_candidate
#' @param FEC_ID The FEC-assigned 9-character ID of a committee. To find a committee’s official FEC ID, use a committee search request or the FEC web site.
#' 
#' @return List of returned JSON from endpoint that retrieves the most recent lobbyist bundlers reported by a specific committee.
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_lobbyist_bundlers(2016, 'C00579458')
#'}
get_lobbyist_bundlers <- function(cycle=2018, FEC_ID, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/lobbyist_bundlers.json", cycle, FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
