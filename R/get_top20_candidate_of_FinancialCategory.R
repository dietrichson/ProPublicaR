#' Get Top 20 Candidates in Specific Financial Category
#' 
#' HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/leaders/{category}
#'
#' @param category TOne of the values from the following categories:'candidate-loan', 'contribution-total', 'debts-owed', 'disbursements-total', 'end-cash', 'individual-total', 'pac-total', 'receipts-total' and 'refund-total'.
#' @param cycle The election cycle
#'
#' @return
#' @export
#'
#' @examples
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

