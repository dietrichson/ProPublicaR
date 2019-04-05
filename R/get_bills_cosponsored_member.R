#' Get Bills Cosponsored by a Specific Member
#' 
#' To get the 20 most recent bill cosponsorships for a particular member, either bills cosponsored or bills where cosponsorship was withdrawn. #HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/bills/{type}.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param type cosponsored or withdrawn
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent bill cosponsorships for a particular member
#' @export
#'
#' @examples
#' \donttest{
#' get_bills_cosponsored_member('B001260', 'cosponsored')
#' }
get_bills_cosponsored_member <- function(member_id, type = c('cosponsored', 'withdrawn'), myAPI_Key){
  API = 'congress'
  if(!type%in%c('cosponsored','withdrawn'))
    stop("Incorrect cosponsorship type. Should be \'cosponsored\' or \'withdrawn\', lowercase.")
  if(is.character(member_id)){
    query <- sprintf("members/%s/bills/%s.json", member_id, type)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  }else{stop("The member_id has to be character")}
}
