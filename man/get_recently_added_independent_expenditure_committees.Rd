% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/get_recently_added_independent_expenditure_committees.R
\name{get_recently_added_independent_expenditure_committees}
\alias{get_recently_added_independent_expenditure_committees}
\title{Get Recently Added Independent Expenditure-Only Committees.}
\usage{
get_recently_added_independent_expenditure_committees(
  cycle = 2018,
  page = 1,
  myAPI_Key
)
}
\arguments{
\item{cycle}{The election cycle}

\item{page}{Results come in batches of 20. The page parameter specifies which one to retrieve.}

\item{myAPI_Key}{API key from Propublica To use the congress API, you must sign up for an API key.}
}
\value{
List of returned JSON from endpoint that retrieves the 20 most recently added FEC independent expenditure-only committees, known as “super PACs”.
}
\description{
HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/committees/superpacs
}
\examples{
\dontrun{
get_recently_added_independent_expenditure_committees(2016)
}
}
