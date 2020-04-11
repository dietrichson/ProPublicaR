#' Get Recent Late Contributions by Date
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/contributions/48hour/{year}/{month}/{day}
#'
#' @param cycle The election cycle
#' @param year The four-digit year from 2010-2018, match cycle
#' @param month The two-digit month from 01-12
#' @param day The two-digit day from 01-31
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves late contributions from a specific dates for a given campaign cycle from the campaign-finance API from ProPublica. 
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_late_contributions_date(2016, year = 2016, month = '09', day = '07')
#' }
get_recent_late_contributions_date <- function(cycle=2018, year, month, day, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(cycle != year)
    stop("Specified year does not match cycle")
  if(cycle >= 2010 & cycle %% 2 == 0){
    query <- sprintf("%s/contributions/48hour/%s/%s/%s.json", cycle, year, month, day)
    pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
    } else {stop("Cycle must be even-numbered year between 2010 and 2018")}
}
