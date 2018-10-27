#' Get a Specific Bill Subject
#'
#'Use this request type to search for bill subjects that contain a specified term. HTTP Request: GET https://api.propublica.org/congress/v1/bills/subjects/search.json
#'
#' @param query a word or phrase to search
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves bill subjects that contain a specified term.
#' 
#' @export
#'
#' @examples
#' \dontrun{
#' get_specific_bill_subject('meat')
#' }
get_specific_bill_subject <- function(query, myAPI_Key){
  API = 'congress'
  if(is.character(query)){
    query <- sprintf("bills/subjects/%s.json", subject)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("query has to be character, 	a word or phrase to search")}
}
