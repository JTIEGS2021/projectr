## ---------------------------
## Name: util
## Purpose: Source all utility files
## Author: Jacob Tiegs
## Date Created: 2022-03-31
##
## ---------------------------
## Notes:
##
##
## ---------------------------
## Packages:
require(tidyverse)

##
## ---------------------------
## Functions:

## ---------------------------

## Load source files
f <- list.files(here("r"), recursive = TRUE, full.names = TRUE) %>%
    str_match(".*r$")



f <- f[!is.na(f)]
f <- f[!str_detect(f,"util.r|main")]

sapply(f, source)

