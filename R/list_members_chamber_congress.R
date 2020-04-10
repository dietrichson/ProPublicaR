#' To get a list of members of a particular chamber in a particular Congress
#'
#'The results include all members who have served in that congress and chamber, including members who are no longer in office. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
#'
#' @param congress 102-116 for House, 80-116 for Senate
#' @param chamber house or senate
#' @inheritParams get_new_members
#'
#' @return list of members of a particular chamber in a particular Congress
#' @export
#'
#' @examples
#' \donttest{
#' list_members_chamber_congress(115, 'senate')
#' }
list_members_chamber_congress <- function(congress, chamber, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for House")
  }
  if(chamber=="senate" & !congress %in% 80:cMaxCongress){
    stop("Congress should be between 80 and ",cMaxCongress," for Senate")
  }
  query <- sprintf("%s/%s/members.json", congress, chamber)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
