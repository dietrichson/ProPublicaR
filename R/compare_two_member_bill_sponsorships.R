#' Compare Two Members’ Bill Sponsorships 
#' 
#' To compare bill sponsorship between two members who served in the same Congress and chamber. HTTP Request: GET https://api.propublica.org/congress/v1/members/{first-member-id}/bills/{second-member-id}/{congress}/{chamber}.json
#'
#' @param first_member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param second_member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 102-116 for House, 101-116 for Senate
#' @param chamber house o senate
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves bill sponsorship comparation between two members who served in the same Congress and chamber
#' @export
#'
#' @examples
#' \donttest{
#' compare_two_member_bill_sponsorships('G000575', 'D000624', '114', 'house')
#' }
compare_two_member_bill_sponsorships <- function(first_member_id, second_member_id, congress, chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for house")
  }
  if(chamber=="senate" & !congress %in% 80:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for senate")
  }
  if(!is.character(first_member_id) | !is.character(second_member_id)){
    stop("first_member_id and second_member_id have to be character")
  }else{
    query <- sprintf("members/%s/bills/%s/%s/%s.json", first_member_id, second_member_id, congress, chamber)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  }
}
