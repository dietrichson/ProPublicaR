#' Get Electronic Filings By Type
#'
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/types/{form-type-id}
#' 
#' @param cycle The election cycle
#' @param form_type_id F + integer. To get form type IDs, use an electronic filing form types request.
#' @inheritParams get_new_members
#'
#' @return  List of returned JSON from endpoint that retrieves a list of available form types for FEC electronic filings.
#' @export
#'
#' @examples
#' \donttest{
#' get_electronic_filing_by_types(2016, 'F24')
#' get_electronic_filing_by_types(2016, 
#' matrix(unlist(get_electronic_filing_form_types(2016)$results), 
#' ncol = 2, byrow = TRUE)[8])
#'#' }
get_electronic_filing_by_types <- function(cycle=2018, form_type_id, page = 1, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle)){
    stop("Incorrect cycle")
  }
  if(cycle < 2001){
    stop("Incorrect cycle: the electronic filings are 2001-forward")}
  if(!is.character("form_type_id")){
    stop("form_type_id has to be character")
  }
  query <- sprintf("%s/filings/types/%s.json", cycle, form_type_id)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
