#' Convert a ProPublica API result a Data Frame
#'
#' The function attempts to convert the result of a ProPublica API call to
#' a data.frame. If the result of the API call contains various parts, the
#' which_part parameter can be used to specify for which of these the conversion
#' is required. Typically the 'payload' resides in the 'results' field, which is the default, but
#' occasionally the summary and meta fields might be of interest.
#'
#' The function also replaces . (dot) with _ (underscore) in column names for
#' compatibility with database inserts (e.g. DBI::dbWriteTable)
#'
#' @param what Return value from one of the get_ functions.
#' @param which_part Which part are we converting. Defaults to 'results', but 'summary' and 'meta' may be useful in some cases.
#' @import dplyr
#' @return a data.frame
#' @export
#'
#' @examples
#' \donttest{
#' tmp <- get_candidates_in_race('MI','house',11)
#' pp_convert_to_data_frame(tmp)
#' pp_convert_to_data_frame(tmp,'summary')
#'
#' }
pp_convert_to_data_frame <- function(what, which_part=c('result','summary','meta')){
  UseMethod('pp_convert_to_data_frame')
}


#' @export
pp_convert_to_data_frame.pp_candidate_list <- function(what, which_part= c('results','summary', 'meta') ){
  if(!which_part[1]%in%c('results','summary','meta'))
    stop(paste(which_part[1],'Not supported'))

  if(which_part[1]=='results')
    tmp <- lapply(what[[which_part[1]]],function(x){
      as.data.frame(x[1])
    }) %>% bind_rows %>% as.data.frame

  if(which_part[1] == 'summary'){
    tmp <- lapply(what[['summary']], function(x)ifelse(is.null(x), NA, x))
  }

  if(which_part[1] == 'meta'){
    tmp$results <- NULL
    tmp$summary <- NULL
    tmp <- lapply(tmp, function(x)ifelse(is.null(x), NA, x))
  }

  tmp <- as.data.frame(tmp)

  tmp <- .fix_column_names(tmp)

  tmp
}

.fix_column_names <- function(tmp){
  names(tmp) <- stringr::str_replace_all(names(tmp),'\\.','_')
  tmp
}
