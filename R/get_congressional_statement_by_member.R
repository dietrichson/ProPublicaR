#' Get Congressional Statements by Member
#'
#' Get lists of statements published on a specific member’s congressional website during a particular congress, use the following function. 
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param congress 113-116
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_congressional_statement_by_member("C001084", 115)
#' }
get_congressional_statement_by_member <- function(member_id, congress, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 113:cMaxCongress){
    stop("Incorrect congress, should be between 113 and ",cMaxCongress)
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {
    query <- sprintf("members/%s/statements/%s.json", member_id, congress)
    
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)}
}