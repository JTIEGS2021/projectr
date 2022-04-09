## ---------------------------
## Name: get_internal_dtst
## Purpose: Returns the datasets created or used within each file
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

get_internal_dtsts <- function(file,
                               include =
                                   c("\\.[Rr][Dd][Ss]",
                                     "\\.csv",
                                     "\\.tsv",
                                     "\\.[Xx][Ll][Ss][Xx]",
                                     "\\.sas7bdat")
                               ){
    ## collapse list
    inc <- paste0(include, collapse = "|")

    dtst = tryCatch({
        dtst <- readLines(here(file)) %>%
            str_subset(paste0(include, collapse = "|")) %>%
            as_tibble() %>%
            mutate(dtst = str_extract(value, paste0("\"(.*",
                                                    "[",
                                                    inc,
                                                    "])"))) %>%
            mutate(dtst = str_replace(dtst, "\\\"", "")) %>%
            mutate(type = str_extract(value, "read|write"))

        dtst
    },
    error = function(c){
        message("Error: get_internal_dtst.r")
        message(c)
    })
}



## Test
## files <- get_files(here("test"))
## dtsts <- map(files, get_internal_dtsts)
## dtsts
