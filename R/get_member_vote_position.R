#' Get a Specific Member’s Vote Positions 
#' 
#' To get the most recent vote positions for a specific member of the House of Representatives or Senate. HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/votes.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the most recent vote positions for a specific member of the House of Representatives or Senate
#' @export
#'
#' @examples
#' \donttest{
#' get_member_vote_position('K000388')
#' }
get_member_vote_position <- function(member_id, page = 1, myAPI_Key){
  API <- 'congress'
  if(is.character(member_id)){
    query <- sprintf("members/%s/votes.json", member_id)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  }else{stop("The member_id has to be character")}
}
