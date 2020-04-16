## Test environments
* Locale Ubuntu 18.04 with R 3.5.3
* Ubuntu 18.04 (on travis-ci), R-oldrel, R-release, R-devel
* Rhub:
  Build ID:	ProPublicaR_1.1.1.tar.gz-578dafa56bbb46738526610442095e3b
  Platform:	Windows Server 2008 R2 SP1, R-devel, 32/64 bit
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

## Resubmission

This is a resubmission. In this version I have:

* Removed offending top-level files
* Updated to stable version 1.1.1
* Allowed for paging where this was missing
* Allowed for search in current congress
* Some updates to documentation