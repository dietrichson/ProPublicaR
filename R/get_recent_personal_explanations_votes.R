#' Get Recent Personal Explanation Votes
#'
#' Lawmakers, mostly in the House but also in the Senate, can make personal explanations for missed or mistaken votes in the Congressional Record. Unlike the “Recent Personal Explanations” response, this response contains explanations parsed to individual votes and have an additional category attribute describing the general reason for the absence or incorrect vote. To get lists of recent personal explanation votes, use the following URI structure. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/explanations/votes.json
#'
#' @param congress 		101-116
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent personal explanation votes in the specified Congress, contains explanations parsed to individual votes and have an additional category attribute describing the general reason for the absence or incorrect vote. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_personal_explanations_votes(114)
#' }
get_recent_personal_explanations_votes <- function(congress, myAPI_Key){
  API = 'congress'
  if(!congress %in% 101:cMaxCongress){
    stop("Incorrect congress, should be between 101 and ",cMaxCongress)
  }
  query <- sprintf("%s/explanations/votes.json", congress)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}