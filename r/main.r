## ---------------------------
## Name: Main
## Purpose: Main workflow for the excel based workflow
## Author: Jacob Tiegs
## Date Created: 2022-04-08
##
## ---------------------------
## Notes:
##
##
## ---------------------------
## Packages:


##
## ---------------------------
## Functions:

## ---------------------------

## Set up
source("./r/library.r")
source("./r/util.r")

## Get data
xlsx <- get_xlsx("test.xlsx")
data <- load_data(here("test"))

xlsx
data

## Get xlsx
active <- full_join_data_xlsx(xlsx, data)
active

## Perfom any other actoin
save_xlsx(active, "test.xlsx")


