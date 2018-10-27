#' To get a list of members of a particular chamber in a particular Congress
#'
#'The results include all members who have served in that congress and chamber, including members who are no longer in office. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
#'
#' @param congress 102-115 for House, 80-115 for Senate
#' @param chamber house or senate
#' @param myAPI_Key  use the congress API, you must sign up for an API key. The API key must be included in all API requests to the server, set as a header.
#'
#' @return list of members of a particular chamber in a particular Congress
#' @export
#'
#' @examples
#' \dontrun{
#' list_members_chamber_congress(115, 'senate')
#' }
list_members_chamber_congress <- function(congress, chamber, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:115){
    stop("Congress is 102-115 for house")
  }
  if(chamber=="senate" & !congress %in% 80:115){
    stop("Congress is 102-115 for senate")
  }
  query <- sprintf("%s/%s/members.json", congress, chamber)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
