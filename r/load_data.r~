## ---------------------------
## Name: load data
## Purpose: Load all components and group in the active list
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


load_data <- function(dir) {

    files_l <- get_files(here(dir))
    dtst_obj <- get_file_dtst(here(dir))
    file_data <- get_data(files_l, dtst_obj)

    out <- list(
        files = tibble(file = files_l) %>%
            mutate(load = TRUE),
        dtsts = tibble(dtsts = dtst_obj)  %>%
            mutate(load = TRUE),
        dtst_int = file_data$dtst_int %>%
            mutate(load = TRUE),
        comments = file_data$comments %>%
            mutate(load = TRUE),
        func = file_data$func %>%
            mutate(load = TRUE),
        meta_dtst = file_data$dtst_meta %>%
            mutate(load = TRUE)
    )

    out
}

## Test
## current <- load_data(here('test'))
