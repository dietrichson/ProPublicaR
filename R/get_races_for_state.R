#' Get all Candidates in a State for an Election Cycle
#'
#' @param state The State (US) of the election
#' @param cycle Which election cycle (e.g. 2018)
#'
#' @return the result of the API call.
#' @export
#'
#' @examples
#' \dontrun{
#' get_races_for_state('DE')
#' get_races_for_state('DE', 2016)
#' }
get_races_for_state <- function(state, cycle=2018){
  if(!validate_state(state))
    stop("Incorrect State.")
  query <- sprintf('%s/races/%s.json',cycle,state)

  pp_query(query)
  #query
}
