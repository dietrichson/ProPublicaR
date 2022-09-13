#' Retrieve the relevant ProPublica API key for congress API or campaign finance API
#'
#' This function is primarily meant to be used by pp_query to determine the API keys if not passed explicitly.
#'
#' @param API Which API are you accessing
#'
#' @return the key from config.yml or global environment variables key_congress/key_campaign_finance
#' @import httr config
#' @export
#'
#' @examples
#' \dontrun{
#' retrieve_key('congress')
#' retrieve_key('campaign-finance')
#' }

retrieve_key <- function(API = c('congress', 'campaign-finance')){
  if (!is.null(config::get('ProPublica')[[API]])) {
    myAPI_Key <- config::get('ProPublica')[[API]]
  } else if (API == 'congress' && !is.null(.GlobalEnv$key_congress)) {
    myAPI_Key <- .GlobalEnv$key_congress
  } else if (API == 'campaign-finance' && !is.null(.GlobalEnv$key_campaign_finance)) {
    myAPI_Key <- .GlobalEnv$key_campaign_finance
  } else {
    stop(
      "
      API key not found or is missing. 
      
      1. Set a variable 'key_congress' to your API 
      key for the Congress API, and/or a variable 
      'key_campaign_finance' to your API key for the 
      Campaign Finance API. For example:
      
      key_congress <- 'my_key_123' 
      key_campaign_finance <- 'my_other_key_123' 
      
      2. Alternatively, set the same two variables 
      in a file called config.yml (in your working
      directory or higher). These variables should
      be under 'ProPublica' and be named 'congress'
      and 'campaign-finance' respectively.
      
      3. Finally, you may just include the key as
      an argument to each of your functions.
      "
    )
  }
  return(myAPI_Key)
}
