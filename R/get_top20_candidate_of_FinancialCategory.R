#' Get Top 20 Candidates in Specific Financial Category
#' 
#' https://www.propublica.org/datastore/apis
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/leaders/{category}
#'
#' @param category One of the values from the following categories:'candidate-loan', 'contribution-total', 'debts-owed', 'disbursements-total', 'end-cash', 'individual-total', 'pac-total', 'receipts-total' and 'refund-total'.
#' @param cycle The election cycle
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves a specific FEC candidate for a given campaign cycle.
#' @export
#'
#' @examples
#' \donttest{
#' get_top20_candidate_of_FinancialCategory('pac-total', 2016)
#' }
get_top20_candidate_of_FinancialCategory <- function(category, cycle=2018, myAPI_Key){
  API = 'campaign-finance'
  if(!validate_cycle(cycle))
    stop("Incorrect cycle")
  if(is.character(category) & category %in% c('candidate-loan', 'contribution-total', 'debts-owed', 'disbursements-total'
                                              , 'end-cash', 'individual-total', 'pac-total', 'receipts-total',
                                              'refund-total')){
    query <- sprintf("%s/candidates/leaders/%s.json", cycle,category)
    pp_query(query, API,  myAPI_Key = myAPI_Key)
  } else stop("Incorrect Category")
    
}

