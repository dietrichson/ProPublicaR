% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_recent_electioneering_communications.R
\name{get_recent_electioneering_communications}
\alias{get_recent_electioneering_communications}
\title{Get Recent Electioneering Communications}
\usage{
get_recent_electioneering_communications(cycle = 2018, page = 1, myAPI_Key)
}
\arguments{
\item{cycle}{The election cycle}

\item{page}{Results come in batches of 20. The page parameter specifies which one to retrieve.}

\item{myAPI_Key}{API key from Propublica To use the congress API, you must sign up for an API key.}
}
\value{
List of returned JSON from endpoint that retrieves the 20 most recent broadcast advertisements that identify one or more federal candidates (and have aired 30 days before a primary election and 60 days before the general election).
}
\description{
HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/electioneering_communications
}
\examples{
\dontrun{
get_recent_electioneering_communications(2016)

}
}
