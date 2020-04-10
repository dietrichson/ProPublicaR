#' Get Cosponsors for a Specific Bill
#'
#' HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}/cosponsors.json. Use this request type to get Library of Congress-assigned subjects about a particular bill. 
#'
#' @param bill_id a bill slug, for example hr4881 - these can be found in the recent bill response.
#' @param congress 105-116
#' @inheritParams get_new_members
#'
#' @return  List of returned JSON from endpoint that retrieves information about the cosponsors of a particular bill
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_cosponsors_specific_bill(114, 'hr4249')
#' }
get_cosponsors_specific_bill <- function(congress, bill_id, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 105:cMaxCongress){
    stop("Congress has to be between 105 and ", maxCongress)
  }
  if(is.character(bill_id)){
    query <- sprintf("%s/bills/%s/cosponsors.json", congress, bill_id)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("bill_id has to be character")}
}
