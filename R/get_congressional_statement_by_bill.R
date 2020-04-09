#' Get Congressional Statements by Bill
#'
#' To get lists of statements published on a specific member’s congressional website during a particular congress, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}/statements.json
#'
#' @param congress 113-116
#' @param bill_id a bill slug, for example s19 - these can be found in bill responses.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_congressional_statement_by_bill(115, 's19')
#' }
get_congressional_statement_by_bill <- function(congress, bill_id, myAPI_Key){
  API = 'congress'
  if(!congress %in% 113:cMaxCongress){
    stop("Incorrect congress, should be 113 through 116")
  }
  if(!is.character(bill_id)){
    stop("bill_id has to be character")
  } else {
    query <- sprintf("%s/bills/%s/statements.json", congress, bill_id)
    pp_query(query, API, myAPI_Key = myAPI_Key)}
}