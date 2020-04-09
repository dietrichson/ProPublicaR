#' Get Nominees by State
#'
#' To get a list of presidential civilian nominations of individuals from a specific state, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/nominees/state/{state}.json
#'
#' @param congress 107-116
#' @param state Two-letter state abbreviation
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves 
#' @export
#'
#' @examples
#' \donttest{
#' get_nominees_by_state(115, 'VA')
#' }
get_nominees_by_state <- function(congress, state, myAPI_Key){
  API = 'congress'
  control <- 107:cMaxCongress
  if(!congress %in% 107:cMaxCongress){
    stop("Incorrect congress, posible options are: ", control[1], ", ", control[2], ", ", control[3], " through ", control[9] )
  }
  if(!validate_state(state))
    stop("Incorrect state")
  query <- sprintf("%s/nominees/state/%s.json", congress, state)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}