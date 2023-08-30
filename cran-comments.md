## Test environments
* Local Ubuntu 18.04 with R 4.2.3
* Ubuntu 20.04 (on travis-ci), R-oldrel, R-release, R-devel
* Rhub:
  Windows Server 2022, R-devel, 64 bit
  Ubuntu Linux 20.04.1 LTS, R-release, GCC
  Fedora Linux, R-devel, clang, gfortran
* win-builder (devel and release)

## R CMD check results
There were no ERRORs or WARNINGs. 

## Resubmission

This is a resubmission. In this version I have:

* Corrected an import statement to avoid reverse dependency issues with the config package