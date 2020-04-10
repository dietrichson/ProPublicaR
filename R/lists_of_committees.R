#' Lists of Committees
#'
#' To get a list of Senate, House or joint committees, including their subcommittees, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/committees.json
#'
#' @param congress 110-116
#' @param chamber house, senate or joint
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' lists_of_committees(115, "senate")
#' }
lists_of_committees <- function(congress, chamber, myAPI_Key){
  API = 'congress'
  if(!congress %in% 110:cMaxCongress){
    stop("Incorrect congress, should be between 110 and ", cMaxCongress)
  }
  if(!chamber %in% c('house', 'senate', 'both')){
    stop("Incorrect chamber. Should be \'senate\', \'house'\ or \'both\', lowercase")
  }
  query <- sprintf("%s/%s/committees.json", congress, chamber)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}