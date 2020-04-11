#' Get Votes by Type
#'
#' You can get vote information in four categories: missed votes, party votes, lone no votes and perfect votes. Missed votes provides information about the voting attendance of each member of a specific chamber and congress. Party votes provides information about how often each member of a specific chamber and congress votes with a majority of his or her party. Lone no votes provides information lists members in a specific chamber and congress who were the only members to vote No on a roll call vote, and how often that happened. Perfect votes lists members in a specific chamber and congress who voted Yes or No on every vote for which he or she was eligible. HTTP Request: GET https://api.propublica.org/congress/v1/{congress}/{chamber}/votes/{vote-type}.json
#'
#' @param congress 102-116 for House, 80-116 for Senate
#' @param chamber house or senate
#' @param vote_type missed, party, loneno or perfect
#' @inheritParams get_new_members
#'
#' @return List of returned JSON from endpoint that retrieves a types of votes of each member of a specific chamber and congress.
#' s
#' @export
#'
#' @examples
#' \donttest{
#' get_votes_by_type(114, 'house', 'missed')
#' }
get_votes_by_type <- function(congress, chamber = c('house', 'senate'), vote_type, page = 1, myAPI_Key){
  API = 'congress'
  if(!chamber%in%c('house','senate'))
    stop("Incorrect Chamber. Should be \'house\' or \'senate\', lowercase.")
  if(chamber=="house" & !congress %in% 102:cMaxCongress){
    stop("Congress should be between 102 and ", cMaxCongress, " for house")
  }
  if(chamber=="senate" & !congress %in% 80:cMaxCongress){
    stop("Congress should be between 102 and ",cMaxCongress," for senate")
  }
  if(!vote_type %in% c('missed', 'party', 'loneno', 'perfect'))
    stop("Incorrect session_number, has to be	1 or 2, depending on year (1 is odd-numbered years, 2 is even-numbered years)")
  query <- sprintf("%s/%s/votes/%s.json", congress, chamber,vote_type)
  pp_query(query, API, page = page, myAPI_Key = myAPI_Key)
}
