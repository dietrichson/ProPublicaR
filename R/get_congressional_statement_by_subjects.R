#' Get Congressional Statements by Subject
#'
#' To get lists of statements published on congressional websites for a particular subject, use the following function.These subjects are not automatically assigned but are manually curated by ProPublica, although they are based on legislative subjects produced by the Library of Congress. We advise using the statement search response for a more complete listing of statements about a keyword or phrase. HTTP Request: GET https://api.propublica.org/congress/v1/statements/subject/{subject}.json
#'
#' @param subject Slug version of subject
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves the 20 most recent results and supports pagination using multiples of 20.
#' @export
#'
#' @examples
#' \donttest{
#' get_statement_subjects()$results[[11]][3]
#' get_congressional_statement_by_subjects(get_statement_subjects()$results[[11]][3])
#' get_congressional_statement_by_subjects("Central Intelligence Agency")
#' }
get_congressional_statement_by_subjects <- function(subject, myAPI_Key){
  API = 'congress'
  query <- sprintf("statements/subject/%s.json", subject)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}