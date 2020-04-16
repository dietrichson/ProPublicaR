#' Validate that a abbreviation is correct
#'
#' @param us_state State abbreviation (e.g. NY)
#'
#' @return TRUE if correct FALSE otherwise
#' @export
#' @import stringr
#' @examples
#' validate_state("MI")#TRUE
#' validate_state("IM") #FALSE
validate_state <- function(us_state){
  if(!is.character(us_state))
    warning('State Abbreviation should be a character')
  # Catch uppercase/lowercase error
  if(toupper(us_state)!=us_state)
    warning('State Abbreviation should be upper case.')
  if(stringr::str_length(us_state)!=2)
    warning('State abbreviations should be two letters.')
  
  state_abb <- c("AL","AK","AZ","AR","CA",
                 "CO","CT","DE","FL","GA","HI","ID",
                 "IL","IN","IA","KS","KY","LA","ME","MD",
                 "MA","MI","MN","MS","MO","MT","NE","NV",
                 "NH","NJ","NM","NY","NC","ND","OH","OK",
                 "OR","PA","RI","SC","SD","TN","TX","UT",
                 "VT","VA","WA","WV","WI","WY")
  us_state%in%state_abb
}
