#' Validate that year cycle is correct
#'
#' @param cycle An election cycle (e.g. 2018)
#'
#' @return TRUE if correct FALSE otherwise
#' @export
#' @import stringr
#' @examples
#' validate_cycle(1996)#TRUE
#' validate_cycle(1979)#FALSE
#' validate_cycle(16) #FALSE
validate_cycle <- function(cycle) {
  if (!is.numeric(cycle))
    stop("Cycle should be numeric")
  if (nchar(cycle) != 4) {
    warning("Cycle should be four-digit year")
    }
  if (nchar(cycle) == 4 & cycle < 1996) {
    warning("Cycle should be four-digit year larger than 1996")
  }
  if (cycle > 1996 & cycle %% 2 != 0)
    warning("Cycle should be even-numbered year larger than 1996")
  cycle >= 1996 & cycle %% 2 == 0
}