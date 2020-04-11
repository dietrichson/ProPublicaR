#' Get Recent Official Communications
#'
#' To get lists of official communications to Congress from the president, executive branch agencies and state legislatures to congressional committees, use the following function. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/communications.json
#'
#' @param congress 114-116 for House, 96-116 for Senate
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent official communications to Congress from the president, executive branch agencies and state legislatures to congressional committees. The data covers communications to the House of Representatives since 2015, and communications to the Senate since 1979.
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_official_communications(115)
#' }
get_recent_official_communications <- function(congress, myAPI_Key){
  API = 'congress'
  if(!congress %in% 96:cMaxCongress){
    stop("Incorrect congress, should be 110 to ",cMaxCongress,
         " for House or 96 to ",cMaxCongress, "mfor Senate")
  }
  query <- sprintf("%s/communications.json", congress)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}