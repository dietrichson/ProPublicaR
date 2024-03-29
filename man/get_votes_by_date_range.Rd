% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_votes_by_date_range.R
\name{get_votes_by_date_range}
\alias{get_votes_by_date_range}
\title{Get Votes by date range}
\usage{
get_votes_by_date_range(
  chamber = c("house", "senate"),
  start_date,
  end_date,
  page = 1,
  myAPI_Key
)
}
\arguments{
\item{chamber}{house or senate}

\item{start_date}{YYYY-MM-DD format}

\item{end_date}{YYYY-MM-DD format}

\item{page}{Results come in batches of 20. The page parameter specifies which one to retrieve.}

\item{myAPI_Key}{API key from Propublica To use the congress API, you must sign up for an API key.}
}
\value{
List of returned JSON from endpoint that retrieves all votes in a particular date range (fewer than 30 days)
s
}
\description{
HTTP Requests: GET https://api.propublica.org/congress/v1/{chamber}/votes/{start-date}/{end-date}.json
}
\examples{
\dontrun{
get_votes_by_date_range('house', '2017-01-03', '2017-01-31')
}
}
