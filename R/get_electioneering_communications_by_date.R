#'Get Electioneering Communications by Date
#'
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/electioneering_communications/{year}/{month}/{day}
#'
#' @param cycle The election cycle
#' @param year The four-digit year from 2008-2016.
#' @param month The two-digit month from 01-12
#' @param day The two-digit day from 01-31
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves all broadcast advertisements that identify one or more federal candidates (and have aired 30 days before a primary election and 60 days before the general election) from a specific date.
#'
#' @export
#'
#' @examples
#' \donttest{
#' get_electioneering_communications_by_date(2016, 2012, '10', '01')
#' }
get_electioneering_communications_by_date <- function(cycle=2018, year, month, day, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(nchar(year)!=4){
    stop("Year should be four-digit year")  
  }
  if(nchar(year) == 4 & year < 2008){
    stop("Year should be four-digit year larger than 2008")
  }
  query <- sprintf("%s/electioneering_communications/%s/%s/%s.json", cycle, year, month, day)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
