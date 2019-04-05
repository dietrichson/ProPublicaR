#' Search for Electronic Filings by committee name o partial name
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/search
#'
#' @param cycle The election cycle
#' @param NAME The committee name or partial name
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves information about FEC reports filed electronically by a committee for a given campaign cycle from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_electronic_filing_by_committees(NAME = "UNITED EGG", 2016)
#' }
get_electronic_filing_by_committees <- function(NAME, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(NAME)){
    NAME <- gsub(' ', '%20', NAME)
    query <- sprintf("%s/filings/search.json?query=%s", cycle, NAME)
    pp_query(query, API, myAPI_Key = myAPI_Key)  
  } else {stop("The committee name has to be character")}
}
