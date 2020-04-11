#' Get Upcoming Bills
#'
#'The responses include a legislative_day attribute which is the earliest the bills could be considered and a range attribute that indicates whether the bill information comes from a weekly schedule or a daily one. Combine the two for the best sense of when a bill might come up for consideration. For Senate bills, the response includes a context attribute reproducing the sentence that includes mention of the bill. These responses omit bills that have not yet been assigned a bill number or introduced, and additional bills may be considered at any time. HTTP Request: GET https://api.propublica.org/congress/v1/bills/upcoming/{chamber}.json
#'
#' @param chamber house or senate.
#' @inheritParams get_new_members
#' 
#' @return List of returned JSON from endpoint that retrieves details on bills that may be considered by the House or Senate in the near future, based on scheduled published or announced by congressional leadership.
#' 
#' @export
#'
#' @examples
#' \donttest{
#' get_upcoming_bills('senate')
#' }
get_upcoming_bills <- function(chamber, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate')){
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  } else {
    query <- sprintf("bills/upcoming/%s.json", chamber)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
    }
}
