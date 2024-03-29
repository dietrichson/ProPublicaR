% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_specific_bill_subject.R
\name{get_specific_bill_subject}
\alias{get_specific_bill_subject}
\title{Get a Specific Bill Subject}
\usage{
get_specific_bill_subject(subject, page = 1, myAPI_Key)
}
\arguments{
\item{subject}{a word or phrase to search}

\item{page}{Results come in batches of 20. The page parameter specifies which one to retrieve.}

\item{myAPI_Key}{API key from Propublica To use the congress API, you must sign up for an API key.}
}
\value{
List of returned JSON from endpoint that retrieves bill subjects that contain a specified term.
}
\description{
Use this request type to search for bill subjects that contain a specified term. HTTP Request: GET https://api.propublica.org/congress/v1/bills/subjects/search.json
}
\examples{
\dontrun{
get_specific_bill_subject('meat')
}
}
