#' Get Recent Nominations by Category
#'
#' To get lists of presidential nominations for civilian positions,, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/nominees/{type}.json
#'
#' @param congress 107-116
#' @param type received, updated, confirmed, withdrawn
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves  the 20 most recent results for the specified type: received, updated, confirmed or withdrawn.
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_nominations_by_category(115, 'confirmed')
#' }
get_recent_nominations_by_category <- function(congress, type, myAPI_Key){
  API = 'congress'
  if(!congress %in% 107:cMaxCongress){
    stop("Incorrect congress, should be between 107 and ",cMaxCongress)
  }
  if(!type %in% c('received', 'updated', 'confirmed', 'withdrawn')){
    stop("Incorrect category. Should be \'received\', \'updated\', \'confirmed\' or \'withdrawn\', lowercase")
  }
  query <- sprintf("%s/nominees/%s.json", congress, type)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}