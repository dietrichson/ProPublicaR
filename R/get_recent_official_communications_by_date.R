#' Get Recent Official Communications by Date
#'
#' o get lists of official communications to Congress on a specific date, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/communications/category/{category}.json
#'
#' @param year yyyy format
#' @param month mm format
#' @param day dd format
#'  @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results for the specified type: ec (Executive Communication), pm (Presidential Message) or pom (Petition or Memorial).
#' @export
#'
#' @examples
#' \dontrun{
#' get_recent_official_communications_by_date(2018, '03', '21')
#' }
get_recent_official_communications_by_date <- function(year, month, day, myAPI_Key){
  API = 'congress'
  if(nchar(year)!=4){
    stop("Incorrect year. Year should be four-digit year")  
  }
  sep <- "-"
  date <- paste0(year, sep, month, sep, day)
  query <- sprintf("communications/date/%s.json", date)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}