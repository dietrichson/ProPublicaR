#' Get Candidates in Race
#'
#' @param cycle The election cycle in question, e.g. 2018
#' @param state State abbreviation
#' @param chamber hourse or senate
#' @param district house district
#' @param return_value should results be retrieved, or query string returned.
#'
#' @return The result of the API call (list), unless \code{return_value=query} (mostly for debugging), in which case the query string is returned.
#' @export
#'
#' @examples
#' \dontrun{
#' get_candidates_in_race(2018, 'MI', 'house', 11)
#' }
get_candidates_in_race <- function(state, chamber, district, cycle=2018, return_value=c('results','query')){
  if(!validate_state(state))
    stop("Incorrect state")
  if(!chamber%in%c('house','senate'))
    stop('Incorrect Chamber. (Should be \'house\' or \'senate\' (lowercase).')
  query <- candidatesURL <- sprintf('%s/races/%s/%s/%s.json',
                                    cycle,state,chamber,district)
  if(return_value[1]=='query')
    return(query)
  pp_query(query)
}
