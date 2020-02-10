#' Get Congressional Statements by Member
#'
#' To get lists of statements published on a specific member’s congressional website during a particular congress, use the following function. HTTP Request: GEThttps://api.propublica.org/congress/v1/members/{member-id}/statements/{congress}.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 113-116
#' @param offset where to start fetching (0 by default). The API fetches stuff in batches of 20.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_congressional_statement_by_member("C001084", 115)
#' }
get_congressional_statement_by_member <- function(member_id, congress, myAPI_Key, offset=0){
  API = 'congress'
  if(!congress %in% 113:116){
    stop("Incorrect congress, should be between 113 and 116")
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {
    query <- sprintf("members/%s/statements/%s.json?offset=%s", member_id, congress, offset)
    
    pp_query(query, API, myAPI_Key = myAPI_Key)}
}