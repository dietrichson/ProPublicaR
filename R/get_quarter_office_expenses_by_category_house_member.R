#'Get Quarterly Office Expenses by Category for a Specific House Member
#'
#'The House of Representatives publishes quarterly reports detailing official office expenses by lawmakers. The Congress API has data beginning in the third quarter of 2009.  HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/office_expenses/{year}/{quarter}.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param category travel or personnel or rent-utilities or other-services or supplies or franked-mail or printing or equipment or total.
#' @inheritParams get_new_members
#'
#' @return the amount a given lawmaker spent during a specified year and quarter in a specified category
#' @export
#'
#' @examples
#' \donttest{
#' get_quarter_office_expenses_by_category_house_member('A000374', 'travel')
#' }
get_quarter_office_expenses_by_category_house_member <- function(member_id, category, myAPI_Key){
  API = 'congress'
  if(!category %in% c('travel', 'personnel', 'rent-utilities', 'other-services','supplies', 'franked-mail', 'printing', 'equipment', 'total')){
    stop("Incorrect category. Should be travel or personnel or rent-utilities or other-services or supplies or franked-mail or printing or equipment or total, lowercase.")
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {
    query <- sprintf("members/%s/office_expenses/category/%s.json", member_id, category)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  }
}
