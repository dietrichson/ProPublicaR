#' Get Committee Info
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/{fec-id}
#'
#' @param FEC_ID The FEC-assigned 9-character ID of a committee.
#' @param cycle The election cycle
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves ca specific FEC committee for a given campaign cycle from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_committee('C00553560', 2016)
#' }
get_committee <- function(FEC_ID, cycle=2018, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(FEC_ID)){
    query <- sprintf("%s/committees/%s.json", cycle,FEC_ID)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("FEC_ID has to be character")}
}

