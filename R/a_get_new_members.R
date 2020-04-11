#' Get New Members
#' 
#' To get a list of the most recent new members of the current Congress. 
#' HTTP Request: GET https://api.propublica.org/congress/v1/members/new.json
#'
#' @param myAPI_Key API key from Propublica To use the congress API, you must sign up for an API key.
#' @param page Results come in batches of 20. The page parameter specifies which one to retrieve.
#' @return List of returned JSON from endpoint that retrieves a list of the most recent new members of the current Congress
#' @export
#'
#' @examples
#' \donttest{
#' get_new_members()
#' }
get_new_members <- function(page = 1, myAPI_Key){
  API = 'congress'
  query <- sprintf("members/new.json")
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
