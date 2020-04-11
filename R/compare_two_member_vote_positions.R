#' Compare Two Members Vote Positions 
#' 
#' Use this request type to compare two members’ vote positions in a particular Congress and chamber. Responses include four calculated values, showing the number and percentage of votes in which the members took the same position or opposing positions. HTTP Request: GET https://api.propublica.org/congress/v1/members/{first-member-id}/votes/{second-member-id}/{congress}/{chamber}.json
#'
#' @param first_member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param second_member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 102-116 for House, 101-116 for Senate
#' @param chamber house or senate
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves four calculated values: common_votes, disagree_votes, agree_percent and disagree_percent to compare two members’ vote positions, in a particular Congress and chamber
#' @export
#'
#' @examples
#' \donttest{
#' compare_two_member_vote_positions('G000575', 'D000624', '114', 'house')
#' }
compare_two_member_vote_positions <- function(first_member_id, second_member_id, congress, chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for House")
  }
  if(chamber=="senate" & !congress %in% 80:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for Senate")
  }
  if(!is.character(first_member_id) | !is.character(second_member_id)){
    stop("first_member_id and second_member_id have to be character")
  }else{
    query <- sprintf("members/%s/votes/%s/%s/%s.json", first_member_id, second_member_id, congress, chamber)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  }
}
