#' Get Statement Subjects
#'
#'To get lists of subjects used to categorize congressional statements, use the following function. hese subjects are not automatically assigned but are manually curated by ProPublica, although they are based on legislative subjects produced by the Library of Congress. HTTP Request: GET https://api.propublica.org/congress/v1/statements/subjects.json
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
get_statement_subjects <- function(myAPI_Key){
  API = 'congress'
  query <- "statements/subjects.json"
  pp_query(query, API, myAPI_Key = myAPI_Key)
}