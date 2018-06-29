#' Get Committee by name
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/search
#'
#' @param NAME The name of the committee.
#' @param cycle The election cycle
#' @param myAPI_Key To use the Campaign Finance API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves ca specific committee by name for a given campaign cycle from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_committee_by_name('Americans FOR A BETTER TOMORROW TODAY', 2016)
#' }
get_committee_by_name <- function(NAME, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(NAME)){
    NAME <- gsub(' ', '%20', NAME)
    query <- sprintf("%s/committees/search.json?query=%s", cycle, NAME)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("The NAME of the committee has to be character")}
}
