#' Get Committee Filings
#' 
#' HTTP Request GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}/filings
#'
#' @param FEC_ID The FEC-assigned 9-character ID of a committee.
#' @param cycle The election cycle
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' get_committee_filings('C00553560', 2016)
#' }
get_committee_filings <- function(FEC_ID, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s/filings.json", cycle,FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}
