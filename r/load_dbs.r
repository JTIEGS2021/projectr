## ---------------------------
## Name: load dbs
## Purpose: initialize an empty database
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

load_db <- function(dbs_in){
    ## if database doesnt exist then create
    if(!file.exists(here(dbs_in))){
        dbs = list(files = tibble(file = "blank",
                                  active = FALSE,
                                  dbs = TRUE),
                   dtsts = tibble(dtsts = "blank",
                                  dbs = TRUE),
                   dtst_int = tibble(file = "blank",
                                     datasets = "blank",
                                     dtst = "blank",
                                     type = "blank",
                                     dbs = TRUE),
                   comments = tibble(file = "blank",
                                     comments = "blank",
                                     dbs = TRUE),
                   func = tibble(file = "blank",
                                 functions = "blank",
                                 dbs = TRUE),
                   meta_dtst = tibble(dtst = "blank",
                                      nrow = 0,
                                      var = "blank",
                                      class = "blank",
                                      missing = 0,
                                      val = "blank",
                                      n =0,
                                      dbs = TRUE))

        write_rds(dbs, here(dbs_in))
    } else {
        ## load the database
        dbs = read_rds(here(dbs_in))
    }
    dbs
}

## Test
## dbs <- load_db(here("test/app_dbs.rds"))
