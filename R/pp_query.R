#' Execute a query against the ProPublica API
#'
#' This function is primarily meant to be used by other functions in the package, but is made available in case a
#' "raw query" is required.
#'
#' @param query The query to be executed
#' @param API Which API are you accessing
#' @param version API version. Currently v1.
#'
#' @return a list object with the return values.
#' @import httr config
#' @export
#'
#' @examples
#' \dontrun{
#' pp_query('2018/races/MI/house/11.json',version='v1')
#' pp_query('2018/races/MI/house/11.json',API='campaign-finance',version='v1')
#' }
pp_query <- function(query, API=c('campaign-finance', 'congress'), version='v1', myAPI_Key){
  # First check that API-key is available
  if (missing(myAPI_Key)) {
    myAPI_Key <- config::get('ProPublica')[[API]] # config::get('ProPublica')[[1]] # config::get('ProPublica')[['campaign-finance']] #
  }

  if(is.null(myAPI_Key))
    stop("API key not found. \nHint: This should be in config.yml in your working directory or higher.")
  # Construct URL
  myURL <-
    switch (API,
            'campaign-finance' = 'https://api.propublica.org/campaign-finance/',
            'congress' = 'https://api.propublica.org/congress/',
            NULL #defaults
    )
  if(is.null(myURL)) stop('API not supported.')
  myURL <- paste0(myURL,version,'/',query)
  GET(myURL, add_headers('X-API-KEY'= myAPI_Key),content_type_json() ) -> tmp
  if(tmp$status_code !=200){
    warning('Status code was: ',tmp$status_code)
    warning(content(tmp)$message)
  }
  content(tmp)
}
