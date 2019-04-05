#'Get Quarterly Office Expenses by a Specific House Member
#'
#'The House of Representatives publishes quarterly reports detailing official office expenses by lawmakers. The Congress API has data beginning in the third quarter of 2009.  HTTP Request: GET https://api.propublica.org/congress/v1/members/{member-id}/office_expenses/{year}/{quarter}.json
#'
#' @param member_id	The ID of the member to retrieve; it is assigned by the Biographical Directory of the United States Congress or can be retrieved from a member list request.l
#' @param year 2009-2017
#' @param quarter 1,2,3,4
#' @inheritParams get_new_members
#'
#' @return  the amount a given lawmaker spent during a specified year and quarter by category,
#' @export
#'
#' @examples
#' \donttest{
#' get_quarter_office_expenses_house_member('A000374', 2017, 4)
#' }
get_quarter_office_expenses_house_member <- function(member_id, year, quarter, myAPI_Key){
  API = 'congress'
  if(!quarter %in% 1:4){
    stop("Incorret quarter. Has to be 1, 2, 3 or 4.")
  }
  if(nchar(year)!=4){
    stop("Year should be four-digit year")  
  }
  if(!is.character(member_id)){
    stop("member_id has to be character")
  } else {if(2008 < year & year < 2018){
    query <- sprintf("members/%s/office_expenses/%s/%s.json", member_id, year, quarter)
    pp_query(query, API, myAPI_Key = myAPI_Key)}
    }
}
