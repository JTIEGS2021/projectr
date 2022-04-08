## ---------------------------
## Name: server
## Purpose: Get server
## Author: Jacob Tiegs
## Date Created: 2022-04-03
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


server <- function(input,output, session) {
    output$files <- renderDataTable(active$files)
}
