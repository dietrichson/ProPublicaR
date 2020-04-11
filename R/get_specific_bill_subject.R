#' Get a Specific Bill Subject
#'
#'Use this request type to search for bill subjects that contain a specified term. HTTP Request: GET https://api.propublica.org/congress/v1/bills/subjects/search.json
#'
#' @param subject a word or phrase to search
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves bill subjects that contain a specified term.
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_specific_bill_subject('meat')
#' }
get_specific_bill_subject <- function(subject, page = 1, myAPI_Key){
  API = 'congress'
  if(is.character(query)){
    query <- sprintf("bills/subjects/%s.json", subject)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
  } else {stop("query has to be character, 	a word or phrase to search")}
}
