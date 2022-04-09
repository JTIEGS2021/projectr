## ---------------------------
## Name: Main
## Purpose: Main workflow for the excel based workflow
## Author: Jacob Tiegs
## Date Created: 2022-04-08
##
## ---------------------------
## Notes:
## 4 Functional components
## 1. Get the xlsx file
## 2. Load the current data
## 3. Join the xlsx and the current data to make the active dataset
## 4. Save the active dataset
## ---------------------------
## Packages:


##
## ---------------------------
## Functions:

## ---------------------------

## Test on test directory
## ## Set up
source("./r/library.r")
source("./r/util.r")

## ## Get data
## xlsx <- get_xlsx("test.xlsx")
## data <- load_data(here("test"))

## ## Get xlsx
## active <- full_join_data_xlsx(xlsx, data)


## ## Perfom any other actoin
## save_xlsx(active, "test.xlsx")


## Test on the full directory
xlsx <- get_xlsx("full.xlsx")
data <- load_data(here())

data
