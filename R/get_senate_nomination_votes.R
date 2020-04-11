#' Get Senate Nomination Votes
#'
#' To get Senate votes on presidential nominations. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/nominations.json
#'
#' @param congress 		101-116
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves Senate votes on presidential nominations
#' @export
#'
#' @examples
#' \donttest{
#' get_senate_nomination_votes(114)
#' }
get_senate_nomination_votes <- function(congress, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 101:cMaxCongress){
    stop("Incorrect congress, should be between 101 and", cMaxCongress)
  }
  query <- sprintf("%s/nominations.json", congress)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}