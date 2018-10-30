#' Get Votes by date range
#'
#' HTTP Requests: GET https://api.propublica.org/congress/v1/{chamber}/votes/{start-date}/{end-date}.json
#'
#' @param chamber house or senate
#' @param start_date YYYY-MM-DD format
#' @param end_date YYYY-MM-DD format
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves all votes in a particular date range (fewer than 30 days)
#' s
#' @export
#'
#' @examples
#' \dontrun{
#' get_votes_by_date_range('house', '2017', '01', '03', '2017','01', '31')
#' }
get_votes_by_date_range <- function(chamber = c('house', 'senate'), start_year, start_month, start_day, end_year, end_month, end_day, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(nchar(start_year)!=4){
    stop("Incorrect start_year. Year should be four-digit year")  
  }
  sep <- "-"
  start_date <- paste0(start_year, sep, start_month, sep, start_day)
  end_date <- paste0(end_year, sep, end_month, sep, end_day)
  if(difftime(start_date, end_date) < 31){
    query <- sprintf("%s/votes/%s/%s.json", chamber, start_date, end_date)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  } else {stop("Range of two dates cannot exceed 30 days.")}
  
}
