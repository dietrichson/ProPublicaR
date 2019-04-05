#' Get Votes by date range
#'
#' HTTP Requests: GET https://api.propublica.org/congress/v1/{chamber}/votes/{start-date}/{end-date}.json
#'
#' @param chamber house or senate
#' @param start_date YYYY-MM-DD format
#' @param end_date YYYY-MM-DD format
#' @inheritParams get_new_members
#' @importFrom lubridate is.Date
#' @return List of returned JSON from endpoint that retrieves all votes in a particular date range (fewer than 30 days)
#' s
#' @export
#'
#' @examples
#' \donttest{
#' get_votes_by_date_range('house', '2017-01-03', '2017-01-31')
#' }
get_votes_by_date_range <- function(chamber = c('house', 'senate'), 
                                    start_date, end_date, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  
  if(!lubridate::is.Date(as.Date(start_date))){
    stop("Incorrect startDate")
  }
  
  if(!lubridate::is.Date(as.Date(end_date))){
    stop("Incorrect endDate")
  }
  
  if(difftime(start_date, end_date) > 30){
    query <- sprintf("%s/votes/%s/%s.json", chamber, start_date, end_date)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("Range of two dates cannot exceed 30 days.")}
  
}
