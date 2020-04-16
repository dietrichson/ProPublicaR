#' Get Recent Official Communications by Category
#'
#' Get lists of official communications to Congress from the president, executive branch agencies and state legislatures to congressional committees.
#'
#' @param congress 114-116 for House, 96-116 for Senate
#' @param category ec, pm, pom
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results for the specified type: ec (Executive Communication), pm (Presidential Message) or pom (Petition or Memorial).
#' @export
#'
#' @examples
#' \donttest{
#' get_recent_official_communications_by_category(115, 'pm')
#' }
get_recent_official_communications_by_category <- function(congress, category, page = 1, myAPI_Key){
  API = 'congress'
  if(!congress %in% 96:cMaxCongress){
    stop("Incorrect congress, should be between 110 and ",cMaxCongress," for House. Between 96 and ",cMaxCongress," for Senate")
  }
  if(!category %in% c('ec', 'pm', 'pom')){
    stop("Incorrect category. Should be \'ec\', \'pm\' or \'pom\', lowercase")
  }
  query <- sprintf("%s/communications/category/%s.json", congress, category)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}