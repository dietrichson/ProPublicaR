#' Validate that year is correct
#'
#' @param cycle
#'
#' @return TRUE if correct FALSE otherwise
#' @export
#' @import stringr
#' @examples
#' validate_cycle(1979)#TRUE
#' validate_cycle(1979)#FALSE
#' validate_cycle(16) #FALSE
validate_cycle <- function(cycle){
  if(!is.numeric(cycle)){
    warning('Cycle should be even-numbered year')
  }
  if(nchar(cycle)!=4){
    warning('Cycle should be four-digit year')  
  }
  if(cycle<1996){
    warning('Cycle should be four-digit year largest than 1996')
  }
  cycle >= 1996

}

