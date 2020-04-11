#' Execute a query against the ProPublica API
#'
#' This function is primarily meant to be used by other functions in the package, but is made available in case a
#' "raw query" is required.
#'
#' @param query The query to be executed
#' @param API Which API are you accessing
#' @param version API version. Currently v1.
#' @inheritParams get_new_members
#'
#' @return a list object with the return values.
#' @import httr config
#' @export
#'
#' @examples
#' \donttest{
#' pp_query('115/bills/hr21.json', API = 'congress', version='v1')
#' pp_query('2018/races/MI/house/11.json', API='campaign-finance',version='v1')
#' }
pp_query <- function(query, API=c('campaign-finance', 'congress'), version='v1', page = 1, myAPI_Key){
  # First check that API-key is available
  errorMessage <-"API key not found or is missing. \nHint: This should be in config.yml in your working directory or higher."
  if( missing(myAPI_Key) && is.null(config::get('ProPublica')[[API]])){
    stop(errorMessage)
  }
  if(missing(myAPI_Key) && !is.null(config::get('ProPublica')[[API]])){
    myAPI_Key <- config::get('ProPublica')[[API]]  
  }
  
  if(is.null(myAPI_Key))
    stop(errorMessage)
  
  # Construct URL
  myURL <-
    switch (API,
            'campaign-finance' = 'https://api.propublica.org/campaign-finance/',
            'congress' = 'https://api.propublica.org/congress/',
            NULL #defaults
    )
  if(is.null(myURL)) stop('API not supported.')
  myURL <- paste0(myURL,version,'/',query)
  
  if(page>1){
    offset = 20 * (page - 1)
    if(grepl("\\?query=|\\?q=", myURL)){
      myURL <- paste0(myURL, "&offset=", offset)
    } else {
      myURL <- paste0(myURL, "?offset=", offset)
    }
  }

  #print( paste0("pp_query called with URL: ", myURL) )
  #print( paste0("API-key: ", myAPI_Key) )
  GET(myURL, add_headers('X-API-KEY'= myAPI_Key),content_type_json() ) -> tmp
  if(tmp$status_code !=200){
    warning('Status code was: ',tmp$status_code)
    warning(content(tmp)$message)
  }
  content(tmp)
}
