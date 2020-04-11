#' Get Recent Votes
#'
#'You can get recent votes from the House, Senate or both chambers using this request. This request returns the 20 most recent results, sorted by date and roll call number, and you can paginate through votes using the offset querystring parameter that accepts multiples of 20. HTTP Request: GET https://api.propublica.org/congress/v1/{chamber}/votes/recent.json
#'
#' @param chamber 	house, senate or both.
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves  the 20 most recent votes from the House, Senate or both chambers 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_votes('senate')
#' }
get_recent_votes <- function(chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber %in% c('house', 'senate', 'both')){
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  }
  query <- sprintf("%s/votes/recent.json", chamber)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}