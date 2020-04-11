#' Get House and Senate Floor Actions by Date
#'
#' To get the latest actions from the House or Senate floor, use the following function. HTTP Request: GET hhttps://api.propublica.org/congress/v1/{chamber}/floor_updates/{year}/{month}/{day}.json
#'
#' @param chamber house or senate 
#' @param year YYYY format
#' @param month MM format
#' @param day DD format
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results for that date and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_house_senate_floor_actions_by_date('senate', 2017, '05', '02')
#' }
get_house_senate_floor_actions_by_date <- function(chamber, year, month, day, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber %in% c('house', 'senate')){
    stop("Incorrect chamber. Should be \'senate\' or \'house'\ , lowercase")
  }
  if(nchar(year)!=4){
    stop("Incorrect year. Year should be four-digit year")  
  }
  query <- sprintf("%s/floor_updates/%s/%s/%s.json", chamber, year, month, day)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}