#' Get Candidate Info
#' 
#' https://www.propublica.org/datastore/apis
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/search
#'
#' @param NAME The first or last name of the candidate.
#' @param cycle The election cycle
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves federal candidates by last name, using a query string parameter.
#' @export
#'
#' @examples
#' \donttest{
#' get_candidate_by_name('Wilson', 2016)
#' }
#' 
get_candidate_by_name <- function(NAME, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(NAME)){
    query <- sprintf("%s/candidates/search.json?query=%s", cycle, NAME)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("NAME has to be character. The first or last name of the candidate.")}
}

