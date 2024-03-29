% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_electronic_filing_by_committees.R
\name{get_electronic_filing_by_committees}
\alias{get_electronic_filing_by_committees}
\title{Search for Electronic Filings by committee name o partial name}
\usage{
get_electronic_filing_by_committees(NAME, cycle = 2018, page = 1, myAPI_Key)
}
\arguments{
\item{NAME}{The committee name or partial name}

\item{cycle}{The election cycle}

\item{page}{Results come in batches of 20. The page parameter specifies which one to retrieve.}

\item{myAPI_Key}{API key from Propublica To use the congress API, you must sign up for an API key.}
}
\value{
List of returned JSON from endpoint that retrieves information about FEC reports filed electronically by a committee for a given campaign cycle from the campaign-finance API from ProPublica.
}
\description{
HTTP Request: GET https://api.propublica.org/campaign-finance/v1/{cycle}/filings/search
}
\examples{
\dontrun{
get_electronic_filing_by_committees(NAME = "UNITED EGG", 2016)
}
}
