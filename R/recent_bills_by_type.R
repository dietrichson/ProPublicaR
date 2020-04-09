#' Get Recent Bills
#'
#' For the current Congress, “recent bills” can be one of four types (see the descriptions below). For previous Congresses, “recent bills” means the last 20 bills of that Congress. In the responses, an active value of true means that the bill has seen action beyond introduction and committee referral. Requests include a chamber value; to get recent bills from the House and Senate, use both as the value. You can paginate through bills using the offset querystring parameter that accepts multiples of 20. Bills before the 113th Congress (prior to 2013) have fewer attribute values than those from the 113th Congress onward, because the more recent bill data comes from the bulk data provided by the Government Publishing Office. The order of the results depends on the value of type and all results are sorted in descending order. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/bills/{type}.json
#'
#' @param congress 105-116
#' @param chamber house, senate or both
#' @param type introduced (introduced_date), updated (latest_major_action_date), active (latest_major_action_date)
#' passed (latest_major_action_date), enacted (enacted), vetoed (vetoed).
#' @inheritParams get_new_members
#' 
#' @return summaries of the 20 most recent bills by type. The order of the results depends on the value of type and all results are sorted in descending order.
#' @export
#'
#' @examples
#' \donttest{
#' recent_bills_by_type(115, 'house', 'introduced')
#' }
recent_bills_by_type <- function(congress, chamber = c('house', 'senate', 'both'), type = c('introduced', 'updated', 'active', 'passed', 'enacted', 'vetoed'), myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate','both'))
    stop("Incorrect Chamber. Should be \'house\', \'senate\', or \'both\', lowercase.")
  if(!type%in%c('introduced', 'updated', 'active', 'passed', 'enacted', 'vetoed'))
    stop("Incorrect Chamber. Should be \'introduced\', \'updated\', \'active\', \'passed\', \'enacted\', \'vetoed\', lowercase.")
  if(!congress%in% 105:cMaxCongress)
    stop("Congress should be between 80 and ",cMaxCongress)
  
  query <- sprintf("%s/%s/bills/%s.json", congress, chamber, type)
  pp_query(query, API, myAPI_Key = myAPI_Key)
}
