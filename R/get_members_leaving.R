#' Get Members Leaving Office
#' 
#' To get a list of members who have left the Senate or House or have announced plans to do so. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/members/leaving.json
#'
#' @param congress 111-116
#' @param chamber house or senate
#' @inheritParams get_new_members
#'
#' @return  List of returned JSON from endpoint that retrieves a list of members who have left the Senate or House
#' @export
#'
#' @examples
#' \donttest{
#' get_members_leaving(115, 'house')
#' }
get_members_leaving <- function(congress, chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop('Incorrect Chamber. (Should be \'house\' or \'senate\', lowercase.')
  if(!congress%in% 111:cMaxCongress)
    stop('Incorrect congress. Should be between 111 and ', cMaxCongress)
  query <- sprintf("%s/%s/members/leaving.json", congress, chamber)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
