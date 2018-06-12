#' Get Amendments for a Specific Bill
#'
#'
#' @param bill_id a bill slug, for example hr4881 - these can be found in the recent bill response.
#' @param congress 105-115
#'
#' @return the 20 most recent results and supports paginated requests.
#' @export
#'
#' @examples
#' \dontrun{
#' get_amendments_bill(115, 'hr1628')
get_amendments_bill <- function(congress, bill_id, myAPI_Key){
  API = 'congress'
  #HTTP Request
  #GET https://api.propublica.org/congress/v1/{congress}/bills/{bill-id}/amendments.json
  if (missing(myAPI_Key)) {
    myAPI_Key <- config::get('ProPublica')[[API]] #config::get('ProPublica')[[1]]
  }
  if(is.null(myAPI_Key))
    stop("API key not found. \nHint: This should be in config.yml in your working directory or higher.")
  query <- sprintf("%s/bills/%s/amendments.json", congress, bill_id)
  pp_query(query, API)
}
