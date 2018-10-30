#' Get Recent Personal Explanations by a Specific Members
#'
#' Lawmakers, mostly in the House but also in the Senate, can make personal explanations for missed or mistaken votes in the Congressional Record. HTTP Request: GET https://api.propublica.org/congress/v1/members/{member_id}/explanations/{congress}.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 110-115
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent personal explanations by a specific member in the specified Congress, and supports paginated requests using multiples of 20. 
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_personal_explanations_specific_member('S001193', 115)
#' }
get_recent_personal_explanations_specific_member <- function(member_id, congress, myAPI_Key){
  API = 'congress'
  if(!congress %in% 110:115){
    stop("Incorrect congress, should be 110-115")
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {
    query <- sprintf("members/%s/explanations/%s.json", member_id, congress)
    pp_query(query, API, myAPI_Key = myAPI_Key)}
}