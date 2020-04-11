#' Get Recent House and Senate Floor Actions
#'
#' To get the latest actions from the House or Senate floor, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/floor_updates.json
#'
#' @param congress 	114-116 for House, 96-116 for Senate
#' @param chamber house or senate 
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20. The date attribute represents the “legislative day” in which the action took place (actions that occur after midnight often are part of the previous day’s activity).
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_house_senate_floor_actions(115, 'house')
#' }
get_recent_house_senate_floor_actions <- function(congress, chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber %in% c('house', 'senate')){
    stop("Incorrect chamber. Should be \'senate\' or \'house'\ , lowercase")
  }
  query <- sprintf("%s/%s/floor_updates.json", congress, chamber)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}