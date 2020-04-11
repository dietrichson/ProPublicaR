#' Get a Specific Roll Call Vote
#'
#' To get a specific roll-call vote, including a complete list of member positions. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/sessions/{session-number}/votes/{roll-call-number}.json
#'
#' @param congress 102-116 for House, 80-116 for Senate
#' @param chamber house or senate
#' @param session_number 1 or 2, depending on year (1 is odd-numbered years, 2 is even-numbered years)
#' passed (latest_major_action_date), enacted (enacted), vetoed (vetoed).
#' @param roll_call_number integer
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves a specific roll-call vote
#' s
#' @export
#'
#' @examples
#' \donttest{
#' get_specific_roll_call_vote(115, 'senate', 1, 17L)
#' }
get_specific_roll_call_vote <- function(congress, chamber = c('house', 'senate'), session_number, roll_call_number, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for House")
  }
  if(chamber=="senate" & !congress %in% 80:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for Senate")
  }
  if(!session_number %in% 1:2)
    stop("Incorrect session_number, has to be	1 or 2, depending on year (1 is odd-numbered years, 2 is even-numbered years)")
  if(!is.integer(roll_call_number)){
    stop("roll_call_number has to be integer")
  } else {
    query <- sprintf("%s/%s/sessions/%s/votes/%s.json", congress, chamber, session_number, roll_call_number)
    pp_query(query, API, myAPI_Key = myAPI_Key)
  }

}
