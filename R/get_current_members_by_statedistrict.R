#' Get Current Members by State/District
#' 
#' Senate Request: GET https://api.propublica.org/congress/v1/members/{chamber}/{state}/current.json
#' House Request: GET https://api.propublica.org/congress/v1/members/{chamber}/{state}/{district}/current.json
#'
#' @param state Two-letter state abbreviation
#' @param chamber house or senate
#' @param district House of Representatives district number (House requests only). For states with at-large districts (AK, DE, MT, ND, SD, VT, WY), territories (GU, AS, VI, MP), commonwealths (PR) and the District of Columbia, use a district value of 1.
#' @inheritParams get_new_members
#'
#' @return  List of returned JSON from endpoint that retrieves biographical and Congressional role information for a particular member of Congress by State/District
#' @export
#'
#' @examples
#' \donttest{
#' get_current_members_by_statedistrict( 'MI', 'house', 11)
#' get_current_members_by_statedistrict( 'RI', 'senate')
#' }
get_current_members_by_statedistrict<- function(state, chamber, district, page = 1, myAPI_Key){
  API = 'congress'
  if(!validate_state(state))
    stop("Incorrect state")
  if(!chamber%in%c('house','senate'))
    stop('Incorrect Chamber. (Should be \'house\' or \'senate\', lowercase.')
  if(chamber == 'senate'){
    # These are the at-large districts
    candidatesURL <- sprintf('members/%s/%s/current.json',
                             chamber,state)
  } else{
    if(!validate_district(district)){
      stop("Incorrect district")
    }else{candidatesURL <- sprintf('members/%s/%s/%s/current.json', chamber,state,district)}
  }
  pp_query(candidatesURL, API, page = page, myAPI_Key = myAPI_Key)
}
