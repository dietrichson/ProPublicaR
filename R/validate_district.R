#' Validate that a district abbreviaton is correct
#'
#' @param us_district
#'
#' @return TRUE if correct FALSE otherwise
#' @export
#' @import stringr
#' @examples
#' validate_district(1)#TRUE
#' validate_district(111) #FALSE
#' validate_district(us_congressional_districts$district[1]) #FALSE
#' validate_district(as.numeric(us_congressional_districts$district_number[1])) #TRUE
validate_district <- function(us_district){
  if(!is.numeric(us_district))
    warning('District Abbreviation should be a numeric')
  us_district%in%us_congressional_districts$district_number
}
