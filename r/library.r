## ---------------------------
## Name: Library
## Purpose: Contains all libraries to load with app start
## Author: Jacob Tiegs
## Date Created: 2022-03-30
##
## ---------------------------
## Notes:
##
##
## ---------------------------
##
## ---------------------------
## Functions:

## ---------------------------

## require(tidyverse)
## require(shiny)
## require(here)
## require(writexl)
## require(readxl)
## require(openxlsx)
## require(lubridate)

list.of.packages <- c("tidyverse", "shiny", "here", "writexl", "readxl", "openxlsx", "lubridate")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
