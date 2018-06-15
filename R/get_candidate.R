#' Get Candidate Info
#' GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/{fec-id}
#' @param FEC_ID The FEC-assigned 9-character ID of a candidate.
#' @param cycle The election cycle
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' get_candidate('P60005915', 2016)
#' }
get_candidate <- function(FEC_ID, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  capture.output(tryCatch({
    if(is.character(FEC_ID)){
    query <- sprintf("%s/candidates/%s.json", cycle,FEC_ID)
    pp_query(query, API, myAPI_Key = myAPI_Key)} else ('FEC_ID has to be character')
    }))
}

