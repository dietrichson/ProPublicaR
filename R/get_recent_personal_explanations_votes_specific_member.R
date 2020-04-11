#' Get Recent Personal Explanation Votes by a Specific Member
#'
#' Lawmakers, mostly in the House but also in the Senate, can make personal explanations for missed or mistaken votes in the Congressional Record. To get recent personal explanations by a specific member that are parsed to individual votes and have an additional category attribute describing the general reason for the absence or incorrect vote, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/members/{member_id}/explanations/{congress}/votes.json
#'
#' @param member_id	The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 		110-116
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent personal explanations by a specific member in the specified Congress, and supports paginated requests using multiples of 20. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_personal_explanations_votes_specific_member('S001193', 115)
#' }
get_recent_personal_explanations_votes_specific_member <- function(member_id, congress, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 110:cMaxCongress){
    stop("Incorrect congress, should be between 110 and ",cMaxCongress)
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {
    query <- sprintf("members/%s/explanations/%s/votes.json", member_id, congress)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)}
}