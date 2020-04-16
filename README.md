ProPublicaR
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/cognitoR)](https://cran.r-project.org/package=cognitoR)
[![Build
Status](https://travis-ci.org/chi2labs/cognitoR.svg?branch=master)](https://travis-ci.org/chi2labs/cognitoR)
<!-- badges: end -->

## Purpose

This package provides wrapper functions to access the ProPublica’s
Congress and Campaign Finance APIs. The Congress API provides near
real-time access to legislative data from the House of Representatives,
the Senate and the Library of Congress. The Campaign Finance API
provides data from United States Federal Election Commission filings and
other sources. The API covers summary information for candidates and
committees, as well as certain types of itemized data.

For more information about these APIs go to:
<https://www.propublica.org/datastore/apis>

## Installation

You can install from CRAN with:

``` r
install.packages("ProPublicaR")
```

Or from github with:

``` r
devtools::install_github("dietrichson/ProPublicaR")
```

## API Key

To access the data you will need an API key. Keys (free for limited
usage) are available at: <https://www.propublica.org/datastore/apis>.
