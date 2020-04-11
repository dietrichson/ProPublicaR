#' Get Recent Official Communications by Date
#'
#' o get lists of official communications to Congress on a specific date, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/communications/category/{category}.json
#'
#' @param year yyyy format
#' @param month mm format
#' @param day dd format
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results for the specified type: ec (Executive Communication), pm (Presidential Message) or pom (Petition or Memorial).
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_official_communications_by_date(2018, '03', '21')
#' }
get_recent_official_communications_by_date <- function(year, month, day, page = 1, myAPI_Key){
  API = 'congress'
  if(nchar(year)!=4){
    stop("Incorrect year. Year should be four-digit year")  
  }
  sep <- "-"
  date <- paste0(year, sep, month, sep, day)
  query <- sprintf("communications/date/%s.json", date)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}