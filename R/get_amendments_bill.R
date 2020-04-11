#' Get Amendments for a Specific Bill
#'
#' HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}/amendments.json. Use this request type to get Library of Congress-assigned subjects about a particular bill. 
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
#' get_amendments_bill(115, 'hr1628')
#' }
get_amendments_bill <- function(congress, bill_id, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 105:cMaxCongress){
    stop("Congress should be between 105 and" ,cMaxCongress)
  }
  if(is.character(bill_id)){
  query <- sprintf("%s/bills/%s/amendments.json", congress, bill_id)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("bill_id has to be character")}
}
