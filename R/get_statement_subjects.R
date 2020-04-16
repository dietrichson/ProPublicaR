#' Get Statement Subjects
#'
#'Get lists of subjects used to categorize congressional statements, use the following function. 
#'These subjects are not automatically assigned but are manually curated by ProPublica, although 
#'they are based on legislative subjects produced by the Library of Congress. 
#'
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves all of the subjects that have been used at least once.
#' @export
#'
#' @examples
#' \donttest{
#' get_statement_subjects()
#' }
get_statement_subjects <- function(page = 1, myAPI_Key){
  API = 'congress'
  query <- "statements/subjects.json"
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}