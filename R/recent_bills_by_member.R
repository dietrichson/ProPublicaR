#' Get Recent Bills by a Specific Member
#'
#'Use this request type to get the 20 bills most recently introduced or updated by a particular member.
#'Results can include more than one Congress. HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/bills/{type}.json
#'
#' @param member_id member-id	The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param type introduced or updated
#' @inheritParams get_new_members
#'
#' @return the 20 bills most recently introduced or updated by a particular member. Results can include more than one Congress.
#' @export
#'
#' @examples
#' \donttest{
#' recent_bills_by_member('L000287', 'introduced')
#' }
recent_bills_by_member <- function(member_id, type, myAPI_Key){
  API = 'congress'
  if(!type%in%c('introduced', 'updated'))
    stop("Incorrect Chamber. Should be \'introduced\' or \'updated\', lowercase.")
  if(is.character(member_id)){
  query <- sprintf("members/%s/bills/%s.json", member_id, type)
  pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("member_id has to be character")}
}
