## ---------------------------
## Name: full join data dbs
## Purpose: Join the current data and the saved dbs
## Author: Jacob Tiegs
## Date Created: 2022-04-03
##
## ---------------------------
## Notes:
## Full Join
## Creates the active dataset
## ---------------------------
## Packages:

##
## ---------------------------
## Functions:

## ---------------------------

full_join_data_dbs <- function(dbs, current) {

    ## New or delete function
    new_or_delete <- function(dtst){
        dtst = dtst %>% mutate(
                     new = case_when(
                     (dbs != TRUE | is.na(dbs)) &
                     load == TRUE ~ TRUE,
                     TRUE ~ FALSE
                     ),
                     deleted = case_when(
                         dbs == TRUE &
                         is.na(load) ~ TRUE,
                         TRUE ~ FALSE
                     )) %>%
            mutate(date = ifelse(
                       new == TRUE, Sys.Date(), date)
                   )
        dtst
    }

    ## Full join list
    out <- list(
        files = dbs$files %>% full_join(current$files, by = "file") %>%
            new_or_delete,
        dtsts = dbs$dtsts %>% full_join(current$dtsts, by = "dtsts") %>%
            new_or_delete,
        dtst_int = dbs$dtst_int %>% full_join(current$dtst_int, by = c("file",
                                                                       "datasets",
                                                                       "dtst",
                                                                       "type")) %>%
            new_or_delete,
        comments = dbs$comments %>% full_join(current$comments, by = c("file",
                                                                       "comments")) %>%
            new_or_delete,
        func = dbs$func %>% full_join(current$func, by = c("file",
                                                           "functions")) %>%
            new_or_delete,
        meta_dtst = dbs$meta_dtst %>% full_join(current$meta_dtst, by = c("dtst",
                                                                          "nrow",
                                                                          "var",
                                                                          "class",
                                                                          "missing",
                                                                          "val",
                                                                          "n")) %>%
            new_or_delete
    )

    out
}


## Test
## dbs <- load_db(here("test/app_dbs.rds"))
## current <- load_data(here('test'))
## active <- full_join_data_dbs(dbs, current)


