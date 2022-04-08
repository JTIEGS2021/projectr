## ---------------------------
## Name: UI
## Purpose: ui page
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
get_ui <- function(){
    ui <- fluidPage(
        titlePanel("Glimmer Project Document"),

        sidebarLayout(
            position = "left",
            sidebarPanel("s1"),
            mainPanel("main",
                      fluidRow(
                          column(12,
                                 dataTableOutput('files'))
                      )
                      )
        )
    )
}

