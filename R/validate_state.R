#' Validate that a abbreviaton is correct
#'
#' @param us_state
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
  us_state%in%state.abb
}
