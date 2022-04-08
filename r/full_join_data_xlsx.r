## ---------------------------
## Name: Full Join data xlsx
## Purpose:
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


full_join_data_xlsx <- function(xlsx, current) {



    ## New or delete function
    new_or_delete <- function(dtst){

       dtst = dtst %>%
            mutate(deleted = ifelse(
                       load.dbs == FALSE &
                       is.na(load.load), TRUE, FALSE
                   )) %>%
            mutate(new =  ifelse(
            (dbs != TRUE | is.na(dbs)) &
            load.load == TRUE, TRUE, FALSE
            )) %>%
           select(-contains("load")) %>%
           mutate(date = ifelse(
                      new == TRUE, Sys.Date(), date)
                  ) %>%
           mutate(date = as_date(date, origin = "1970-01-01"))

        dtst
    }


    ## Full join list
    out <- list(
        files = xlsx$files %>% full_join(current$files, by = "file", suffix = c(".dbs",".load")) %>%
            new_or_delete,
        dtsts = xlsx$dtsts %>% full_join(current$dtsts, by = "dtsts",
                                         suffix = c(".dbs",".load")) %>%
            new_or_delete,
        dtst_int = xlsx$dtst_int %>% full_join(current$dtst_int, by = c("file",
                                                                       "datasets",
                                                                       "dtst",
                                                                       "type"),
                                               suffix = c(".dbs",".load")) %>%
            new_or_delete,
        comments = xlsx$comments %>% full_join(current$comments, by = c("file",
                                                                        "comments"),
                                               suffix = c(".dbs",".load")) %>%
            new_or_delete,
        func = xlsx$func %>% full_join(current$func, by = c("file",
                                                            "functions"),
                                       suffix = c(".dbs",".load")) %>%
            new_or_delete,
        meta_dtst = xlsx$meta_dtst %>% full_join(current$meta_dtst, by = c("dtst",
                                                                          "nrow",
                                                                          "var",
                                                                          "class",
                                                                          "missing",
                                                                          "val",
                                                                          "n"),
                                                 suffix = c(".dbs",".load")) %>%
            new_or_delete
    )

    out
}

## Test
## xlsx <- get_xlsx(here("test.xlsx"))
## xlsx

## current <- load_data(here('test'))
## current

active <- full_join_data_xlsx(xlsx, current)
active

