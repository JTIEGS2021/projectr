## ---------------------------
## Name: Documentation Generating Shiny App
## Purpose: Generates a documentation from a project directory and displays in a shiny app for modification and output
## Author: Jacob Tiegs
## Date Created: 2022-03-30
##
## ---------------------------
## Notes:
##
##
## ---------------------------

source("./r/library.r")
source("./r/util.r")
source(here("shiny/ui.r"))
source("./shiny/server.r")

dbs <- load_db(here("./test/app_dbs.rds"))
data <- load_data(here("test"))
active <- full_join_data_dbs(dbs, data)

data

shinyApp(get_ui(), server)

