## ---------------------------
## Name: get xlsx
## Purpose: Loads/creates xlsx
## Author: Jacob Tiegs
## Date Created: 2022-04-08
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



get_xlsx <- function(xlsx){
    ## if database doesnt exist then create
    if(!file.exists(here(xlsx))){
        print("file does not exist, writing template xlsx")
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

        dbs = dbs %>% lapply(function(x){
            x %>%
                mutate(date = NA)
        })

        write.xlsx(dbs, file = here(xlsx))

        ## write_rds(dbs, here(xlsx))
    } else {
        dbs <- tryCatch({
            ## load the database
            print("File exists, reading data ...")
            sheet_names <- excel_sheets(here("test.xlsx"))
            dbs <- lapply(sheet_names, function(x){
                as_tibble(read_excel("test.xlsx", sheet = x))})
            names(dbs) <- sheet_names
            dbs <- dbs %>%
                lapply(function(x){
                    x = x %>%
                        mutate(date = as_date(date))
                    x
                })
            dbs
        },
        error = function(c){
            message("Error: get_xlsx.r")
            message(c)
        })
    }

    dbs <- dbs %>% lapply(function(x){
        x %>%
            mutate(dbs = TRUE) %>%
            mutate(load = FALSE)
    })

    dbs
}

## test
## xlsx <- get_xlsx("test.xlsx")
