#' Lists of Committees
#'
#' To get a list of Senate, House or joint committees, including their subcommittees, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/committees.json
#'
#' @param congress 110-115
#' @param chamber house, senate or joint
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \dontrun{
#' lists_of_committees(115, "senate")
#' }
lists_of_committees <- function(congress, chamber, myAPI_Key){
  API = 'congress'
  if(!congress %in% 110:115){
    stop("Incorrect congress, should be 110 until 115")
  }
  if(!chamber %in% c('house', 'senate', 'both')){
    stop("Incorrect chamber. Should be \'senate\', \'house'\ or \'both\', lowercase")
  }
  query <- sprintf("%s/%s/committees.json", congress, chamber)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}