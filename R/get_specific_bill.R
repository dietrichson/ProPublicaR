#' Get a Specific Bill
#'
#'The attributes house_passage_vote and senate_passage_vote are populated (with the date of passage) only upon successful passage of the bill. Bills before the 113th Congress (prior to 2013) have fewer attribute values than those from the 113th Congress onward, because the more recent bill data comes from the bulk data provided by the Government Publishing Office. Details for the older bills came from scraping Thomas.gov, the former congressional site of the Library of Congress. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}.json
#'
#' @param bill_id a bill slug, for example hr4881 - these can be found in the recent bill response.
#' @param congress 105-116
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves details about a particular bill, including actions taken and votes
#' @export
#'
#' @examples
#' \donttest{
#' get_specific_bill(115, 'hr21')
#' }
get_specific_bill <- function(congress, bill_id, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 105:cMaxCongress){
    stop("Congress is sould be between 105 and ",cMaxCongress)
  }
  if(is.character(bill_id)){
  query <- sprintf("%s/bills/%s.json", congress, bill_id)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("bill_id has to be character")}
}
