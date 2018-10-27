#'Get Quarterly Office Expenses by Category for a Specific House Member
#'
#'The House of Representatives publishes quarterly reports detailing official office expenses by lawmakers. The Congress API has data beginning in the third quarter of 2009.  HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/office_expenses/{year}/{quarter}.json
#'
#' @param member_id The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.
#' @param category travel or personnel or rent-utilities or other-services or supplies or franked-mail or printing or equipment or total
#' @param year 2009-2017
#' @param quarter 1,2,3,4
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return the amount a given lawmaker spent during a specified year and quarter in a specified category
#' @export
#'
#' @examples
#' \dontrun{
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
