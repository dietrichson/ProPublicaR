#' Get Subjects for a Specific Bill
#'
#' HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}/subjects.json. Use this request type to get Library of Congress-assigned subjects about a particular bill.
#'
#' @param bill_id a bill slug, for example hr4881 - these can be found in the recent bill response.
#' @param congress 105-116
#' @inheritParams get_new_members
#'
#' @return  List of returned JSON from endpoint that retrieves the 20 most recent results and supports paginated requests.
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_subjects_for_bill(115, 'hr1628')
#' }
get_subjects_for_bill <- function(congress, bill_id, myAPI_Key){
  API = 'congress'
  if(!congress %in% 105:cMaxCongress){
    stop("Congress has to between 105 and ",cMaxCongress)
  }
  if(is.character(bill_id)){
    query <- sprintf("%s/bills/%s/subjects.json", congress, bill_id)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("bill_id has to be character")}
}